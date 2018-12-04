package com.airquay.rowing.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airquay.rowing.vo.main;

@Repository
public class mainDaoImpl  implements mainDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private String mapper = "mapper.main.";

	@Override
	public List getRaceInfo(String toDay) {
		// TODO Auto-generated method stub
		List raceInfo = sqlSession.selectList(mapper+"getRaceInfo", toDay);
		return raceInfo;
	}

	@Override
	public List checkUser(main main) {
		// TODO Auto-generated method stub
		List userCheck = sqlSession.selectList(mapper+"checkUser", main);
		return userCheck;
	}

	@Override
	public List getUserInfo(main main) {
		// TODO Auto-generated method stub
		List userInfo = sqlSession.selectList(mapper+"getUserInfo", main);
		return userInfo;
	}

	@Override
	public void setRaceStart(main main) {
		// TODO Auto-generated method stub
		sqlSession.update(mapper+"setRaceStart",main);
	}
	
	@Override
	public List getRaceList(String mTime) {
		// TODO Auto-generated method stub
		List raceList=sqlSession.selectList(mapper+"getRaceList",mTime);
		return raceList;
	}

	@Override
	public List getFinishTime(main main) {
		// TODO Auto-generated method stub
		List FinishTime = sqlSession.selectList(mapper+"getFinishTime",main);	
		return FinishTime;
	}

	@Override
	public String getRaceNum(main main) {
		// TODO Auto-generated method stub
		String raceInfo=sqlSession.selectOne(mapper+"getRaceNum", main);
		if(raceInfo!=null)
			sqlSession.update(mapper+"updateRaceNum", main);
		return raceInfo;
	}

	@Override
	public String dayRacenum(String race_num) {
		// TODO Auto-generated method stub
		String dayRacenum=sqlSession.selectOne(mapper+"dayRacenum",race_num);
		return dayRacenum;
	}

	@Override
	public void addUser(main main) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapper+"addUser", main);
	}

	@Override
	public int getDayracenum(String race_date) {
		// TODO Auto-generated method stub
		int Dayracenum;
		List<List> pastRace=sqlSession.selectList(mapper+"getPastrace",race_date);
		Dayracenum=pastRace.size()+1;
		return Dayracenum;
	}

	@Override
	public void addRace(main main) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapper+"addRace",main);
		sqlSession.insert(mapper+"addIson",main);
		
		sqlSession.insert(mapper+"addRecordOne",main);
		sqlSession.insert(mapper+"addRecordTwo",main);
		sqlSession.insert(mapper+"addRecordThree",main);
		sqlSession.insert(mapper+"addRecordFour",main);
		sqlSession.insert(mapper+"addRecordFive",main);
		sqlSession.insert(mapper+"addRecordSix",main);
	}

	@Override
	public int getRacenum() {
		// TODO Auto-generated method stub
		String raceNum=sqlSession.selectOne(mapper+"getRacenum");
		int race_num=Integer.parseInt(raceNum)+1;
		return race_num;
	}

	@Override
	public List getTeamList() {
		// TODO Auto-generated method stub
		List teamList=sqlSession.selectList(mapper+"getTeamList");
		return teamList;
	}

	@Override
	public List getRecord(String teamName) {
		// TODO Auto-generated method stub
		List record=sqlSession.selectList(mapper+"getRecord",teamName);
		return record;
	}

}
