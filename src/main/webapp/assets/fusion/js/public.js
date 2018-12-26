/*搜索框历史记录*/
$(function(){
	$("#nope").focus(function(){
		if ($(this).val() == "") {
			$('#_historyMenuList').show();
		} else {
			$('#_historyMenuList').hide();
		}
	})
	$("#nope").keyup(function(){
		if ($(this).val() == "") {
			$('#_historyMenuList').show();
		} else {
			$('#_historyMenuList').hide();
		}
	});
	$(document).click(function(){
		$('#_historyMenuList').hide();
	});
	$(".stopPop").click(function(e){
		$('#_historyMenuList').show();
		 e.stopPropagation();
	});
})	


/**
 * 模拟form post提交
 * @param URL
 * @param emplid
 * @returns {___anonymous624_627}
 */
function post(URL,emplid,target) {        
    var temp = document.createElement("form");        
    temp.action = URL;        
    temp.method = "post";   
    temp.target = target;
    temp.style.display = "none";        
    var opt = document.createElement("textarea");        
    opt.name = "emplid";        
    opt.value = emplid;              
    temp.appendChild(opt);        
    document.body.appendChild(temp);        
    temp.submit();        
    return temp;        
}  

