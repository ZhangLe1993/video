function getQQShareContent(url,title,summary,pics){
	var p = {
		url:url, 			/*获取URL，可加上来自分享到QQ标识，方便统计*/
		desc:'', 			/*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
		title:title, 		/*分享标题(可选)*/
		summary:summary, 	/*分享摘要(可选)*/
		pics:pics, 			/*分享图片(可选)*/
		flash: '', 			/*视频地址(可选)*/
		site:'千里孤坟', 		/*分享来源(可选) 如：QQ分享*/
		style:'201',
		width:32,
		height:32
	};
	var s = [];
	for(var i in p){
		s.push(i + '=' + encodeURIComponent(p[i]||''));
	}
	console.log(s);
	return s;
}

function shareToQQ(obj){
	console.log(obj);
	
	var urls = getPath() + $(obj).parents("a").attr("href");
	//console.log(urls);
	var img = $(obj).parent().parent().parent().parent().parent().prev().prev().prev().prev().children().attr("src");
	
	var title = $(obj).parent().parent().parent().parent().parent().prev().children().text();
	
	var summary = $(obj).parents("a").next().children().children().attr("title");
	//console.log(dom);
	url = 'http://connect.qq.com/widget/shareqq/index.html?'+getQQShareContent(urls,title,summary,img).join('&');
	window.open(url);
}

function getQzoneShareContent(url,title,summary,pics){
	var p = {
			url:url,
			showcount:'1',/*是否显示分享总数,显示：'1'，不显示：'0' */
			desc:'',/*默认分享理由(可选)*/
			summary:summary,/*分享摘要(可选)*/
			title:title,/*分享标题(可选)*/
			site:'',/*分享来源 如：腾讯网(可选)*/
			pics:pics, /*分享图片的路径(可选)*/
			style:'203',
			width:98,
			height:22
	};
	var s = [];
	for(var i in p){
		s.push(i + '=' + encodeURIComponent(p[i]||''));
	}
	return s;
}
function shareToQzone(obj){
	var urls = getPath() + $(obj).parents("a").attr("href");
	//console.log(urls);
	var img = $(obj).parent().parent().parent().parent().parent().prev().prev().prev().prev().children().attr("src");
	
	var title = $(obj).parent().parent().parent().parent().parent().prev().children().text();
	
	var summary = $(obj).parents("a").next().children().children().attr("title");
	url = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?'+getQzoneShareContent(urls,title,summary,img).join('&');
	window.open(url);
}

function getWeiboShareContent(url,title,pic){
	var p = {
			url:url,
            appkey:'', /**你申请的应用appkey,显示分享来源(可选)*/
            title:title, /**分享的文字内容(可选，默认为所在页面的title)*/
            pic:pic, /**分享图片的路径(可选)*/
            ralateUid:'', /**关联用户的UID，分享微博会@该用户(可选)*/
            language:'zh_cn' /**设置语言，zh_cn|zh_tw(可选)*/
	};
	var s = [];
	for(var i in p){
		s.push(i + '=' + encodeURIComponent(p[i]||''));
	}
	return s;
}
function shareToWeibo(obj){
	var urls = getPath() + $(obj).parents("a").attr("href");
	var img = $(obj).parent().parent().parent().parent().parent().prev().prev().prev().prev().children().attr("src");
	var title = $(obj).parents("a").next().children().children().attr("title");
	url = 'http://service.weibo.com/share/share.php?'+getWeiboShareContent(urls,title,img).join('&');
	window.open(url);
}