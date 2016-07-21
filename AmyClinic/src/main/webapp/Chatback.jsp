<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chatback</title>
</head>
<body>


${empVO.name } 進入者:${memberVO.name }  提示訊息:<span id="chatnotice"></span>
<!-- 聊天區 -->
	 <div id="chat-view" style="margin-bottom: 20PX" >
	 	<textarea  id="chat" rows="30" cols="150" readonly="readonly"></textarea>

<!-- 列表區 -->
<!--      <div  style="float:right;"> -->
<!--          <h3 >再線列表[<span id="onlinenum"></span>]</h3> -->
<!--          <ul  id="list"></ul>  -->
<!--      </div>	  -->


<!--      </div> -->
     
<!-- 輸入區 -->     
	 <div>
	     <textarea class="" id="message" name="message" rows="3" cols="150" placeholder="請輸入您想發送的消息"></textarea>
	 </div>

     
     
<!-- 按鈕區 -->

<div>

	 <button type="button" onclick="closeConnection()">斷開</button>	
     <button  type="button" onclick="clearConsole()">刷評</button>
     <button  type="button" onclick="sendMessage()">發送</button>
</div>     
	
	<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

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
	        chat.textContent = chat.textContent+"\n"+message.from+"發表於"+message.time+"發送給:"+to+message.content;
			var chatjq = $("#chat");
			chatjq.scrollTop(chatjq[0].scrollHeight); //讓聊天室往下 
	    }
	    
	    /**
	     * 展示提示信息
	     */
	    function showNotice(notice){
	    	chatnotice.textContent = notice+"\n";
	    }
	    
	    /**
	     * 展示在線上的客服
	     */
	    function showOnline(list){
	        $("#list").html("");    //清空再線列表
	        $.each(list, function(index, item){     //添加私聊按钮
	            var li = "<li>"+item+"</li>";
	            if('${memberVO.name}' != item){    //排除自己
	                li = "<li>"+item+" <button type=\"button\" onclick=\"addChat('"+item+"');\">私聊</button></li>";
	            }
	            $("#list").append(li);
	        });
	        $("#onlinenum").text($("#list li").length);     //獲取再現人數
	    }
	    
	    /**
	     * 發送信息給後台
	     */
	    function sendMessage(){
	        if(ws == null){
	            console.log("連接未開啟");
	            return;
	        }
	        var message = $("#message").val();
	        
	        if(message == null || message == ""){
	            console.log('請打字');
	            return;
	        }
	        
	        if(to == null){
	        	to=from;
	        }
	        ws.send(JSON.stringify({
	            message : {
	                content : message,
	                from : '${empVO.name}',
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
	    }
	    
	    
	    /**
	     * 添加接收人
	     */
	    function addChat(user){
	        
	    	to = user;

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

</body>
</html>