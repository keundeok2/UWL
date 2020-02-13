package com.uwl.web.user;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uwl.common.OracleToMongo;
import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.schoolRank.SchoolRankService;
import com.uwl.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;

//	메일 인증
//	@Resource(name="mailSender")
//	private JavaMailSender mailSender;	

	public UserController() {
		System.out.println(this.getClass());
		System.out.println("UserController() 객체 생성");
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	// 회원가입
	@RequestMapping(value = "addUser", method = RequestMethod.GET)
	public String addUser() throws Exception {
		System.out.println("UserController : addUser() 호출");

		System.out.println("/user/addUser : GET");

		return "redirect:/user/addUserView.jsp";
	}

	// 회원가입
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) throws Exception {
		System.out.println("UserController : addUser() 호출");
		System.out.println(user);
		System.out.println("/user/addUser : POST");
		
		// Business Logic
		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String name = "";
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path, file.getOriginalFilename()));
			name = file.getOriginalFilename();
			user.setProfileName(name);
			userService.addUser(user);
			return "redirect:/user/loginView.jsp";
		}else {
			user.setProfileName("empty.jpg");
			userService.addUser(user);
			return "redirect:/user/loginView.jsp";
		}

		// ======================================= 채 팅
		// ===========================================
		// 있으면 update , 없으면 insert 이거 방법뭐임? 이 메서드 돌릴때 다른 패키지에 있는 .java 파일 실행시키고싶음

//		OracleToMongo oracleToMongo = new OracleToMongo();
//		oracleToMongo.startOracleToMongo();
		// ======================================= 채 팅
		// ===========================================

		// SchoolRank 추가하기!!!!!!!!!!!!!!!

	}

	// 실명인증여부
	@RequestMapping(value = "addRealname", method = RequestMethod.POST)
	public String addRealname(@ModelAttribute("user") User user) throws Exception {
		System.out.println("UserController : addRealname() 호출");

		System.out.println("/user/addRealname : POST");
		// Business Logic
		userService.addRealname(user);

		return "redirect:/user/loginView.jsp";
	}


	// 회원정보 보기
	@RequestMapping(value = "getUser", method = RequestMethod.POST)
	public String getUser(@ModelAttribute("user") User user) throws Exception {
		System.out.println("UserController : getUser() POST 호출");

		System.out.println("/user/getUser : POST");
		// Business Logic
//			userService.getUser(userId);

		return "redirect:/user/getUser?userId=" + user.getUserId();
	}

	// 회원정보 수정
	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : updateUser() GET 호출");

		System.out.println("/user/updateUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);

		return "forward:/user/updateUser.jsp";
	}

	// 회원정보 수정
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, HttpSession session, @RequestParam("file") MultipartFile file) throws Exception {
		System.out.println("UserController : updateUser() POST 호출");
		
		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String name = "";
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path, file.getOriginalFilename()));
			name = file.getOriginalFilename();
			user.setProfileName(name);
			userService.updateUser(user);
			session.setAttribute("user", user);
			return "redirect:/user/getUser.jsp";
		}else {
			User originalUser = (User)session.getAttribute("user");
			user.setProfileName(originalUser.getProfileName());
			userService.updateUser(user);
			session.setAttribute("user", user);
			return "redirect:/user/getUser.jsp";
		}
	}

	// 프로필 보기
	@RequestMapping(value = "getProfile", method = RequestMethod.GET)
	public String getProfile(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : getProfile() 호출");

		System.out.println("/user/getProfile : GET");
		// Business Logic
		User user = userService.getProfile(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);

		return "forward:/user/getProfile.jsp";
	}

	// 프로필 수정
	@RequestMapping(value = "updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {
		System.out.println("UserController : updateProfile() 호출");

		System.out.println("/user/updateProfile : POST");
		// Business Logic
		userService.updateProfile(user);

		String sessionId = ((User) session.getAttribute("user")).getUserId();
		if (sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}

		return "redirect:/user/getProfile?userId=" + user.getUserId();
	}

	// 문의사항 등록
	@RequestMapping(value = "addQuestions", method = RequestMethod.GET)
	public String addQuestions() throws Exception {
		System.out.println("UserController : addQuestions() GET 호출");
		System.out.println("/user/addQuestion : GET");
		System.out.println("/user/addQuestion : GET22");

		return "forward:/user/addQuestions.jsp";

	}

	// 문의사항 등록
	@RequestMapping(value = "addQuestions", method = RequestMethod.POST)
	public String addQuestions(@ModelAttribute("post") Post post) throws Exception {
		System.out.println("UserController : addQuestions() POST 호출");

		System.out.println("/user/addQuestions : POST" + post);
		// Business Logic
		userService.addQuestions(post);
		return "forward:/user/getQuestions.jsp";
	}

	// 문의사항 수정
	@RequestMapping(value = "updateQuestions", method = RequestMethod.GET)
	public String updateQuestions(@ModelAttribute("postNo") int postNo, Model model) throws Exception {
		System.out.println("UserController : updateQuestions() 호출");
		System.out.println("/user/updateQuestions : GET");

		// Business Logic
		Post post = userService.getQuestions(postNo);
		model.addAttribute("post", post);

		return "forward:/user/updateQuestions.jsp";
//		return "forward:/user/updateQuestions?postNo=" + post.getPostNo();
	}

	// 문의사항 수정
	@RequestMapping(value = "updateQuestions", method = RequestMethod.POST)
	public String updateQuestions(@ModelAttribute("post") Post post,HttpSession session) throws Exception {
		System.out.println("UserController : updateQuestions() 호출");
		System.out.println("/user/updateQuestions : POST");

		// Business Logic
		userService.updateQuestions(post);
		

		return "redirect:/user/getQuestions?postNo=" + post.getPostNo();
	}

	// 문의사항 내용
	@RequestMapping(value = "getQuestions", method = RequestMethod.GET)
	public String getQuestions(@RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("UserController : getQuestions() GET 호출");

		System.out.println("/user/getQuestions : GET");
		// Business Logic
		Post post = userService.getQuestions(postNo);
		System.out.println("post : " + post);
		// Model 과 View 연결
		model.addAttribute("post", post);

		return "forward:/user/getQuestions.jsp";
//			return "forward:/user/getQuestions?postNo"+post.getPostNo();
	}

	// 문의사항 내용
	@RequestMapping(value = "getQuestions", method = RequestMethod.POST)
	public String getQuestions(@RequestParam("post") Post post) throws Exception {
		System.out.println("UserController : getQuestions() POST 호출");

		System.out.println("/user/getQuestions : POST");
		// Business Logic
//				userService.getQuestions(post);

		return "forward:/user/getQuestions?postNo" + post.getPostNo();
	}

	// 나의 문의사항 내역
	@RequestMapping(value = "getUserQuestions", method = RequestMethod.GET)
	public String getUserQuestions(@ModelAttribute("search") Search search, Model model, HttpSession httpSession)
			throws Exception {
		System.out.println("UserController : getUserQuestions() 호출");

		System.out.println("/user/getUserQuestions : GET");

		User user = (User) httpSession.getAttribute("user");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = userService.getUserQuestions(search, user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/user/getUserQuestions.jsp";
	}


	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() throws Exception {
		System.out.println("UserController : login() GET 호출");

		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("UserController : login() POST 호출");

		System.out.println("/user/login : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
			System.out.println(dbUser);
			System.out.println("session scope 저장");
		}

		return "redirect:/main.jsp";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println("UserController : logout() 호출");

		System.out.println("/user/logout : GET");

		session.invalidate();

		return "redirect:/index.jsp";
	}

	// 아이디 중복체크
	@RequestMapping(value = "checkDuplicationUserId", method = RequestMethod.GET)
	public String checkDuplicationUserId(@RequestParam("userId") String userId) throws Exception {
		System.out.println("UserController : checkDuplicationUserId() 호출");

		System.out.println("/user/checkDuplicationUserId : GET");
		// Business Logic
		userService.checkDuplicationUserId(userId);

		return "forward:/user/addUserView.jsp";
	}

	// 아이디 중복체크
	@RequestMapping(value = "checkDuplicationUserId", method = RequestMethod.POST)
	public String checkDuplicationUserId(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : checkDuplicationUserId() 호출");

		System.out.println("/user/checkDuplicationUserId : POST");
		// Business Logic
		boolean result = userService.checkDuplicationUserId(userId);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplicationUserId.jsp";
	}

	// 닉네임 중복체크
		@RequestMapping(value = "checkDuplicationNickname", method = RequestMethod.GET)
		public String checkDuplicationNickname(@RequestParam("nickname") String nickname) throws Exception {
			System.out.println("UserController : checkDuplicationNickname() 호출");

			System.out.println("/user/checkDuplicationNickname : GET");
			// Business Logic
			userService.checkDuplicationNickname(nickname);

			return "forward:/user/addUserView.jsp";
		}
	
	
	// 닉네임 중복체크
	@RequestMapping(value = "checkDuplicationNickname", method = RequestMethod.POST)
	public String checkDuplicationNickname(@RequestParam("nickname") String nickname, Model model) throws Exception {
		System.out.println("UserController : checkDuplicationNickname() 호출");

		System.out.println("/user/checkDuplicationNickname : POST");
		// Business Logic
		boolean result = userService.checkDuplicationNickname(nickname);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("nickname", nickname);

		return "forward:/user/checkDuplicationNickname.jsp";
	}

	// 메일 중복체크
	@RequestMapping(value = "checkDuplicationMail", method = RequestMethod.POST)
	public String checkDuplicationMail(@RequestParam("mail") String mail, Model model) throws Exception {
		System.out.println("UserController : checkDuplicationMail() 호출");

		System.out.println("/user/checkDuplicationMail : POST");
		// Business Logic

		boolean result = userService.checkDuplicationMail(mail);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("mail", mail);

		return "forward:/user/checkDuplicationMail.jsp";
	}


	// 전체 회원목록
	@RequestMapping(value = "getUserList")
	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("UserController : getUserList() 호출");

		System.out.println("/user/getUserList : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/getUserList.jsp";
	}

	
	// 전체 문의사항 목록
	@RequestMapping(value = "getUserQuestionsList")
	public String listQuestions(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("UserController : getUserQuestionsList() 호출");

		System.out.println("/user/getUserQuestionsList : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = userService.getUserQuestionsList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/getUserQuestionsList.jsp";
	}


	// 회원탈퇴
	@RequestMapping(value = "deleteUser", method = RequestMethod.POST)
	public String deleteUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("UserController : deleteUser() 호출");

		System.out.println("/user/deleteUser : POST");
		// Business Logic
		userService.deleteUser(user);
		String sessionId = ((User) session.getAttribute("user")).getUserId();
		if (sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}

		return "forward:/index.jsp";
	}

}
