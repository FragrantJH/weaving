package com.weaving.biz.chat;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weaving.biz.emp.EmpVO;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {

	private static final Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	private Map<Integer, WebSocketSession> sessionSet = new HashMap<Integer, WebSocketSession>();

	public SocketHandler() {
		super();
	}

	@Override
	// onClose
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);

		Map<String, Object> map = session.getAttributes();
		EmpVO emp = (EmpVO) map.get("empVO");
		if (emp != null) {
			sessionSet.remove(emp.getEmpNo());
		}
		this.logger.info("remove session!");
	}

	@Override
	// onOpen
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);

		Map<String, Object> attrs = session.getAttributes();
		EmpVO empVo = (EmpVO) attrs.get("empVO");
		
		if(sessionSet.containsKey(empVo.getEmpNo())) {
			sessionSet.remove(empVo.getEmpNo());
		}
		sessionSet.put(empVo.getEmpNo(), session);
	}

	@Override
	// onMessage
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		System.out.println("receive message:" + message.toString());

		// json string을 vo로 변환
		ObjectMapper mapper = new ObjectMapper();
		MsgVO msgvo = mapper.readValue((String) message.getPayload(), MsgVO.class);

		sendMessage(msgvo, (String) message.getPayload());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
	}

	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");
		return super.supportsPartialMessages();
	}

	public void sendMessage(MsgVO msgVo, String message) {
		WebSocketSession toSession = sessionSet.get(msgVo.getToEmpNo());

		if (toSession != null && toSession.isOpen()) {
			try {
				toSession.sendMessage(new TextMessage(message));
			} catch (Exception ignored) {
				System.out.println("fail to send message!");
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		Thread thread = new Thread() {
			int i = 0;

			@Override
			public void run() {
				while (true) {
					try {
						// 1초마다 보낸다
						// sendMessage("send message index " + i++);
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		// thread.start(); //없으면 실행 안됨
	}
}
