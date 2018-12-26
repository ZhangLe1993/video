<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选择文件 - 上传视频_上传你想分享的视频 — 56.com</title>
    <meta name="keywords" content="上传视频" />
    <meta name="description" content="56网给你提供视频上传空间、您可以将你想分享的视频上传到56网与1亿网民分享快乐。分享你的视频到56网，分享你我他。" />
    <link rel="search" type="application/opensearchdescription+xml" href="http://so.56.com/opensearch/provider.xml" title="56视频" />
    <script src="http://s1.56img.com/script/static/template/pagehook.js"></script>
    <script src="http://s1.56img.com/script/static/upload/v5/config.js"></script>
    <script>
        pageHook.beforeHeadEnd();
    </script>
</head>
<body>
<div id="wrap" class="page_hook_wrap">
        <script>
            pageHook.afterBodyStart();
        </script>
        <div class="sub_header">
                <h2 class="upload_title">上传视频</h2>
                <div id="step_bar" class="step_bar step_bar_position"></div>
        </div>
        <div class="wrapper">
                <div class="sub_wrapper">
                        <div id="upload_step_1" class="upload_step upload_step_1 hidden"></div>

                        <div id="file_uploader" class="file_uploader"></div>

                        <div id="upload_step_2" class="upload_step upload_step_2 hidden">
                                        <div class="info_title">只差一点啦，请在下方补充视频信息：</div>
                                        <div class="info_form clearfix">


                                        </div>
                        <!--<div class="upload_form_btn">-->
                                <input checked="checked" name="syncItem" id="sync_item" value="0" type="hidden" class="sync_input" />
        <!--                    <a href="#" class="save-btn" id="saveForm">保存</a>
                        </div>-->
                        <div class="share-box">
                                <div class="share-icon"></div>
                                <div class="wechat-box">
                                <a href="http://app.56.com/cooperate2/index.php?action=Weibo&do=Run&tag=weixin" class="rp_wechat" title="微信" data-statkey="admin_2_18140705" target="_blank"></a>
                            </div>
                            <a href="http://app.56.com/cooperate2/index.php?action=Weibo&do=Run" target="_blank" class="goset" data-statkey="admin_2_18140732">还能显示在视频上，去设置>></a>
                        </div>
                                        <input type="hidden" id="flv_id" name="flvid" />
                                <div id="upload_form_complete" class="upload_form_complete" style="display: none;">
                                <p>请不要关闭窗口，视频上传完毕将自动保存!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">修改视频信息</a></p>
                        </div>
                        </div>
                </div>
                <div class="huati_entrance_wrapper clearfix" id="topicSum" style="display:none;">

                        <span class="huati_tip_logo">话题汇</span>
                        <div></div>
                        <!--
                        <div class="huati1">
                                <span class="huati_title" title="第五十届金马奖，你心目中的影帝影后？">第五十届金马奖，你心目中的影帝影后？</span><span class="huati_info">(9999个视频) &nbsp;<a href="#">我要参加>></a></span>
                        </div>
                        <div class="huati2">
                                <span class="huati_title" title="光棍节，我也要脱单光棍节，我也要脱单光棍节，我也要脱单">光棍节，我也要脱单光棍节，我也要脱单光棍节，我也要脱单</span><span class="huati_info">(9999个视频) &nbsp;<a href="#">我要参加>></a></span>
                        </div>
                        -->
                </div>

                <div class="upload_faq">
                        <h3 class="faq_title">常见问题集</h3>
                        <ul class="faq_list">
                                <li><a href="http://www.56.com/help/vshow/vshow_3.html#t6" target="_blank">如何获得高清、超清视频标识？</a></li>
                                <li><a href="http://www.56.com/help/vshow/vshow_3.html#t5" target="_blank">上传视频的处理流程</a></li>
                                <li><a href="http://www.56.com/help/vshow/vshow_share.html" target="_blank">如何让视频被更多人看到</a></li>
                                <li><a href="http://www.56.com/help/vshow/vshow_3.html" target="_blank">其它上传常见问题</a></li>
                        </ul>
                </div>
        </div>

        <div id="upload_msg_dialog" class="mod56_dialog dialog_fixed repeat_tips hidden">
                <div class="mod56_dialog_in">
                        <div class="mod56_dialog_hd">
                                <div class="mod56_dialog_hd_extra"><a href="#" title="关闭" class="mod56_dialog_close dialog_close">关闭</a></div>
                                <div class="mod56_dialog_hd_title"><h3>提示</h3></div>
                        </div>
                        <div class="mod56_dialog_bd"><p></p></div>
                        <div class="mod56_dialog_ft"></div>
                </div>
        </div>

        <div id="upload_cancel_dialog" class="mod56_dialog dialog_fixed cancel_tips_pop hidden">
                <div class="mod56_dialog_in">
                        <div class="mod56_dialog_hd">
                                <div class="mod56_dialog_hd_extra"><a class="mod56_dialog_close dialog_close" title="关闭" href="#">关闭</a></div>
                                <div class="mod56_dialog_hd_title"><h3>提示</h3></div>
                        </div>
                        <div class="mod56_dialog_bd">
                                <p><s class="warn_icon"></s>您确定取消上传当前视频文件吗？</p>
                        </div>
                        <div class="mod56_dialog_ft">
                                <a class="btn_s1 dialog_close" href="#"><span>继续上传</span></a>
                                <a class="btn_s3 upload_cancel" href="#"><span>换个视频</span></a>
                        </div>
                </div>
        </div>
                <script>
                        require('/page/upload/video/4.x/');

            var objcmt=null;
            objcmt = {

                    "refreshSyncLinks": function(){

                    weibo.getSyncUploadIcon($(".share-icon"));
                }
            }

            $(document).ready(function(){
                    //weibo.getSyncPlayIcon($(".share-box"));
                    var userId = usr.user_id();
                    if(userId){

                            weibo.getSyncUploadIcon($(".share-icon"));
                            weixinShow();
                    }
            });

            var preLoginSuccess = window.onLoginSucces;
            window.onLoginSucces = function(){

                preLoginSuccess();
                weibo.getSyncUploadIcon($(".share-icon"));
                weixinShow();
            }

            /*获取微信信息*/
            function weixinShow(){

                    var weixinUrl = weibo.getUrl('GetWeiXin', '', '');
                    $.ajax({

                    type: "get",
                    url: weixinUrl,
                    dataType: "jsonp",
                    jsonp: "_cbk",
                    data:'backType=string',
                    success:function(weixinData){

                            weixinDataOb = eval('(' + weixinData + ')');
                                    if(weixinDataOb.bind == 1){

                                            $(".rp_wechat").addClass('binded');
                                    }
                    }
                }) 
            }
        </script>
        <script>
            pageHook.beforeBodyEnd();
        </script>
    </div>
</body>
</html>