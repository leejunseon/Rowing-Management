package com.airquay.rowing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airquay.rowing.vo.main;

@Service
public class rowingService {
	@Autowired
	private com.airquay.rowing.dao.mainDAO mainDAO;
	
	public List<List> getRaceInfo(String toDay) {
		// TODO Auto-generated method stub
		List raceInfo = mainDAO.getRaceInfo(toDay);
		return raceInfo;
	}
	
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

	public Boolean setRaceStart(main main) {
		// TODO Auto-generated method stub
		Boolean result;
		try {
			mainDAO.setRaceStart(main);
			result=true;
		}catch(Exception e) {
			result=false;
		}
		return result;
	}

	public List<Object> getRaceList(String mTime) {
		// TODO Auto-generated method stub
		List raceList=mainDAO.getRaceList(mTime);
		return raceList;
	}

	public List<List> getFinishTime(main main) {
		// TODO Auto-generated method stub
		List FinishTime=mainDAO.getFinishTime(main);
		return FinishTime;
	}

	public String getRaceNum(main main) {
		// TODO Auto-generated method stub
		String raceInfo=mainDAO.getRaceNum(main);
		return raceInfo;
	}

	public void recordUpload(main main) {
		// TODO Auto-generated method stub
		mainDAO.recordUpload(main);
	}

	public String getCurrentRaceNum(main main) {
		// TODO Auto-generated method stub
		String CurrentRaceNum=mainDAO.getCurrentRaceNum(main);
		return CurrentRaceNum;
	}

	public void nextRacenum(main main) {
		// TODO Auto-generated method stub
		mainDAO.nextRacenum(main);
	}
	
	public String dayRacenum(String race_num) {
		// TODO Auto-generated method stub
		String dayRacenum=mainDAO.dayRacenum(race_num);
		return dayRacenum;
	}

	public void addUser(main main) {
		// TODO Auto-generated method stub
		mainDAO.addUser(main);
	}

	public int getDayracenum(String race_date) {
		// TODO Auto-generated method stub
		int pastRace=mainDAO.getDayracenum(race_date);
		return pastRace;
	}

	public void addRace(main main) {
		// TODO Auto-generated method stub
		mainDAO.addRace(main);
	}

	public int getracenum() {
		// TODO Auto-generated method stub
		int race_num=mainDAO.getRacenum();
		return race_num;
	}

	public List<List> getteamList() {
		// TODO Auto-generated method stub
		List teamList=mainDAO.getTeamList();
		return teamList;
	}

	public List<List> getRecord(String teamName) {
		// TODO Auto-generated method stub
		List<List> record=mainDAO.getRecord(teamName);
		return record;
	}


}
