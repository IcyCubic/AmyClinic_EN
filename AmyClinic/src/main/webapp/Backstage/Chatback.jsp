<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<div id="wrapper"><!-- all -->
<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->

<div id="page-wrapper" style=background-color:#BFB2AB  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                <div class="page-header" >
 <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#BFB2AB" direction="right" height="20" scrollamount="5" behavior="alternate"></font></marquee>                                           
                </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">線上諮詢</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->
<!--         開始 -->
<%-- ${memberVO.name }  提示訊息:<span id="chatnotice"></span> --%>
<!-- 聊天區 -->
	 <div id="chat-view" style="margin-bottom: 20PX;margin-left: 50px;margin-right: 50px;margin-top: 10px;" >
	 	<textarea  class="form-control"  id="chat" rows="20" readonly="readonly" style="background-color: : yellow" ></textarea>

<!-- 列表區 -->
<!--      <div  style="float:right;"> -->
<!--          <h3 >再線列表[<span id="onlinenum"></span>]</h3> -->
<!--          <ul  id="list"></ul>  -->
<!--      </div>	  -->


<!--      </div> -->
     
<!-- 輸入區 -->     
	 <div style="margin-top: 10px;">
	     <textarea class="form-control" id="message" name="message" rows="1" style="width: 600px;" placeholder="請輸入您想發送的消息"></textarea>
	 </div>

     
     
<!-- 按鈕區 -->

<div>

	 <button type="button" onclick="closeConnection()"class="btn btn-danger">離開對話</button>	
     <button  type="button" onclick="clearConsole()"class="btn btn-info">清除對話框</button>
     <button  type="button" onclick="sendMessage()"class="btn btn-success">發送訊息</button>
</div>     
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
// 	        chat.textContent = chat.textContent+"\n"+message.from+"發表於"+message.time+"發送給:"+to+message.content;
	        chat.textContent = chat.textContent+"\n"+message.from+"發表於"+message.time+":"+message.content;
	        from = message.from;
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
	        
	        clearmessage();
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
	        
	        window.location.href = 'http://localhost:8081/AmyClinic/Backstage/b_login.jsp';
	    }
	    
	    /*
	     * 清掉訊息 
	     */
	    function clearmessage(){
	    	message.value="";
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