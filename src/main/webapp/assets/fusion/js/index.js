/*index右侧点击*/
/*$(function(){
	var lis=$(".rightsider-bar").children();
	lis.each(function(){
		$(this).click(function(e){
			$(".lefsider-popover").hide();
			$(this).children(".index-popover").toggle();
			$(this).siblings().children(".index-popover").hide();
			 e.stopPropagation();
		})
		
	})
	
})
$(document).click(function(){
	$(".lefsider-popover").hide();
	$(".index-popover").hide();
})*/
$(function(){
	var lis=$(".rightsider-bar").children();
	lis.each(function(){
		$(this).hover(function(){
		$(this).children(".index-popover").show();	
		$(this).siblings().children(".index-popover").hide();
		 var x=$(this).offset().top;
			var y=$(".rightsider").offset().top;
			 var a=x-y;
			 var x1=$(this).offset().left;
			 var y1=$(".rightsider").offset().left;
			 var a1=x1-y1;

			 
			if(a>=310){
				if(a1==0){
					$(this).children(".index-popover").css("top","-290px");
				$(this).children(".index-popover").removeClass("posLeft1");
				$(this).children(".index-popover").addClass("posLeftUp1");
				}else if(a1==144){
					$(this).children(".index-popover").css("top","-290px");
				$(this).children(".index-popover").removeClass("posLeft2");
				$(this).children(".index-popover").addClass("posLeftUp2");
				}else if(a1==288){
					$(this).children(".index-popover").css("top","-290px");
				$(this).children(".index-popover").removeClass("posLeft3");
				$(this).children(".index-popover").addClass("posLeftUp3");
				}else{
					$(this).children(".index-popover").css("top","-290px");
				$(this).children(".index-popover").removeClass("posLeft4");
				$(this).children(".index-popover").addClass("posLeftUp4");
				}
				
				
			}
		
		},function(){
			$(this).children(".index-popover").hide();
		})
	
		
	
	})
})


/*index左侧点击*/
$(function(){
	var lis=$(".leftsider-body").children().children();
	lis.each(function(){
		$(this).hover(function(){
			$(this).children(".lefsider-popover").show();
			$(this).siblings().children(".lefsider-popover").hide();
		},function(){
			$(this).children(".lefsider-popover").hide();
		})
		
		
		
	
		
		/*$(this).click(function(e){
			$(".index-popover").hide();
			$(this).children(".lefsider-popover").toggle();
			$(this).siblings().children(".lefsider-popover").hide();
			e.stopPropagation();
		})*/
	})
})
/*滚动条*/
$(function(){
 var handleScrollers = function () {
        $('.scroller').each(function () {
                $(this).slimScroll({
                        size: '7px',
                        color: '#a1b2bd',
                        position: isRTL ? 'left' : 'right',
                        height: $(this).attr("data-height"),
                        alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false),
                        railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false),
                        disableFadeOut: true
                    });
            });
    }

})




/*首页左侧的司龄*/
$(function(){
var index=$(".workYear").html();
if(index<5){
	$('.workYear').css("background-image","url("+gbl_ContextPath+"/assets/fusion/images/index-leftsider/icon-star.png)")
}else if(5<=index && index<10){
	$('.workYear').css("background-image","url("+gbl_ContextPath+"/assets/fusion/images/index-leftsider/icon-drill.png)")
}else if(index>=10){
	
	$('.workYear').css("background-image","url("+gbl_ContextPath+"/assets/fusion/images/index-leftsider/icon-crown.png)")
}


})
