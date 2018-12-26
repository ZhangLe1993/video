<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>购物车</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/buyerCart/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resource/buyerCart/css/carts.css">
<style type="text/css">
</style>
</head>
<body>
<section class="cartMain">
	<div class="cartMain_hd">
		<ul class="order_lists cartTop">
			<li class="list_chk">
				<!--所有商品全选-->
				<input type="checkbox" id="all" class="whole_check">
				<label for="all"></label>
				全选
			</li>
			<li class="list_con">商品信息</li>
			<li class="list_info">商品参数</li>
			<li class="list_price">单价</li>
			<li class="list_amount">数量</li>
			<li class="list_sum">金额</li>
			<li class="list_op">操作</li>
		</ul>
	</div>

	<div class="cartBox">
		<div class="shop_info">
			<div class="all_check">
				<!--店铺全选-->
				<input type="checkbox" id="shop_a" class="shopChoice">
				<label for="shop_a" class="shop"></label>
			</div>
			<div class="shop_name">
				店铺：<a href="javascript:;">视频小店</a>
			</div>
		</div>
		<div class="order_content">
			<c:forEach items="${buyerCart.list }" var="buyerItem" varStatus="i">
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_2" class="son_check">
					<label for="checkbox_2"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="${pageContext.request.contextPath }/resource/buyerCart/images/1.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥${buyerItem.sku.price}</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="${buyerItem.amount}" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥${buyerItem.sku.price}</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
			</c:forEach>
		</div>
	</div>

	<div class="cartBox">
		<div class="shop_info">
			<div class="all_check">
				<!--店铺全选-->
				<input type="checkbox" id="shop_b" class="shopChoice">
				<label for="shop_b" class="shop"></label>
			</div>
			<div class="shop_name">
				店铺：<a href="javascript:;">卷卷旗舰店</a>
			</div>
		</div>
		<div class="order_content">
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_4" class="son_check">
					<label for="checkbox_4"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="${pageContext.request.contextPath }/resource/buyerCart/images/4.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥1980</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥1980</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_5" class="son_check">
					<label for="checkbox_5"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="${pageContext.request.contextPath }/resource/buyerCart/images/5.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥480</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥480</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
		</div>
	</div>

	<div class="cartBox">
		<div class="shop_info">
			<div class="all_check">
				<!--店铺全选-->
				<input type="checkbox" id="shop_c" class="shopChoice">
				<label for="shop_c" class="shop"></label>
			</div>
			<div class="shop_name">
				店铺：<a href="javascript:;">卷卷旗舰店</a>
			</div>
		</div>
		<div class="order_content">
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_8" class="son_check">
					<label for="checkbox_8"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="${pageContext.request.contextPath }/resource/buyerCart/images/1.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥1980</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥1980</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_9" class="son_check">
					<label for="checkbox_9"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="${pageContext.request.contextPath }/resource/buyerCart/images/1.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥480</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥480</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
		</div>
	</div>
	<!--底部-->
	<div class="bar-wrapper">
		<div class="bar-right">
			<div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
			<div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
			<div class="calBtn"><a href="javascript:;">结算</a></div>
		</div>
	</div>
</section>
<section class="model_bg"></section>
<section class="my_model">
	<p class="title">删除宝贝<span class="closeModel">X</span></p>
	<p>您确认要删除该宝贝吗？</p>
	<div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
</section>

<script src="${pageContext.request.contextPath }/resource/buyerCart/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/buyerCart/js/carts.js"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>
</body>
</html>