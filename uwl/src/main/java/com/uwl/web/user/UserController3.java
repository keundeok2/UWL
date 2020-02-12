package com.uwl.web.user;

import static org.hamcrest.CoreMatchers.is;

import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uwl.common.OracleToMongo;
import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendService;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.purchase.PurchaseService;
import com.uwl.service.reward.RewardService;
import com.uwl.service.schoolRank.SchoolRankService;
import com.uwl.service.social.SocialService;
import com.uwl.service.user.UserService;

@Controller
@RequestMapping("/userrr/*")
public class UserController3 {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;
	
	@Autowired
	private SocialService socialService;
	
	@Autowired
	private CoupleService coupleService;
	
	@Autowired
	private MatchingService matchingService;
	
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private RewardService rewardService;
	
	@Autowired
	private PurchaseService purchaseService;
	
//	메일 인증
//	@Resource(name="mailSender")
//	private JavaMailSender mailSender;	

	public UserController3() {
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
	public String addUser(@ModelAttribute("user") User user) throws Exception {
		System.out.println("UserController : addUser() 호출");

		System.out.println(user);
		System.out.println("/user/addUser : POST");
		// Business Logic
		userService.addUser(user);

		// ======================================= 채 팅
		// ===========================================
		// 있으면 update , 없으면 insert 이거 방법뭐임? 이 메서드 돌릴때 다른 패키지에 있는 .java 파일 실행시키고싶음

		OracleToMongo oracleToMongo = new OracleToMongo();
		oracleToMongo.startOracleToMongo();
		// ======================================= 채 팅
		// ===========================================

		System.out.println(user);

		// SchoolRank 추가하기!!!!!!!!!!!!!!!

		return "redirect:/user/loginView.jsp";
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

	// 삭제예정
	// 회원정보 보기
	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : getUser() GET 호출");

		System.out.println("/user/getUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);

		return "forward:/user/getUser.jsp";
	}

	// 수정!!!!!!!!!!!!!!!!!!!!!!!!!!
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
	public String updateUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("UserController : updateUser() POST 호출");

		System.out.println("/user/updateUser : POST");

		// Business Logic
		userService.updateUser(user);

		// ======================================= 채 팅
		// ===========================================
		// 있으면 update , 없으면 insert 이거 방법뭐임? 이 메서드 돌릴때 다른 패키지에 있는 .java 파일 실행시키고싶음

//		OracleToMongo oracleToMongo = new OracleToMongo();
//		oracleToMongo.startOracleToMongo();
		// ======================================= 채 팅
		// ===========================================

		String sessionId = ((User) session.getAttribute("user")).getUserId();
		if (sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		return "redirect:/user/getUser?userId=" + user.getUserId();
//		return "redirect:/index.jsp";
	}

	// 프로필 보기
	@RequestMapping(value = "getProfile/{targetUserId}", method = RequestMethod.GET)
	public String getProfile(@PathVariable String targetUserId, HttpSession session ,Model model) throws Exception {
		System.out.println("UserController : getProfile() 호출");
		User sessionUser = (User)session.getAttribute("user");
		
		System.out.println("sessionUserId : " + sessionUser.getUserId() + "\t\t targetUserId : " + targetUserId);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		//////////////////////// 활동점수, 포인트 추가바람/////////////////////////////////////
		
		//targetUserId : 프로필 주인
		User user = userService.getUser(targetUserId);
		model.addAttribute("targetUser", user);
		// getItemList에 search 아무렇게 넣어도 됨
		Map<String, Object> mapOfSpear = matchingService.getItemList(search, targetUserId, "1");
		Map<String, Object> mapOfShield = matchingService.getItemList(search, targetUserId, "2");
		
		// 창 개수, 방패 개수
		int totalSpear = (Integer)mapOfSpear.get("totalItem");
		int totalShield = (Integer)mapOfShield.get("totalItem");
		model.addAttribute("totalSpear", totalSpear);
		model.addAttribute("totalShield", totalShield);
		
		//	session의 유저와 프로필의 유저가 친구인지 확인
		// Friend에 fristUserId, secondUserId만 넣어주면 됨
		//	checkFriend() => return 1: 친구 0: 친구아님
		Friend friend = new Friend();
		friend.setFirstUserId(sessionUser.getUserId());
		friend.setSecondUserId(targetUserId);
		int isFriend =friendService.checkFriend(friend);
		model.addAttribute("isFriend", isFriend);
		
		// 친구신청관계 확인
		//	1 : 친구신청, 2 : 친구, null : 신청안함
		Friend checkFriend1 = friendService.checkRequest(friend);
		model.addAttribute("checkFriend1", checkFriend1); // return 1 => 신청취소 버튼 만들기 2 => 친구끊기 버튼 만들기
		//	반대확인
		friend.setFirstUserId(targetUserId);
		friend.setSecondUserId(sessionUser.getUserId());
		Friend checkFriend2 = friendService.checkRequest(friend);
		model.addAttribute("checkFriend2",checkFriend2); // return 1 => 친구신청버튼(로직은 수락) 만들기
		
		return "forward:/user/profile.jsp";
	}

	// 프로필 수정
	@RequestMapping(value = "updateProfileView", method = RequestMethod.POST)
	public String updateProfileView(@RequestParam String userId ,Model model) throws Exception {
		System.out.println("UserController : updateProfileView() 호출");
		
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		
		return "forward:/user/updateProfile2.jsp";
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
		
		return "redirect:/userrr/getProfile/"+user.getUserId();
	}
	
	//	비밀번호 변경
	public String updatePassword(@RequestParam String password, Model model) throws Exception{
			
		return null;
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
	public String updateQuestions(@ModelAttribute("post") Post post, HttpSession session) throws Exception {
		System.out.println("UserController : updateQuestions() 호출");
		System.out.println("/user/updateQuestions : POST");

		// Business Logic
		userService.updateQuestions(post);

		int sessionId = ((Post) session.getAttribute("post")).getPostNo();
		if (sessionId == (post.getPostNo())) {
			session.setAttribute("post", post);
		}

		return "forward:/user/getUserQuestions?postNo=" + post.getPostNo();
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
		System.out.println("오나요");
		return "forward:/user/getUserQuestions.jsp";
	}

//	// 내가 쓴 게시글
//	@RequestMapping(value = "getUserPostList", method = RequestMethod.GET)
//	public String getUserPostList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
//			throws Exception {
//		System.out.println("UserController : getUserPostList() 호출");
//
//		System.out.println("/user/getUserPostList : GET");
//
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		// Business logic 수행
//		Map<String, Object> map = userService.getUserPostList(search);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		// Model 과 View 연결
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//
//		return "forward:/user/getProfile.jsp";
//	}

//	// 내가 쓴 댓글
//	@RequestMapping(value = "getUserCommentList", method = RequestMethod.GET)
//	public String getUserCommentList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
//			throws Exception {
//		System.out.println("UserController : getUserCommentList() 호출");
//
//		System.out.println("/user/getUserPosgetUserCommentListtList : GET");
//		
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		// Business logic 수행
//		Map<String, Object> map = userService.getUserCommentList(search);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		// Model 과 View 연결
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//
//		return "forward:/user/getProfile.jsp";
//	}

//	// 내가 좋아요한 글
//	@RequestMapping(value = "getUserLikePostList", method = RequestMethod.GET)
//	public String getUserLikePostList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
//			throws Exception {
//		System.out.println("UserController : getUserLikePostList() 호출");
//
//		System.out.println("/user/getUserLikePostList : GET");
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		// Business logic 수행
//		Map<String, Object> map = userService.getUserLikePostList(search);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		// Model 과 View 연결
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//
//		return "forward:/user/getProfile.jsp";
//	}

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

		System.out.println("/user/logout : POST");

		session.invalidate();

		return "redirect:/index.jsp";
	}

//	// 아이디 중복체크 test
//		@RequestMapping(value = "checkDuplicationUserId", method = RequestMethod.POST)
//		public String checkDuplicationUserId(@RequestParam("userId") String userId, Model model) throws Exception {
//			System.out.println("UserController : checkDuplicationUserId() 호출");
//
//			return "userService.checkDuplicationUserId(userId)";
//		}

//	// 아이디 중복체크 test
//	@RequestMapping(value = "checkDuplicationUserId", method = { RequestMethod.GET, RequestMethod.POST})
//    public @ResponseBody int checkDuplicationUserId (String userId, Model model) {
//        return userService.checkDuplicationUserId(userId);
//    }//

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

//	// 전체 회원목록
//	@RequestMapping(value = "listUser")
//	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
//			throws Exception {
//
//		System.out.println("/user/listUser : GET / POST");
//
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//
//		// Business logic 수행
//		Map<String, Object> map = userService.getUserList(search);
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
//				pageSize);
//		System.out.println(resultPage);
//
//		// Model 과 View 연결
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//
//		return "forward:/user/listUser.jsp";
//	}

	// 전체 회원목록
	@RequestMapping(value = "getUserList", method = RequestMethod.GET)
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

//	// 전체 문의사항 목록
//	@RequestMapping(value = "listQuestions", method = RequestMethod.GET)
//	public String listQuestions(@RequestParam("userId") String userId, Model model) throws Exception {
//		System.out.println("UserController : listQuestions() 호출");
//
//		System.out.println("/user/listQuestions : GET");
//		// Business Logic
//		List<User> user = userService.getUserQuestionsList(userId);
//		// Model 과 View 연결
//		model.addAttribute("user", user);
//
//		return "forward:/user/listQuestions.jsp";
//	}

	// 회원탈퇴
	@RequestMapping(value = "deleteUser", method = RequestMethod.POST)
	public String deleteUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {
		System.out.println("UserController : deleteUser() 호출");

		System.out.println("/user/deleteUser : POST");
		// Business Logic
		userService.deleteUser(user);

		String sessionId = ((User) session.getAttribute("user")).getUserId();
		if (sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}

		return "redirect:/user/getUser?userId=" + user.getUserId();
	}

}