package group3.nick.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import group3.henry.login.model.MemberVO; 
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import group3.beef.employee.model.EmployeeVO;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

@ServerEndpoint(value = "/chatServer", configurator = HttpSessionConfigurator.class)
public class ChatServer {
	private static CopyOnWriteArraySet<ChatServer> webSocketSet = new CopyOnWriteArraySet<ChatServer>();
	private Session session;
	private String userId;
	private HttpSession httpSession;
	private static List userlist = new ArrayList<>(); //用戶列表
	private static Map routetab = new HashMap<>();	//用戶名和WebSocket綁定列表
	
	 /**
     * 連接成功調用的方法
     * @param session  可選參數。session為與某個客戶端的連接會話，需要通過它來给客戶端發送數據
     */
	@OnOpen
	public void onopen(Session session,EndpointConfig config){
		this.session= session;
		webSocketSet.add(this); //加入set中
		this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		if(httpSession.getAttribute("memberVO")!=null){
		MemberVO M =(MemberVO)httpSession.getAttribute("memberVO");
		this.userId=M.getName();
		String message = getMessage("您好"+userId+"，歡迎來到愛美診所客服服務系統", "notice", userlist);
		singleSend(message,session);
		}else{
		EmployeeVO E=(EmployeeVO)httpSession.getAttribute("empVO");
		this.userId=E.getName();
		userlist.add(userId);//將用戶名加入再線列表
		String mes = getMessage("客服"+userId+"進入,很高興為您服務","notice",userlist);
		broadcast(mes);
		}
		routetab.put(userId, session);   //將用戶名和session绑定到路由表


	}
	
	
    /**
     * 接收客戶端的message
     * @param _message 客戶端發送的消息
     */
    @OnMessage
    public void onMessage(String _message) {
        JSONObject chat = JSON.parseObject(_message);
        JSONObject message = JSON.parseObject(chat.get("message").toString());
            String [] userlist = message.get("to").toString().split(",");
            singleSend(_message, (Session) routetab.get(message.get("from")));      //發送給自己
            for(String user : userlist){
                if(!user.equals(message.get("from"))){
                    singleSend(_message, (Session) routetab.get(user));     //發送給個別指定用戶
                }
            }
        }

    @OnError
    public void onError(Throwable error){
        error.printStackTrace();
    }
    
    /**
     * 連結關閉的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //從set中删除
        if(userlist.contains(userId) ){
        userlist.remove(userId);//從再線列表移除使用者
        }
        routetab.remove(userId);
        String message = getMessage("","notice",userlist);
        this.broadcast(message);
    }
    
    /**
     * 廣播
     * @param message
     */
    public void broadcast(String message){
        for(ChatServer chat: webSocketSet){
            try {
                chat.session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }
    }
    
    

    /**
     * 對特定用戶發送消息
     * @param message
     * @param session
     */
    public void singleSend(String message, Session session){
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	
	
	  /**
     * 組裝返回前台的消息
     * @param message   交互訊息
     * @param type      訊息種類
     * @param list      在線列表
     * @return
     */
    public String getMessage(String message, String type, List list){
        JSONObject member = new JSONObject();
        member.put("message", message);
        member.put("type", type);
        member.put("list", list);
        return member.toString();
    }

	
	
}



