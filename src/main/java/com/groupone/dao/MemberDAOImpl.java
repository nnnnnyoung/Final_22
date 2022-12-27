package com.groupone.dao;

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
		sqlsession.insert(mapperQuery+".memberinsert", mvo);
	}
	@Override
	public MemberVO member_one(String id) throws Exception {
		return sqlsession.selectOne(mapperQuery+".memberone", id);
	}
	@Override
	public void member_mod(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".memberMod", mvo);
	}
	@Override
	public void member_del(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(mapperQuery+".memberDel",id);
	}
	@Override
	public void del_coupon(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".delCoupon",id);
	}

}
