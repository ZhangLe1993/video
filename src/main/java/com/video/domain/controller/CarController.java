package com.video.domain.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.video.base.controller.BaseController;
import com.video.domain.entity.Buyercart;
import com.video.domain.entity.Buyeritem;
import com.video.domain.entity.Sku;
import com.video.domain.service.BuyercartService;
import com.video.domain.entity.User;
import com.video.utils.Constants;
import com.video.utils.ValidateUtil;

@Controller
@RequestMapping("/car")
public class CarController extends BaseController{
	
	@Autowired
	private BuyercartService buyercartService;
	
	
	@RequestMapping(value="/addItemToItemCar",method= {RequestMethod.GET,RequestMethod.POST})
	public <T> String addItemToItemCar(Long skuId, Integer amount, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ObjectMapper om = new ObjectMapper();
		om.setSerializationInclusion(Inclusion.NON_NULL);
		Buyercart car = null;
		/**
		 * 1、获取Cookie中的购物车
		 */
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0) {
			for(Cookie cookie:cookies) {
				if(Constants.BUYER_CART.equals(cookie.getName())) {
					System.out.println("1、获取Cookie中的购物车");
					car = om.readValue(cookie.getValue(), Buyercart.class);
					break;
				}
			}
		}
		
		/**
		 * 2、Cookie中没有购物车，创建购物车
		 */
		if(null == car) {
			System.out.println("2、Cookie中没有购物车，创建购物车");
			car = new Buyercart();
		}
		
		
		/**
		 * 3、将当前商品追加到购物车
		 */
		if(null!=skuId && amount!=null) {
			System.out.println("3、将当前商品追加到购物车");
			Sku sku = new Sku();
			sku.setSkuId(skuId);
			
			Buyeritem item = new  Buyeritem();
			item.setSku(sku);
			item.setAmount(amount);
			
			car.addItem(item);
		}
		
		/**
		 * 排序  倒序
		 */
		List<Buyeritem> list = car.getList();
		Collections.sort(list,new Comparator<Buyeritem>() {

			@Override
			public int compare(Buyeritem o1, Buyeritem o2) {
				return -1;
			}
			
		});
		
		/**
		 * 判断登录和非登录
		 */
		User user = getCurrentLoginUser();
		if(ValidateUtil.isNotNull(user)) {
			//登录了，将购物车添加到Redis中
			System.out.println(user.getUserLoginName());
			buyercartService.insertBuyerCartToRedis(car,user.getUserLoginName());
			//5, 清空Cookie 设置存活时间为0, 立马销毁
			Cookie cookie = new Cookie(Constants.BUYER_CART, null);
			cookie.setPath("/");
			cookie.setMaxAge(-0);
			response.addCookie(cookie);
		}else {
			//没有登录，存到Cookie中
			//将对象转换成json格式
			System.out.println("没有登录，存到Cookie中");
			Writer w = new StringWriter();
			om.writeValue(w, car);
			Cookie cookie = new Cookie(Constants.BUYER_CART, w.toString());
			//设置path是可以共享cookie
			cookie.setPath("/");
			//设置Cookie过期时间: -1 表示关闭浏览器失效       0: 立即失效        >0: 单位是秒, 多少秒后失效
			cookie.setMaxAge(24*60*60);
			//Cookie写回浏览器
			response.addCookie(cookie);
		}
		return null;
	}
	
	
	
	//去购物车结算, 这里有两个地方可以直达: 1,在商品详情页 中点击加入购物车按钮  2, 直接点击购物车按钮
    @RequestMapping(value="/toBuyerCart")
    public String toBuyerCart(Model model, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException{ 
        //将对象转换成json字符串/json字符串转成对象
        ObjectMapper om = new ObjectMapper();
        om.setSerializationInclusion(Inclusion.NON_NULL);
        Buyercart buyerCart = null;
        //1,获取Cookie中的购物车
        Cookie[] cookies = request.getCookies();
        if (null != cookies && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                //
                if (Constants.BUYER_CART.equals(cookie.getName())) {
                    //购物车 对象 与json字符串互转
                    buyerCart = om.readValue(cookie.getValue(), Buyercart.class);
                    break;
                }
            }
        }
        
        //判断是否登录
        User user = getCurrentLoginUser();
		if(ValidateUtil.isNotNull(user)) {
            //登录了
            //2, 购物车 有东西, 则将购物车的东西保存到Redis中
            if (null != buyerCart) {
            	buyercartService.insertBuyerCartToRedis(buyerCart, user.getUserLoginName());
                //清空Cookie 设置存活时间为0, 立马销毁
                Cookie cookie = new Cookie(Constants.BUYER_CART, null);
                cookie.setPath("/");
                cookie.setMaxAge(-0);
                response.addCookie(cookie);
            }
            //3, 取出Redis中的购物车
            buyerCart = buyercartService.selectBuyerCartFromRedis(user.getUserLoginName());
        }
        
        
        //4, 没有 则创建购物车
        if (null == buyerCart) {
            buyerCart = new Buyercart();
        }
        
        //5, 将购物车装满, 前面只是将skuId装进购物车, 这里还需要查出sku详情
        List<Buyeritem> items = buyerCart.getList();
        if(items.size() > 0){
            //只有购物车中有购物项, 才可以将sku相关信息加入到购物项中
            for (Buyeritem buyerItem : items) {
                buyerItem.setSku(buyercartService.selectSkuById(buyerItem.getSku().getSkuId()));
            }
        }
        
        //5,上面已经将购物车装满了, 这里直接回显页面
        //model.addAttribute("buyerCart", buyerCart);
        map.put("buyerCart", buyerCart);
        
        //跳转购物页面
        return "user/buyerCart";
    }
    
    
    @RequestMapping(value="/toBuyerCartTest.do",method=RequestMethod.GET)
	public String toBuyerCartTest(Model model,ModelMap map) throws Exception
	{
		System.out.println("跳转到购物车页面");
		
		return "user/buyerCart";    //WEB-INF/jsp/list.jsp
	}
}
