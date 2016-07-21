<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/login/css/login.css"
	rel="stylesheet">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">

<title>客服諮詢系統</title>
<style>
*{
font-family: 微軟正黑體;	

}
</style>
</head>
<body>
	<s:include value="/General/header.jsp"></s:include>

	<article>
		
		</div>


		<div id ="youdidntchoose">
		<br>
		<p align="center" style="font-size:40PX;font-family:微軟正黑體;color:#8F4586">選擇客服</p>
		
			<div  style="border-radius:10pX;border:3pX pink double;width: 600PX;height: 600PX;margin: 0 auto;">
				<br>
				<p style="font-size:20PX">
					在線客服列表[<span id="onlinenum"></span>]
				</p>
				</br>
				<ul id="list"></ul>
			</div>
		</div>
		
		
		<div id="whenuchoose" style="margin: 0 auto;width:1200PX">
		<br>
		<br>
		
			<!-- 聊天區 -->
			<div id="chat-view" style="margin-bottom: 20PX">
				<textarea id="chat" rows="30" cols="150" readonly="readonly"></textarea>
			</div>
			<!-- 輸入區 -->
			<div>
				<textarea class="" id="message" name="message" rows="3" cols="140"
					placeholder="請輸入您想發送的消息"></textarea> <button type="button" style="font-size:1pt; width:50px;height:px;color:#000000 ;float:right;margin-right: 10px"  onclick="sendMessage()">發送訊息</button>
			</div>
			<!-- 按鈕區 -->
			<div>
				<button type="button" onclick="closeConnection()">離開對話</button>
				<button type="button" onclick="clearConsole()">清除對話框</button>
			
			</div>
	</article>
	
	<script src="js/jquery-1.9.1.js"></script>
	<script>
	$(function(){
		$("#whenuchoose").hide();
		$("#youdidntchooseC").hide();

		
	})
	
	
	</script>


		<script>
		var wsServer = null;
		var ws = null;
		var to = null;
		var from = null;
		wsServer = "ws://" + location.host
				+ "${pageContext.request.contextPath}" + "/chatServer";
		ws = new WebSocket(wsServer); //創建WebSocket實例
		ws.onopen = function(evt) {
			console.log("建立連接")
		};

		ws.onmessage = function(evt) {
			analysisMessage(evt.data); //解析後台傳回的消息,並展示
		};
		
		 ws.onerror = function (evt) {
		     console.log("產生錯誤")
		 };
		 
		 ws.onclose = function (evt) {
		     console.log("關閉連接");
		 };

		function analysisMessage(message) {
			message = JSON.parse(message);
			if (message.type == "message") { //會話消息
				showChat(message.message);

			}
			if (message.type == "notice") { //提示消息
				showNotice(message.message);
			
			}
			if (message.list != null && message.list != undefined) { //再線上列表
				showOnline(message.list);
			}
		}

	    /**
	     * 展示會話信息
	     */
	    function showChat(message){
	        var to = message.to;   //獲取接收人
	        from = message.from;
	        chat.textContent = chat.textContent+"\n"+message.from+"發表於"+message.time+":"+message.content;
			var chatjq = $("#chat");
			chatjq.scrollTop(chatjq[0].scrollHeight); //讓聊天室往下 
	    }
	    
	    /**
	     * 展示提示信息
	     */
	    function showNotice(notice){
	    	chat.textContent = chat.textContent+notice+"\n";
	    }
	    
	    /**
	     * 展示在線上的客服
	     */
	    function showOnline(list){
	        $("#list").html("");    //清空再線列表
	        $.each(list, function(index, item){     //添加私聊按钮
	            var li = "<li>"+item+"</li>";
	            if('${memberVO.name}' != item){    //排除自己
	                li = "<li>客服"+item+" <button type=\"button\" onclick=\"addChat('"+item+"');\">進行諮詢</button></li>";
	            }
	            $("#list").append(li);
	        });
	        $("#onlinenum").text($("#list li").length);     //獲取再現人數
	    }
	    
	    /**
	     * 發送信息給後台
	     */
	    function sendMessage(){
	        if(to == null){
	        	to=from;
	        }
	        if(to == null){
	            console.log("連接未開啟");
	            return;
	        }
	        var message = $("#message").val();
	        
	        if(message == null || message == ""){
	            console.log('請打字');
	            return;
	        }
	     	
	        clearmessage();

	        ws.send(JSON.stringify({
	            message : {
	                content : message,
	                from : '${memberVO.name}',
	                to : to,      //接收人 無接收人為空
	                time : getDateFull()
	            },
	            type : "message"
	        }));
	       
	       
	    }
	    
	    /**
	     * 關閉連接
	     */
	    function closeConnection(){
	        if(ws != null){
	            ws.close();
	            ws = null;
	            $("#list").html("");    //清空在線列表
	            console.log("關閉連接");
	        }else{
	        	 console.log("未開啟連接");

	        }
	        
	        window.location.href = 'http://localhost:8081/AmyClinic/index.jsp';
	       
	    }
	    
	    
	    /**
	     * 添加接收人
	     */
	    function addChat(user){
	        
	    	to = user;
	 		$("#youdidntchoose").fadeOut(1500);
			$("#whenuchoose").fadeIn(3000);


	    }
	    
	    
	    /*
	     * 清掉訊息 
	     */
	    function clearmessage(){
	    	message.value="";
	    }

	    function appendZero(s){return ("00"+ s).substr((s+"").length);}  //補0函數
	    
	    /**
	     *  獲得當前時間
	     */
	    function getDateFull(){
	        var date = new Date();
	        var currentdate = date.getFullYear() + "-" + appendZero(date.getMonth() + 1) + "-" + appendZero(date.getDate()) + " " + appendZero(date.getHours()) + ":" + appendZero(date.getMinutes()) + ":" + appendZero(date.getSeconds());
	        return currentdate;
	    }
	    
	 	/**直接關掉Websocket事件
	 	 *
	 	 */
	    function goodbye() {
	        ws.close();
	    }
	 	
	 	
	    /**
	     * 清空聊天區
	     */
	    function clearConsole(){
	        chat.textContent="";
	        
	    }
	 	
	  	/**
	  	 * 當瀏覽器窗口 文檔 或其資源將卸載時 會觸發beforeunload事件
	  	 */
	    window.addEventListener("beforeunload", goodbye, false);
	    
	</script>



	<s:include value="/General/footer.jsp"></s:include>


</body>
</html>