package com.airquay.rowing.service;

import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airquay.rowing.vo.main;

@Service
public class rowingService {
	@Autowired
	private com.airquay.rowing.dao.mainDAO mainDAO;

	public Boolean checkUser(main main) {
		// TODO Auto-generated method stub
		List userCheck = mainDAO.checkUser(main);
		if(userCheck.size() == 1){
			return true;
		}else{
			return false;
		}
	}
	
	public List<List> userInfo(main main) {
		// TODO Auto-generated method stub
		List userInfo = mainDAO.getUserInfo(main);
		return userInfo;
	}

	public void addUser(main main) {
		// TODO Auto-generated method stub
		mainDAO.addUser(main);
	}

	public List<List> getteamList() {
		// TODO Auto-generated method stub
		List teamList=mainDAO.getTeamList();
		return teamList;
	}
	
	public List<List> getRoundtypeList() {
		// TODO Auto-generated method stub
		List RoundtypeInfo=mainDAO.getRoundtypeList();
		return RoundtypeInfo;
	}
	
	public List<List> getStartYear() {
		// TODO Auto-generated method stub
		List startYear=mainDAO.getStartYear();
		return startYear;
	}
	
	public List<List> getRecord(main main) {
		// TODO Auto-generated method stub
		List<List> record_info=mainDAO.getRecord(main);
		return record_info;
	}
	
	public void addData(main main) {
		mainDAO.addData(main);
	}

	public Vector teamInfo(String team_num) {
		Vector teamInfo=mainDAO.teamInfo(team_num);
		return teamInfo;
	}
	
	public void addRace(main main) {
		mainDAO.addRace(main);
	}

	public List getUserList() {
		// TODO Auto-generated method stub
		List UserList=mainDAO.getUserList();
		return UserList;
	}

	public void setUserInfo(String[] user_num) {
		// TODO Auto-generated method stub
		mainDAO.setUserInfo(user_num);
	}

	public List getRaceSchedule() {
		// TODO Auto-generated method stub
		return mainDAO.getRaceSchedule();
	}

	public void deletelaterSchedule() {
		// TODO Auto-generated method stub
		mainDAO.deletelaterSchedule();
	}
}
