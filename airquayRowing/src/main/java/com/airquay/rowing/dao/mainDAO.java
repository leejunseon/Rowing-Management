package com.airquay.rowing.dao;

import java.util.List;

import com.airquay.rowing.vo.main;

public interface mainDAO {

	List getRaceInfo(String toDay);

	List checkUser(main main);

	List getUserInfo(main main);

	void setRaceStart(main main);

	List getRaceList(String mTime);

	List getFinishTime(main main);

	String getRaceNum(main main);

	void recordUpload(main main);

	String getCurrentRaceNum(main main);

	void nextRacenum(main main);

	String dayRacenum(String race_num);

	void addUser(main main);

	int getDayracenum(String race_date);

	void addRace(main main);

	int getRacenum();

	List getTeamList();

	List getRecord(String teamName);
	
}
