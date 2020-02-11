package com.uwl.web.challenge;

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

import sun.security.util.PropertyExpander.ExpandException;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {
	
	//Field ==> 더 필요하면 추가시킬것.
	@Autowired
	@Qualifier("challengeServiceImpl")
	private ChallengeService challService;
	
	//Constructor
	public ChallengeController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "addChallenge", method = RequestMethod.GET)
	public String addChallenge() throws Exception{
		
		System.out.println("/challenge/addChallenge : GET");
		
		return "redirect:/challenge/addChallengeView.jsp";
		
	}
	
	@RequestMapping(value = "addChallenge", method = RequestMethod.POST)
	public String addChallenge(@ModelAttribute("challenge")Challenge challenge, Model model) throws Exception{
		
		System.out.println("/challenge/addChallenge : POST");
		
		//addChallenge Logic 실행
		challService.addChallenge(challenge);
		model.addAttribute("challenge", challenge);
		
		System.out.println("challenege : " + challenge);
		
		return "forward:/challenge/addChallenge.jsp";
	}
	
	@RequestMapping(value = "updateChallenge/{challNo}", method = RequestMethod.GET)
	public String updateChallenge(@PathVariable int challNo, Model model) throws Exception{
		
		System.out.println("/challenge/updateChallenge : GET");
		
		Challenge challenge = challService.getChallengeAdmin(challNo);
		
		model.addAttribute("challenge", challenge);
		
		return "forward:/challenge/updateChallenge.jsp";
		
	}
	
	@RequestMapping(value = "updateChallenge", method = RequestMethod.POST)
	public String updateChallenge(@ModelAttribute("challenge") Challenge challenge, Model model) throws Exception{
		
		System.out.println("/challenge/updateChallenge : POST");
		
		challService.updateChallenge(challenge);
		
		model.addAttribute("challenge", challenge);
		System.out.println("challenge update : " + challenge);
		
		//role이 어드민일때만 가게끔 로직을 구성해야된다. 나중에 할 떄 참고
		//redirect인 이유는 여기 입력됐던 정보들이 초기화되어야 하니까 redirect이다.

		return "redirect:/challenge/getChallengeAdmin?challNo=" + challenge.getChallNo();
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
	public String deleteChallenge(@PathVariable int challNo, Model model) throws Exception{
		
		System.out.println("/challenge/deleteChallenge : GET");
		
		Challenge challenge = challService.getChallengeAdmin(challNo);
				
		challService.deleteChallenge(challenge);
		
		System.out.println("deleteChallenge의 challNo의 값 :  " + challenge.getChallNo());
		
		return "forward:/challenge/getAdminChallengeList";
	}

	
	//GET과 POST를 동시에
	@RequestMapping(value = "listAdminChallenge")
	public String getAdminChallengeList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception{
		
		System.out.println("ChallengeController의 getAdminChallengeList()의 /challenge/listAdminChallenge");
		
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
		
		model.addAttribute("list", map.get("list"));
		System.out.println("list : " + map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/challenge/listAdminChallenge.jsp";
		
	}
	
	@RequestMapping(value = "getChallengeAdmin", method = RequestMethod.GET)
	public String getChallengeAdmin(@RequestParam("challNo") int challNo, Model model) throws Exception{
		
		System.out.println("getChallenge의 challNo : " + challNo);
		System.out.println("/challenge/getChallenge : GET ");
		
		Challenge challenge = challService.getChallengeAdmin(challNo);
		
		model.addAttribute("challenge", challenge);
		
		return "forward:/challenge/getChallengeAdmin.jsp";
	}
	
	//GET과 POST를 동시에
	//후에 user랑 합쳐졌을때 if문을 구성해서 userId가 로그인한 userID가 아니면 볼 수 없게 구성해야됨 // userId를 암호화 할것?
	//POST방식은 적어놓긴했는데 어떻게 가는거지?? 나중에 생각해 볼 것.
	@RequestMapping(value = "getCompleteChallengeList/{userId}")
	public String getCompleteChallengeList(@ModelAttribute("search")Search search, @RequestParam(value = "userId", required = false) String userId,
											Model model, HttpServletRequest request) throws Exception{
		
		System.out.println("/challenge/getCompleteChallengeList : GET / POST ");
		System.out.println("getCompleteChallengeList의 userId : " + userId);
		
		//나중에 무한스크롤로 바꿀 것.
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		//실제로는 세션?을 사용해서 로그인정보를 가져올것. 나중에 수정해야될듯
		userId = "user01";
		
		Map<String, Object> map = challService.getCompleteChallengeList(search, userId);
		System.out.println("getCompleteChallengeList의 Map : " + map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize );
		System.out.println("완료된 도전과제목록 resultPage : " + resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		//userId를 가져온다?? 필요한지 볼 것.
		model.addAttribute("userId", userId);
		
		return "forward:/challenge/getCompleteChallengeList.jsp";
		
	}
	
	//GET / POST 동시에
	@RequestMapping("listChallenge")
	public String getChallengeList(Model model) throws Exception{
		
		
		
		
		System.out.println("ChallengeController의 getChallengeList() /challenge/listChallenge : GET / POST");
		
		Map<String, Object> map = challService.getChallengeList();
		
		//List<Challenge> list = challService.getChallengeList();
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		//challService.addWeeklyStart(challenge);
		
		System.out.println("ChallengeController getChallengeList()의 map에 담긴 list : " + list);
		
		model.addAttribute("list", list);
		
		return "forward:/challenge/listChallenge.jsp";
	}
		
	
}
