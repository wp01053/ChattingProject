package com.study.jsp.chat;

import java.io.IOException;

import javax.sql.DataSource;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class Broadcast {
	private static final java.util.Set<Session> sessions = java.util.Collections
			.synchronizedSet(new java.util.HashSet<Session>());

	private static final java.util.Map<Session, String> clientMap = java.util.Collections
			.synchronizedMap(new java.util.HashMap<Session, String>());

	private static final java.util.Map<Session, String> chatMap = java.util.Collections
			.synchronizedMap(new java.util.HashMap<Session, String>());

	// session에 ID 값을 넣으면 설정된 ID값 나옴
	private static Broadcast instance = new Broadcast();

	static DataSource dataSource = null;

	public static Broadcast getInstance() {
		return instance;
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("Open session id : " + session.getId());

		System.out.println("그냥 session : " + session);

		System.out.println("그냥 sessions : " + sessions);

		sessions.add(session);
	}

	@OnMessage
	public void onMessage(String message, Session session) {

		// 사용자 id 와 보낼 메세지 방번호는 substring 으로 자름
		int nTmp = message.indexOf("");
		String t1 = message.substring(nTmp + 5);

		String id = message.substring(5, 10);
		System.out.println("id =" + id);
		String CNUM = message.substring(0, 5);

		boolean containsKey = clientMap.containsKey(session);

		if (containsKey == false) {
			clientMap.put(session, id);

			chatMap.put(session, CNUM);

		}

		System.out.println("클라이언트 값 : " + clientMap.values());

		System.out.println("채팅방 값 : " + chatMap.values());

		for (Session test : Broadcast.sessions) {
			System.out.println("웹소켓 세션 : " + test.getId());
		}

		System.out.println("-----------");

		System.out.println("원래 보내는 메세지 : " + message);

		System.out.println("내용만 자른 메세지 = " + t1);
		System.out.println("클라이언트에서 서버로 보내는 방 번호 = " + CNUM);

		System.out.println(containsKey);
		System.out.println("-----------");

//		if (chatMap.get(session) != null) {
		for (Session client : Broadcast.sessions) {
			System.out.println(chatMap.get(client));
			System.out.println(CNUM);
			if (CNUM.equals(chatMap.get(client))) {


				System.out.println(client.getId() + "Message from " + session.getId() + " : " + message);

				if (!client.getId().equals(session.getId())) {

					try {
						client.getBasicRemote().sendText(t1);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}

		}


	}

	@OnClose
	public void onClose(Session session) {
		clientMap.remove(session);
		chatMap.remove(session);

		sessions.remove(session);
	}

}