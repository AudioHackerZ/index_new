<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
    <title>综合教务管理系统</title>
    <link href="/academic/styles/frameV2/frame.css" rel="stylesheet" type="text/css">
    <link href="/academic/styles/css/message.css" rel="stylesheet" type="text/css">
    <link href="/academic/styles/default/css/main.css" rel="stylesheet" type="text/css">
    <style type="text/css">

        body{margin:0;padding: 0;
           height:100%;
            width:100%;
            overflow: hidden;
            /*-webkit-filter: grayscale(1%);*/
        }
        #shade-div{
            display:none;
            background:black;
            position:absolute;
            z-index:99;
            top:0;left:0;
            width: 100%;height: 100%;
            filter:alpha(opacity=50);
            opacity: 0.5;
        }

        #info-div{
            display:none;
            background:white;
            position:absolute;
            z-index:100;
            top:50%;left:50%;
            width:700px;height:auto;
            margin-top:auto;margin-left:-350px;
            text-align: left;
        }
        div{
            border-radius: 3px;
        }



        #block_div{
            right:5px;
            bottom:0;
            position:absolute;
            z-index:9999;
            width: 300px;
            height: 0;
        }
    </style>
    <script type="text/javascript" src="/academic/styles/js/jquery.js" ></script>

    <script type='text/javascript' src='/academic/dwr/engine.js'></script>
    <script type='text/javascript' src='/academic/dwr/util.js'></script>
    <script type='text/javascript' src='/academic/dwr/interface/messagePush.js'></script>
    <script type="text/javascript">
        //重写engine.js中alert错误信息的方法。
        dwr.engine._errorHandler = function(message, ex) {dwr.engine._errorHandler = function(message, ex) {dwr.engine._debug("Error: " + ex.name + ", " + ex.message, true);};};
//        //通过该方法与后台交互，确保推送时能找到指定用户
        function onLoadInit(){
            var userid = 104900;
            messagePush.onPageLoad(userid);
        }
        //推送信息
        function pushMessageToJsp(autoMessage){
            $("#block_div").html(autoMessage).animate({height:'200px'},300);
        }

        //推送给所有用户的，不用标记已读，关闭页面右下角的消息推送
        function closePush(){
            $("#block_div").animate({height:'0'},300);
        }

        //推送给特定用户的，标记已读，关闭页面右下角的消息推送
        function markRead(mid){
            var pathName = document.location.pathname;
            var index = pathName.substr(1).indexOf("/");
            $.ajax({
                type:'post',
                url:pathName.substr(0,index+1)+'/calendarinfo/updateUserMessageBrowseStatus.do?mid='+mid,
                dataType:'text',
                success:function(){
                    closePush(); //关闭推送框
                }
            });
        }
    </script>
</head>

<body>

<iframe scrolling="no" style="color:gray;" frameborder="0" src="frameset_index.jsp" height="100%" width="100%" ></iframe>
    <div id="block_div"></div>
    <!-- 用户名密码相同不处理，注释下面一行 -->
    
    <div id="shade-div" align="center"  ></div> <!-- 遮罩div -->
    <div id="info-div" class="block"  > <!-- 内容div -->
        <div class="title">
            <div class="titletext"><span>请修改登录密码！</span></div>
            <div class="time">
                <span class="t"></span>
                
                    <span alt="关闭" title="关闭" id="closeAlertInfoShow" onclick="document.getElementById('shade-div').style.display='none';document.getElementById('info-div').style.display='none'" style="text-decoration: none; cursor: pointer;font-size:18px;padding-right:8px;">×</span>
                
            </div>
        </div>
        <div class="content" style="padding:15px 0px 15px 5px;" >
            
        </div>
    </div>
</body>
</html>
