package com.uwl.service.fcm.impl;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;
import com.uwl.common.NotificationRequest;
import com.uwl.service.domain.User;
import com.uwl.service.fcm.FcmService;

@Service
public class FcmServiceImpl implements FcmService {

	public FcmServiceImpl() {
		System.out.println("FcmServiceImpl run()...");
	}
	
	private final Map<String, String> tokenMap = new HashMap<>();
	
	@PostConstruct
	public void init() {
		try {
			FileInputStream serviceAccount =
					  new FileInputStream("C:\\Users\\User\\Downloads\\webuwl-firebase-adminsdk-cdwqm-f2eba118f1.json");
					FirebaseOptions options = new FirebaseOptions.Builder()
					  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
					  .setDatabaseUrl("https://webuwl.firebaseio.com")
					  .build();
					FirebaseApp.initializeApp(options);
			System.out.println("Firebase application has been initialized");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void send(NotificationRequest notificationRequest) throws Exception {
		System.out.println("run FCMService send()");
		Message message = Message.builder()
				.setToken(notificationRequest.getToken())
				.setWebpushConfig(WebpushConfig.builder().putHeader("ttl", "300")
						.setNotification(new WebpushNotification(notificationRequest.getTitle(), notificationRequest.getMessage(), notificationRequest.getIcon()))
						.build())
				.build();
		
		String response = FirebaseMessaging.getInstance().sendAsync(message).get();
		System.out.println("Sent Message : " + response);
	}

	@Override
	public void register(String userId, String token) throws Exception {
		tokenMap.put(userId, token);
        System.out.println("tokenMap : " + tokenMap);
	}

	@Override
	public void deleteToken(String userId) throws Exception {
		tokenMap.remove(userId);
	}

	@Override
	public String getToken(String userId) throws Exception {
		return tokenMap.get(userId);
	}

	@Override
	public void sendNotification(NotificationRequest request) throws Exception {
		try {
        	System.out.println("run sendNotification");
            this.send(request);
        } catch (InterruptedException | ExecutionException e) {
        	e.printStackTrace();
        }
		
	}

	@Override
	public void createReceiveNotification(String senderId, String receiverId) throws Exception {
		System.out.println("run CreateReceiveNotification");
    	NotificationRequest request = new NotificationRequest();
    	request.setTitle("어'울림 알림메시지");
    	request.setToken(this.getToken(receiverId));
    	request.setMessage(senderId +"님으로부터 알림이 도착했습니다.");
    	request.setIcon("/images/20191231507059.jpg");
    	this.sendNotification(request);
	}
	
	
}
