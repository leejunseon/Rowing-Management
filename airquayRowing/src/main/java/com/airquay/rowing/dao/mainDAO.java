package com.airquay.rowing.dao;

import java.util.List;
import java.util.Vector;

import com.airquay.rowing.vo.main;

public interface mainDAO {

	List checkUser(main main);

	List getUserInfo(main main);

	void addUser(main main);

	List getTeamList();
	
	List getRoundtypeList();
	
	List getStartYear();

	List getRecord(main main);
	
	void addData(main main);
	
	Vector teamInfo(String team_num);
	
	void addRace(main main);

	List getUserList();

	void setUserInfo(String[] user_num);

	List getRaceSchedule();

	void deletelaterSchedule();

}
