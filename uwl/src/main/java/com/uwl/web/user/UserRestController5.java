package com.uwl.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.MailUtils;
import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.domain.User;
import com.uwl.service.user.UserService;

@RestController
@RequestMapping("/userrrrrr/*")
public class UserRestController5 {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	// 메일 인증
	private JavaMailSender mailSender;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//////////////////////////형진 작품//////////////////////////////
	@Value("#{apiProperties['blueApiid']}")
	String apiId;
	@Value("#{apiProperties['blueApiKey']}")
	String apiKey;
	@Value("#{apiProperties['blueSender']}")
	String sender;
	//////////////////////////형진 작품//////////////////////////////

	public UserRestController5() {
		System.out.println(this.getClass());
	}

	// 회원가입
	@RequestMapping(value = "rest/addUser", method = RequestMethod.POST)
	public void addUser(@RequestBody User user) throws Exception {
		System.out.println("/user/rest/addUser : POST");

		userService.addUser(user);
		System.out.println("[addUser end...]");
	}

	// 회원정보 , id 중복체크
	@RequestMapping(value = "rest/getUser/{userId}", method = RequestMethod.GET)
	public User getUser(@PathVariable String userId) throws Exception {

		System.out.println("/user/rest/getUser : GET");

		// Business Logic
		return userService.getUser(userId);
	}

	// nickname 중복체크
	@RequestMapping(value = "rest/getUserByNick/{userId}", method = RequestMethod.GET)
	public User getUserByNickname(@PathVariable String nickname) throws Exception {

		System.out.println("/user/rest/getUser : GET");

		// Business Logic
		return userService.getUserByNickname(nickname);
	}

	// 회원정보 수정
	@RequestMapping(value = "rest/updateUser/{userId}", method = RequestMethod.GET)
	public User updateUser(@PathVariable String userId) throws Exception {

		System.out.println("/user/rest/updateUser : GET");

		User user = userService.getUser(userId);

		return user;
	}

	// 회원정보 수정
	@RequestMapping(value = "rest/updateUser", method = RequestMethod.POST)
	public void updateUser(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/rest/updateUser : POST");
		userService.updateUser(user);
	}

	// 로그인
	@RequestMapping(value = "rest/login", method = RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/rest/login : POST");
		// Business Logic
		System.out.println("::" + user);
		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}

		return dbUser;
	}

	// 회원전체 목록
	@RequestMapping(value = "rest/getUserlist", method = RequestMethod.GET)
	public Map listUser() throws Exception {
		Search search = new Search();

		System.out.println("/user/rest/getUserList : GET ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		map.put("search", search);
		map.put("resultPage", resultPage);
		return map;
	}

	// 회원전체 목록
	@RequestMapping(value = "rest/getUserList", method = RequestMethod.POST)
	public Map listUser(@RequestBody Search search) throws Exception {

		System.out.println("/user/rest/getUserList : POST ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		search.setPageSize((Integer) map.get("totalCount"));

		List<String> listUserId = new ArrayList<String>();
		List<String> listUserName = new ArrayList<String>();
//		List<User> list = (List<User>) userService.getUserList(search).get("list");
		List<User> list = (List<User>) map.get("list");

		for (int i = 0; i < list.size(); i++) {
			listUserId.add(list.get(i).getUserId());
		}

		for (int i = 0; i < list.size(); i++) {
			if (!listUserName.contains(list.get(i).getName())) {
				listUserName.add(list.get(i).getName());
			}
		}

		map.put("listUserId", listUserId);
		map.put("listUserName", listUserName);
		map.put("search", search);
		map.put("resultPage", resultPage);
		return map;
	}

//	// 회원전체 목록
//	@RequestMapping(value ="rest/listUser", method = RequestMethod.GET)
//	public String listUser(@RequestParam("userId") String userId, Model model) throws Exception {
//
//		System.out.println("/user/rest/listUser : GET");
//		// Business Logic
//		List<User> user = userService.getUserList(userId);
//		// Model 과 View 연결
//		model.addAttribute("user", user);
//
//		return "forward:/user/listUser.jsp";
//	}

	// id 중복체크
	@RequestMapping(value = "rest/checkDuplicationUserId", method = RequestMethod.GET)
	public boolean checkDuplicationUserId(@RequestParam String userId) throws Exception {
		System.out.println("/user/rest/checkDuplicationUserId : GET");
		boolean result = userService.checkDuplicationUserId(userId);

//		Map map = new HashMap();
//		map.put("result", new Boolean(result));
//		return map;
		return result;
	}

	// id 중복체크
	@RequestMapping(value = "rest/checkDuplicationUserId", method = RequestMethod.POST)
	public Map checkDuplicationUserId(@RequestBody User user) throws Exception {
		System.out.println("/user/rest/checkDuplicationUserId : POST");
		boolean result = userService.checkDuplicationUserId(user.getUserId());

		Map map = new HashMap();
		map.put("result", new Boolean(result));
		return map;
	}
	
	
	// nickname 중복체크
	@RequestMapping(value = "rest/checkDuplicationNickname", method = RequestMethod.GET)
	public boolean checkDuplicationNickname(@RequestParam String nickname) throws Exception {
		System.out.println("/user/rest/checkDuplicationNickname : GET");
		boolean result = userService.checkDuplicationNickname(nickname);

//		Map map = new HashMap();
//		map.put("result", new Boolean(result));
//		return map;
		return result;
	}
	
	

	// nickname 중복체크
	@RequestMapping(value = "rest/checkDuplicationNickname", method = RequestMethod.POST)
	public Map checkDuplicationNickname(@RequestBody User user) throws Exception {
		System.out.println("/user/rest/checkDuplicationNickname : POST");
		boolean result = userService.checkDuplicationNickname(user.getNickname());

		Map map = new HashMap();
		map.put("result", new Boolean(result));
		return map;
	}
	
	
	// mail 중복체크
	@RequestMapping(value = "rest/checkDuplicationMail", method = RequestMethod.GET)
	public boolean checkDuplicationMail(@RequestParam String mail) throws Exception {
		System.out.println("/user/rest/checkDuplicationMail : GET");
		boolean result = userService.checkDuplicationMail(mail);

//		Map map = new HashMap();
//		map.put("result", new Boolean(result));
//		return map;
		return result;
	}
	
	

	// 나의 문의사항 내역
	@RequestMapping(value = "rest/getUserQuestions", method = RequestMethod.GET)
	public Map getUserQuestions(@ModelAttribute Search search, HttpSession httpSession) throws Exception {
//		Search search = new Search();

		System.out.println("/user/rest/getUserQuestions : GET ");

		User user = (User) httpSession.getAttribute("user");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserQuestions(search, user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("search", search);
		map.put("resultPage", resultPage);
		return map;
	}

//	// 내가 쓴 게시글
//	@RequestMapping(value = "rest/getUserPostList", method = RequestMethod.GET)
//	public Map getUserPostList() throws Exception{
//		Search search = new Search();
//		
//		System.out.println("/user/rest/getUserPostList : GET ");
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String , Object> map=userService.getUserPostList(search);
//		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		map.put("search", search);
//		map.put("resultPage", resultPage);
//		return map;
//	}
//
//	// 내가 쓴 댓글
//	@RequestMapping(value = "rest/getUserCommentList", method = RequestMethod.GET)
//	public Map getUserCommentList() throws Exception{
//		Search search = new Search();
//		
//		System.out.println("/user/rest/getUserCommentList : GET ");
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String , Object> map=userService.getUserCommentList(search);
//		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		map.put("search", search);
//		map.put("resultPage", resultPage);
//		return map;
//	}
//
//	// 내가 좋아요한 글
//	@RequestMapping(value = "rest/getUserLikePostList", method = RequestMethod.GET)
//	public Map getUserLikePostList() throws Exception{
//		Search search = new Search();
//		
//		System.out.println("/user/rest/getUserLikePostList : GET ");
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String , Object> map=userService.getUserLikePostList(search);
//		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		map.put("search", search);
//		map.put("resultPage", resultPage);
//		return map;
//	}

	// id 찾기
	@RequestMapping(value = "rest/findId", method = RequestMethod.POST)
	public User findId(@RequestBody User user) throws Exception {

		System.out.println("/user/rest/findId : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getMail());

		if (user.getMail().equals(dbUser.getMail())) {
			return dbUser;
		}
		return null;

	}

	// pw 찾기
	@RequestMapping(value = "rest/findPw", method = RequestMethod.POST)
	public User findPw(@RequestBody User user) throws Exception {

		System.out.println("/user/rest/findPw : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getUserId());

		if (user.getUserId().equals(dbUser.getUserId())) {
		}

		return userService.getUser(user.getPassword());
	}

//	 mail 인증
	@RequestMapping(value = "rest/checkMail")
	public Map checkMailValue(@RequestBody Map jsonMap) throws Exception {
		System.out.println("user/rest/checkMail");

		// 파싱
		ObjectMapper objectMapper = new ObjectMapper();
		String mapString = objectMapper.writeValueAsString(jsonMap);
		JSONObject jsonObject = (JSONObject) JSONValue.parse(mapString);

		Map<String, String> mailMap = objectMapper.readValue(jsonObject.toString(),
				new TypeReference<Map<String, String>>() {
				});

		String mail = mailMap.get("mail");

		// 메일 인증 시 입력할 값을 생성
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);

		// Autowired된 JavaMailSender로 MailUtils 객체 생성
		MailUtils sendMail = new MailUtils(mailSender);

		// JavaMailSender.setSubject(title) :: 메일 제목 설정
		sendMail.setSubject("[어'울림] 본인 인증");

		// JavaMailSender.setText(text) :: 메일 내용 설정
		// StringBuffer로 작성
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>").append("<p>아래 글자를 입력하시면 이메일 인증이 완료됩니다.</p>")
				.append("<p>입력 문자 :: </p><br/><br/><hr/>")
				// 본인인증을 위한 state를 메일로 발송
				.append("<p>" + state + "</p>").toString());

		// JavaMailSender.setFrom(senderEmail, senderName) :: 메일 작성자 설정
		sendMail.setFrom("a@uwl.com", "어'울림");

		// JavaMailSender.setTo(receiverEmail) :: 메일 수신자 설정
		sendMail.setTo(mail);

		// JavaMailSender.send :: 설정한 내용을 바탕으로 메일 전송
		sendMail.send();

		Map<String, String> returnMap = new HashMap<String, String>();
		returnMap.put("result", "done");

		// 본인인증을 위한 state를 반환
		returnMap.put("mailCheck", state);
		System.out.println("end SendMail");
		return returnMap;
	}

	@RequestMapping(value = "rest/updatePassword", method = RequestMethod.POST)
	public Map updatePassword(@RequestBody HashMap<String, Object> reqMap, HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		User sessionUser = (User)session.getAttribute("user");
		String prePassword = (String)reqMap.get("prePassword");
		String password = (String)reqMap.get("password");
		String sessionPassword = sessionUser.getPassword();
		
		System.out.println("pre : " + prePassword + "\t session : " + sessionPassword);
		System.out.println(sessionPassword.equals(prePassword));
		
		if (sessionPassword.equals(prePassword)) {
			sessionUser.setPassword(password);
			userService.updatePassword(sessionUser);
			session.setAttribute("user", sessionUser);
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		System.out.println(map);
		return map;
	}
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////형진이 작품///////////////////////////////////////////
	@RequestMapping(value = "/rest/sendSms")
	 public String sendSms(String receiver, HttpSession session) {
			System.out.println(receiver);
	        // 6자리 인증 코드 생성
	        int rand = (int) (Math.random() * 899999) + 100000;
	        System.out.println("인증 코드 : " + rand);
	        
	        session.setAttribute("rand", rand);
	        
	        // 인증 코드를 데이터베이스에 저장하는 코드는 생략했습니다.

	        // 문자 보내기 
	        String hostname = "api.bluehouselab.com";
	        String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(apiId, apiKey)
	        );

	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the execution context
	        HttpClientContext context = HttpClientContext.create();
	        context.setCredentialsProvider(credsProvider);
	        context.setAuthCache(authCache);

	        DefaultHttpClient client = new DefaultHttpClient();

	        try {
	            HttpPost httpPost = new HttpPost(url);
	            httpPost.setHeader("Content-type", "application/json; charset=utf-8");

	            String json = "{\"sender\":\""+sender+"\",\"receivers\":[\""+receiver+"\"],\"content\":\""+rand+"\"}";
	            
	            StringEntity se = new StringEntity(json, "UTF-8");
	            httpPost.setEntity(se);

	            HttpResponse httpResponse = client.execute(httpPost, context);

	            InputStream inputStream = httpResponse.getEntity().getContent();
	            if (inputStream != null) {
	                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
	                String line = "";
	                while ((line = bufferedReader.readLine()) != null)
	                    inputStream.close();
	                }
	            } catch (Exception e) {
	                System.err.println("Error: " + e.getLocalizedMessage());
	            } finally {
	                client.getConnectionManager().shutdown();
	            }
	            return "true";
	}	
	
	
		@RequestMapping(value="/rest/smsCheck")
	   public boolean smsCheck(@RequestParam(value = "code") String code, HttpSession session) {
	       String saveCode = (session.getAttribute("rand").toString());
	       System.out.println(saveCode);
	       System.out.println(code);
	       System.out.println("발행한 인증 코드 :"+saveCode);
	       if(code.equals(saveCode)) {
	       	return true;
	       }else {
	       	return false;
	       }
	       
	   }
	
		/////////////////////////////////////////////////////////////////////형진이 작품///////////////////////////////////////////
	
	
}
