package com.airquay.rowing.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airquay.rowing.vo.main;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@Controller
public class MainController {
	
	@Autowired
	private com.airquay.rowing.service.rowingService rowingService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)//http://localhost:8080/rowing/main 접속 시 호출
	public String main(Model model, HttpServletRequest request, HttpServletResponse response) {
 		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/login";
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String select(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
			model.addAttribute("userAdmin",session.getAttribute("userAdmin"));
		}
		return "main/select";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "main/signup";
	}
	
	@RequestMapping(value = "/findID", method = RequestMethod.GET)
	public String findID(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "main/findID";
	}
	
	@RequestMapping(value = "/findPWD", method = RequestMethod.GET)
	public String findPWD(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "main/findPWD";
	}
	
	@RequestMapping(value = "/addRecord", method = RequestMethod.GET)
	public String addRecord(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/addRecord";
	}
	
	@RequestMapping(value = "/recordview", method = RequestMethod.GET)
	public String recordview(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/recordView";
	}
	
	@RequestMapping(value = "/selectAdmin", method = RequestMethod.GET)
	public String selectAdmin(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
			model.addAttribute("userAdmin",session.getAttribute("userAdmin"));
		}
		return "main/selectAdmin";
	}
	
	@RequestMapping(value = "/teamInfo", method = RequestMethod.GET)
	public String teamInfo(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/teamInfo";
	}
	
	@RequestMapping(value = "/addRaceSchedule", method = RequestMethod.GET)
	public String addRaceSchedule(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/addRaceSchedule";
	}

	@RequestMapping(value = "/memberManagement", method = RequestMethod.GET)
	public String memberManagement(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/memberManagement";
	}
	
	@RequestMapping(value = "/raceSchedule", method = RequestMethod.GET)
	public String raceSchedule(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
 		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			model.addAttribute("loginCheck", false);
		}else{
			model.addAttribute("loginCheck", true);
		}
		return "main/raceSchedule";
	}
	
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })//로그인정보 확인 후 true/false반환
	public @ResponseBody List login(Model model, HttpServletRequest request, HttpServletResponse response) {
		main main = new main();
		List<Object> resultList = new ArrayList<Object>();
		HttpSession session = request.getSession(false);
		int Admin;
		String Name;
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		main.setUser_id(user_id);
		main.setUser_pw(user_pw);
		
		Boolean userCheck = rowingService.checkUser(main);
		List<List> userInfo = rowingService.userInfo(main);
		
		if(userCheck==true){
			session.setAttribute("loginUser", true);
			main=(main)userInfo.get(0);
			Admin=main.getAdminLevel();
			Name=main.getUser_name();
			session.setAttribute("userAdmin", Admin);
			resultList.add(userCheck);
			resultList.add(Name);
		}
		else {
			resultList.add(userCheck);
		}
		return resultList;
	}
	
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Boolean logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Boolean loginUser = (Boolean) session.getAttribute("loginUser");
		if(loginUser==null){
			return false;
		}else {
			session.invalidate();
			return true;
		}
	}
	
	@RequestMapping(value = "/main/addUser", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void addUser(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
  		String user_id=request.getParameter("user_id");
  		String user_pw=request.getParameter("user_pw");
  		String user_name=request.getParameter("user_name");
  		
  		main main=new main();
  		main.setUser_id(user_id);
  		main.setUser_pw(user_pw);
  		main.setUser_name(user_name);
  		
  		rowingService.addUser(main);
	}
	
	@RequestMapping(value = "/main/addData", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void addData(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
  		String event_name=request.getParameter("event_name");
  		String year=request.getParameter("year");
  		String month=request.getParameter("month");
  		String day=request.getParameter("day");
  		String race_date=year+"-"+month+"-"+day;
  		String racetype=request.getParameter("race_type");
  		String progression=request.getParameter("progression");
  		String roundtype=request.getParameter("round_type");
  		String RankOneTeam=request.getParameter("RankOneTeam");
  		String RankOneRacetime=request.getParameter("RankOneRacetime");
  		String RankTwoTeam=request.getParameter("RankTwoTeam");
  		String RankTwoRacetime=request.getParameter("RankTwoRacetime");
  		String RankThreeTeam=request.getParameter("RankThreeTeam");
  		String RankThreeRacetime=request.getParameter("RankThreeRacetime");
  		String RankFourTeam=request.getParameter("RankFourTeam");
  		String RankFourRacetime=request.getParameter("RankFourRacetime");
  		String RankFiveTeam=request.getParameter("RankFiveTeam");
  		String RankFiveRacetime=request.getParameter("RankFiveRacetime");
  		String RankSixTeam=request.getParameter("RankSixTeam");
  		String RankSixRacetime=request.getParameter("RankSixRacetime");		
  		
  		main main=new main();
  		main.setEvent_name(event_name);
  		main.setRace_date(race_date);
  		main.setRacetype(racetype);
  		main.setProgression(progression);
  		main.setRoundtype(roundtype);
  		main.setRankOneTeam(RankOneTeam);
  		main.setRankOneRacetime(RankOneRacetime);
  		main.setRankTwoTeam(RankTwoTeam);
  		main.setRankTwoRacetime(RankTwoRacetime);
  		main.setRankThreeTeam(RankThreeTeam);
  		main.setRankThreeRacetime(RankThreeRacetime);
  		main.setRankFourTeam(RankFourTeam);
  		main.setRankFourRacetime(RankFourRacetime);
  		main.setRankFiveTeam(RankFiveTeam);
  		main.setRankFiveRacetime(RankFiveRacetime);
  		main.setRankSixTeam(RankSixTeam);
  		main.setRankSixRacetime(RankSixRacetime);
  		
  		rowingService.addData(main);
	}
	
	@RequestMapping(value = "/main/getteamList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List getteamList(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<List> teamInfo = rowingService.getteamList();
		return teamInfo;
	}
	
	@RequestMapping(value = "/main/getRoundtypeList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List getRoundtypeList(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<List> RoundtypeInfo = rowingService.getRoundtypeList();
		return RoundtypeInfo;
	}
	
	@RequestMapping(value = "/main/getStartYear", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List getStartYear(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<List> startYear = rowingService.getStartYear();
		return startYear;
	}
	
	@RequestMapping(value = "/main/getRecord", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List getRecord(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		main main=new main();
		
		main.setStart_date(request.getParameter("startDate"));
		main.setEnd_date(request.getParameter("endDate"));
		main.setTeam_num(Integer.parseInt(request.getParameter("team_num")));
		main.setRoundtype_key(Integer.parseInt(request.getParameter("roundtype_key")));
		
		List<List> record_info = rowingService.getRecord(main);
		return record_info;
	}
	
	@RequestMapping(value = "/main/teamData", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Vector teamData(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String team_num=request.getParameter("team_num");		
		Vector teamInfo = rowingService.teamInfo(team_num);
		return teamInfo;
	}
	
	@RequestMapping(value = "/main/addRace", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void addRace(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		main main=new main();
		String race_name=request.getParameter("race_name");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String day=request.getParameter("day");
		String race_location=request.getParameter("location");
		main.setRace_name(race_name);
		main.setRace_calendar(year+"-"+month+"-"+day);
		main.setRace_location(race_location);
		rowingService.addRace(main);
	}
	
	@RequestMapping(value = "/main/getUserList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List getUserList(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List UserList=rowingService.getUserList();
		return UserList;
	}
	
	@RequestMapping(value = "/main/setUserInfo", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void setUserInfo(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session,String[] user_num) {
		rowingService.setUserInfo(user_num);
	}
	
	@RequestMapping(value = "/main/deletelaterSchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody void deletelaterSchedule(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		rowingService.deletelaterSchedule();
	}
	
	@RequestMapping(value = "/main/raceSchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List raceSchedule(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List raceSchedule=rowingService.getRaceSchedule();
		return raceSchedule;
	}
	
	@RequestMapping(value = "/main/findUserID", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List findUserID(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String user_name=request.getParameter("user_name");
		List userID=rowingService.findUserID(user_name);
		return userID;
	}
	
	@RequestMapping(value = "/main/findUserPWD", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String findUserPWD(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		main main=new main();	
		String user_name=request.getParameter("user_name");
		String user_id=request.getParameter("user_id");
		main.setUser_name(user_name);
		main.setUser_id(user_id);
		
		String userPWD=rowingService.findUserPWD(main);
		return userPWD;
	}
	
	@RequestMapping(value = "/main/checkId", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Boolean checkId(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String user_id=request.getParameter("user_id");
		
		return rowingService.checkId(user_id);
		
	}
}