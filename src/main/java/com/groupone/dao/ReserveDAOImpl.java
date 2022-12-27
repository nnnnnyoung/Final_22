package com.groupone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupone.vo.ReserveVO;

@Repository
public class ReserveDAOImpl implements IF_reserveDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	private static String mapperQuery = "com.groupone.dao.IF_reserveDAO";
	
	@Override
	public void reserveinsert(ReserveVO rvo) throws Exception {
		System.out.println(4);
		sqlsession.insert(mapperQuery+".reserveinsert",rvo);
		System.out.println(5);
	}
	
	@Override
	public List<ReserveVO> selectlist(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectlist",id);
	}

	@Override
	public List<ReserveVO> selectId(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectId",id);
	}

	@Override
	public ReserveVO dateChk(ReserveVO rvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".dateChk",rvo);
	}

	@Override
	public ReserveVO reservOne(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".reservOne", rno);
	}

	@Override
	public void updateR(int rno) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".updateR",rno);
	}
}
