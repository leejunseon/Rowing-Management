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
	public void addUser(main main) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapper+"addUser", main);
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
		List record_info=sqlSession.selectList(mapper+"getRecord",teamName);
		return record_info;
	}

	@Override
	public void addData(main main) {
		// TODO Auto-generated method stub
		sqlSession.insert(mapper+"addRankOneteam",main);
		sqlSession.insert(mapper+"addRankTwoteam",main);
		sqlSession.insert(mapper+"addRankThreeteam",main);
		sqlSession.insert(mapper+"addRankFourteam",main);
		sqlSession.insert(mapper+"addRankFiveteam",main);
		sqlSession.insert(mapper+"addRankSixteam",main);
		
		main.setRankOneTeam(sqlSession.selectOne(mapper+"getRankoneKey",main));
		main.setRankTwoTeam(sqlSession.selectOne(mapper+"getRanktwoKey",main));
		main.setRankThreeTeam(sqlSession.selectOne(mapper+"getRankthreeKey",main));
		main.setRankFourTeam(sqlSession.selectOne(mapper+"getRankfourKey",main));
		main.setRankFiveTeam(sqlSession.selectOne(mapper+"getRankfiveKey",main));
		main.setRankSixTeam(sqlSession.selectOne(mapper+"getRanksixKey",main));
		
		sqlSession.insert(mapper+"addRacetype",main);
		sqlSession.insert(mapper+"addRoundtype",main);
		sqlSession.insert(mapper+"addProgression",main);
		
		main.setRacetype_key(sqlSession.selectOne(mapper+"getRacetypeKey",main));
		main.setRoundtype_key(sqlSession.selectOne(mapper+"getRoundtypeKey",main));
		main.setProgression_key(sqlSession.selectOne(mapper+"getProgressionKey",main));
		
		sqlSession.insert(mapper+"addRaceinfo",main);//¿¡·¯
		
		main.setRace_num(sqlSession.selectOne(mapper+"getRacenum"));
		
		sqlSession.insert(mapper+"addRecordinfo",main);	
	}
}
