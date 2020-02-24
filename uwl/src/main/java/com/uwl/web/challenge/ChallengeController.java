package com.uwl.web.challenge;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.User;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {
	
	//Field ==> 더 필요하면 추가시킬것.
	@Autowired
	@Qualifier("challengeServiceImpl")
	private ChallengeService challService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//session 정보를 담아줄 user
	private User user;
	
	//getter setter
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	//Constructor
	public ChallengeController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value = "addChallenge", method = RequestMethod.GET)
	public String addChallenge(HttpSession session) throws Exception{
		
		user = (User)session.getAttribute("user");
		
		
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController addChallenge() : GET ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
			
		//관리자가 아니라면 메인페이지로 이동하게끔 만든다.
		}else if(!(user.getRole().equals("4"))) {
			System.out.println("ChallengeController addChallenge() : GET role이 관리자(\"4\")가 아니면 main.jsp로 이동");
			return "forward:/main.jsp";
		}
		
		System.out.println("/challenge/addChallenge : GET 관리자일때만 간다.");
		
		//return "redirect:/challenge/addChallenge.jsp";
		return "redirect:/challenge/toolbarAddChallenge.jsp";
		
	}
	
	@RequestMapping(value = "addChallenge", method = RequestMethod.POST)
	public String addChallenge(@ModelAttribute("challenge")Challenge challenge, 
								Model model, HttpSession session) throws Exception{
		
		System.out.println("/challenge/addChallenge : POST");
		
		user = (User)session.getAttribute("user");
		
		//addChallenge Logic 실행
		challService.addChallenge(challenge);
		model.addAttribute("challenge", challenge);
		
		System.out.println("challenege : " + challenge);
		
		return "redirect:/challenge/listAdminChallenge";
		//return "redirect:/challenge/toolbarListAdminChallenge.jsp";
	}
	
	
	@RequestMapping(value = "updateChallenge/{challNo}", method = RequestMethod.GET)
	public String updateChallenge(@PathVariable int challNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/challenge/updateChallenge : GET");
		
		user = (User)session.getAttribute("user");
		
		
		
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController updateChallenge() : GET ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
			
		//관리자가 아니라면 메인페이지로 이동하게끔 만든다.
		}else if(!(user.getRole().equals("4"))) {
			System.out.println("ChallengeController updateChallenge() : GET role이 관리자(\"4\")가 아니면 main.jsp로 이동");
			//return "forward:/main.jsp";
			return "forward:/toolbarMain.jsp";
		}
		
		Challenge challenge = challService.getChallengeAdmin(challNo);
		
		List<Challenge> list = challService.getDetailCategoryList(challenge.getChallCategory());
		
		model.addAttribute("challenge", challenge);
		model.addAttribute("detailList", list);
		System.out.println("==================>>list update : " + list);
		
		//return "forward:/challenge/updateChallenge.jsp";
		return "forward:/challenge/toolbarUpdateChallenge.jsp";
		
	}
	
	@RequestMapping(value = "updateChallenge", method = RequestMethod.POST)
	public String updateChallenge(@ModelAttribute("challenge") Challenge challenge, 
									Model model, HttpSession session) throws Exception{
		
		System.out.println("/challenge/updateChallenge : POST");
		
		
		user = (User)session.getAttribute("user");
		
		//view에서 한글로 바꾼걸 다시 숫자로String표현으로 바꿔줌
		if (challenge.getDetailCategory().equals("진학상담")) {
			//진학상담  ==> 201
			challenge.setDetailCategory("201");
		}else if(challenge.getDetailCategory().equals("사랑과이별")) {
			//사랑과이별  ==> 202
			challenge.setDetailCategory("202");
		}else if(challenge.getDetailCategory().equals("남자끼리")) {
			//남자끼리  ==> 203
			challenge.setDetailCategory("203");
		}else if(challenge.getDetailCategory().equals("여자끼리")) {
			//여자끼리  ==> 204
			challenge.setDetailCategory("204");
		}else if(challenge.getDetailCategory().equals("데이트자랑")) {
			//데이트자랑  ==> 205
			challenge.setDetailCategory("205");
		}else if(challenge.getDetailCategory().equals("대나무숲")) {
			//대나무숲  ==> 206
			challenge.setDetailCategory("206");
		}
		
		System.out.println("challenge.getDetailCategory : " + challenge.getDetailCategory());
		
		
		challService.updateChallenge(challenge);
		
		
		
		model.addAttribute("challenge", challenge);
		System.out.println("challenge update : " + challenge);
		
		
		//role이 어드민일때만 가게끔 로직을 구성해야된다. 나중에 할 떄 참고
		//redirect인 이유는 여기 입력됐던 정보들이 초기화되어야 하니까 redirect이다.

		return "redirect:/challenge/getChallenge?challNo=" + challenge.getChallNo();
	}
	
	//이 method가 필요한가??
//	@RequestMapping(value = "deleteChallenge", method = RequestMethod.POST)
//	public String deleteChallenge(@ModelAttribute("challenge") Challenge challenge, Model model) throws Exception{
//		
//		System.out.println("/challenge/deleteChallenge : POST");
//		
//		challService.deleteChallenge(challenge);
//		
//		model.addAttribute("challenge", challenge);
//		System.out.println("challenge delete : " + challenge);
//		
//		//role이 어드민일때만 가게끔 로직을 구성해야된다. 나중에 할 떄 참고
//		return "forward:/challenge/getAdminChallengeList.jsp";
//	}
	
	///////////////////////////////////////////////
	
	@RequestMapping(value = "deleteChallenge/{challNo}", method = RequestMethod.GET)
	public String deleteChallenge(@PathVariable int challNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/challenge/deleteChallenge : GET");
		
		user = (User)session.getAttribute("user");
		
		Challenge challenge = challService.getChallengeAdmin(challNo);
				
		challService.deleteChallenge(challenge);
		
		System.out.println("deleteChallenge의 challNo의 값 :  " + challenge.getChallNo());
		
		return "forward:/challenge/listAdminChallenge";
	}

	
	//GET과 POST를 동시에
	@RequestMapping(value = "listAdminChallenge")
	public String getAdminChallengeList(@ModelAttribute("search") Search search, Model model, 
										HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("ChallengeController의 getAdminChallengeList()의 /challenge/listAdminChallenge : GET / POST");
		
		user = (User)session.getAttribute("user");
		
		System.out.println("ChallengeController의 getAdminChallengeList()의 /challenge/listAdminChallenge : " + search);
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController getAdminChallengeList() : GET / POST ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
			
		//관리자가 아니라면 메인페이지로 이동하게끔 만든다.
		}else if(!(user.getRole().equals("4"))) {
			System.out.println("ChallengeController getAdminChallengeList() : GET / POST role이 관리자(\"4\")가 아니면 main.jsp로 이동");
			//return "forward:/main.jsp";
			return "forward:/toolbarMain.jsp";
		}
		
		//가져온 현재페이지가 0이면 1페이지로 navagation
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setSearchCondition(request.getParameter("searchCondition"));
		search.setSearchKeyword(request.getParameter("searchKeyword"));
		search.setPageSize(pageSize);
		
		Map<String, Object> map = challService.getAdminChallengeList(search);
		System.out.println("getAdminChallengeList의 map : " + map);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		Challenge weeklyStart = challService.getWeeklyStart();
		System.out.println("weeklyStart : " + weeklyStart);
		
		model.addAttribute("list", map.get("list"));
		System.out.println("getAdminChallengeList() list : " + map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("weeklyStart", weeklyStart);
		
		//return "forward:/challenge/listAdminChallenge.jsp";
		return "forward:/challenge/toolbarListAdminChallenge.jsp";
		
	}
	
	//Admin만 보던걸 user로 볼 수 있게 바꿔서 Mapping만 바꿧음
	@RequestMapping(value = "getChallenge", method = RequestMethod.GET)
	public String getChallengeAdmin(@RequestParam("challNo") int challNo, Model model, HttpSession session) throws Exception{
		
		user = (User)session.getAttribute("user");
		
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController getChallenge() : GET ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
		}
		
		System.out.println("=======================================");
		System.out.println("getChallenge의 challNo : " + challNo);
		System.out.println("/challenge/getChallenge : GET ");
		System.out.println("=======================================");
		
		// 특정정보를 가져오는 method
		Challenge challenge = challService.getChallengeAdmin(challNo);
		
		Challenge preNextPost = challService.getNextOrPrePost(challNo);
		
		model.addAttribute("challenge", challenge);
		model.addAttribute("preNextPost", preNextPost);
		
		//return "forward:/challenge/getChallenge.jsp";
		return "forward:/challenge/toolbarGetChallenge.jsp";
	}
	
	//GET과 POST를 동시에
	//후에 user랑 합쳐졌을때 if문을 구성해서 userId가 로그인한 userID가 아니면 볼 수 없게 구성해야됨 // userId를 암호화 할것?
	//POST방식은 적어놓긴했는데 어떻게 가는거지?? 나중에 생각해 볼 것.
	@RequestMapping(value = "listUserCompleteChallenge")
	//public String getCompleteChallengeList(@ModelAttribute("search")Search search, @RequestParam(value = "userId", required = false) String userId,
	public String getCompleteChallengeList(@ModelAttribute("search")Search search, @ModelAttribute("user") User user,
											Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		
		user = (User)session.getAttribute("user");
		
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController getCompleteChallengeList() : GET / POST ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
		}
		
		System.out.println("/challenge/getCompleteChallengeList : GET / POST ");
		System.out.println("getCompleteChallengeList의 user.getUserId : " + user.getUserId());
		
		//나중에 무한스크롤로 바꿀 것.
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		//실제로는 세션?을 사용해서 로그인정보를 가져올것. 나중에 수정해야될듯
		
		Map<String, Object> map = challService.getCompleteChallengeList(search, user.getUserId());
		System.out.println("getCompleteChallengeList의 Map : " + map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize );
		System.out.println("완료된 도전과제목록 resultPage : " + resultPage);
		System.out.println("완료된 도전과제목록 map.get(\"list\") : " + map.get("list"));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		//userId를 가져온다?? 필요한지 볼 것.
		model.addAttribute("user", user);
		
		//return "forward:/challenge/listUserCompleteChallenge.jsp";
		return "forward:/challenge/toolbarListUserCompleteChallenge.jsp";
		
	}
	
	
	///======================================= 여기까지 user ssion넣음 검증작업전 (12일 12:01분) update같은 부분이 클릭이벤트가 없어 아직 X(add완료)==================
	//GET / POST 동시에
	@RequestMapping("listChallenge")
	public String getChallengeList(Model model, HttpSession session) throws Exception{
		
		user = (User)session.getAttribute("user");
		
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController getCompleteChallengeList() : GET / POST ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
		}
		
		System.out.println("ChallengeController의 getChallengeList() /challenge/listChallenge : GET / POST");
		
		Map<String, Object> map = challService.getChallengeList();
		
		//List<Challenge> list = challService.getChallengeList();
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		//challService.addWeeklyStart(challenge);
		
		System.out.println("ChallengeController getChallengeList()의 map에 담긴 list : " + list);
		
		//////////////// 주간도전과제 시작과 끝을 세팅 ////////////////


		Challenge challenge = challService.getWeeklyStart();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = transFormat.format(challenge.getWeeklyStart());
		
		System.out.println("============================>>>>>strDate : " + strDate);
		//String[] fullDate = parse.split("-");
		
		//int yyyy = Integer.parseInt(fullDate[0]);
		//String mm = fullDate[1];
		//int dd = Integer.parseInt(fullDate[2]);
		
		//무슨달인지 담아줄 변수
		int parameterMonth = 0;
		
//		if (mm.equals("01")) {
//			parameterMonth = Calendar.JANUARY;
//		}else if(mm.equals("02")){
//			parameterMonth = Calendar.FEBRUARY;
//		}else if(mm.equals("03")){
//			parameterMonth = Calendar.MARCH;
//		}else if(mm.equals("04")){
//			parameterMonth = Calendar.APRIL;
//		}else if(mm.equals("05")){
//			parameterMonth = Calendar.MAY;
//		}else if(mm.equals("06")){
//			parameterMonth = Calendar.JUNE;
//		}else if(mm.equals("07")){
//			parameterMonth = Calendar.JULY;
//		}else if(mm.equals("08")){
//			parameterMonth = Calendar.AUGUST;
//		}else if(mm.equals("09")){
//			parameterMonth = Calendar.SEPTEMBER;
//		}else if(mm.equals("10")){
//			parameterMonth = Calendar.OCTOBER;
//		}else if(mm.equals("11")){
//			parameterMonth = Calendar.NOVEMBER;
//		}else if(mm.equals("12")){
//			parameterMonth = Calendar.DECEMBER;
//		}
		
		//변환된 정보들을 넣어줌
		//Calendar weeklyStart = new GregorianCalendar(yyyy,parameterMonth,dd);
//		System.out.println("도전과제 시작날짜 cal.getTime : " + weeklyStart.getTime());
//		System.out.println("cal.getTime : " + weeklyStart.getTimeInMillis());
//		
//		//challenge.setWeeklyStart(weeklyStart);
//		
//		Calendar weeklyEnd = weeklyStart;
//		weeklyEnd.add(Calendar.DAY_OF_WEEK, 7);
//		System.out.println("오늘로 부터 일주일 후: "+ weeklyEnd.getTime());
//		System.out.println("오늘로 부터 일주일 후: "+ weeklyEnd.getTimeInMillis());
//		
//		//////////////// 주간도전과제 시작과 끝을 세팅 ////////////////
//		
		
	//	System.out.println("ChallengeController getWeeklyStart : " +weeklyStart );
		model.addAttribute("list", list);
		model.addAttribute("challenge", challenge);
		model.addAttribute("strDate", strDate);
		
		//return "forward:/challenge/listChallenge.jsp";
		return "forward:/challenge/toolbarListChallenge.jsp";
	}
	
	
	
	//내부에서 로그인 세션검증을 하는 method ==> ModelAndView 전략같은데..?
//	private String loginCheck(User user, HttpSession session, String forward) throws Exception {
//		
//		user = (User)session.getAttribute("user");
//		
//		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
//		if (user.getUserId() == null) {
//			System.out.println("ChallengeController loginCheck() : GET ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
//			return "forward:/user/login";
//			
//		//관리자가 아니라면 메인페이지로 이동하게끔 만든다.
//		}else if(!(user.getRole().equals("4"))) {
//			System.out.println("ChallengeController loginCheck() : GET role이 관리자(\"4\")가 아니면 main.jsp로 이동");
//			return "forward:/main.jsp";
//		}
//		
//		//forward에 각각 다른 위치를 지정함
//		return null;
//		
//	}
	
}
