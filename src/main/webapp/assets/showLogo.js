/*jQuery(document).ready(function($) {
	
	showlogo();

});

function showlogo(){
	$.ajax({
		url:gbl_ContextPath+"/common/showLogo",
		dataType:"JSON",
		success:function (data) {
			if (data && data != null) {
				if (data.SETIDDEPT == 'XF01') {
					document.getElementById('logo').style.display='block';
				} else {
					document.getElementById('logo').style.display='none';
				}
			} else {
				toastr.warning("获取数据出错");
			}
		}
	})
}

*/