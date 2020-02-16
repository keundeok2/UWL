package com.uwl.common.socket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {

	public ReplyEchoHandler() {
		System.out.println("ReplyEchoHandler()........");
	}
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//Connection 연결 되었을 때 => Client가 서버에 접속했을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		System.out.println(sessions);
	}
	
	//Socket에 Message를 보냈을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage  : " + session + "   :   " + message);
		String senderId = session.getId();
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + " : " + message.getPayload()));
		}
	}
	
	//Connection이 Close 되었을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed  : " + session + "   :   " + status);
	}
	
}
