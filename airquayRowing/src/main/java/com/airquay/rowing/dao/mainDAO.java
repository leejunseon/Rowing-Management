package com.airquay.rowing.dao;

import java.util.List;

import com.airquay.rowing.vo.main;

public interface mainDAO {

	List checkUser(main main);

	List getUserInfo(main main);

	void addUser(main main);

	List getTeamList();

	List getRecord(String teamName);
	
	void addData(main main);
}
