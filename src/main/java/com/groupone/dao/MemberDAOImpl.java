package com.groupone.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.groupone.vo.MemberVO;

@Repository
public class MemberDAOImpl implements IF_memberDAO {
	private static String mapperQuery = "com.groupone.dao.IF_memberDAO";
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public void member_insert(MemberVO mvo) throws Exception {
		sqlsession.insert(mapperQuery+".insert", mvo);
	}

	@Override
	public List<MemberVO> member_select(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectdate",mvo);
	}

	@Override
	public int idchk(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".idchk",id);
	}

	@Override
	public void deleteM(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(id+"진짜 확화홯ㄱ인");
		sqlsession.delete(mapperQuery+".deleteM",id);
	}

	@Override
	public void updateM(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".updateM",mvo);
	}


}
