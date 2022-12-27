
	package com.groupone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupone.vo.BoardVO;
import com.groupone.vo.CommentsVO;
import com.groupone.vo.GoodlistVO;
import com.groupone.vo.PageVO;

@Repository
public class BoardDAOImpl implements IF_boardDAO{
	private static String mapperQuery = "com.groupone.dao.IF_boardDAO";
	@Inject
	private SqlSession sqlsession;
	@Override
	public List<BoardVO> selectAll(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectAll", pageVO);
	}
	@Override
	public int countBoard() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".countBoard");
	}
	@Override
	public BoardVO selectB(String bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".selectB",bno);
	}
	@Override
	public void plusCnt(String bno) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".plusCnt",bno);
	}
	@Override
	public String selectCN(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".selectCN",rno);
	}
	@Override
	public String selectAttach(String bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".selectAttach",bno);
	}
	
	@Override
	public List<CommentsVO> selectCom(String bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectCom",bno);
	}
	@Override
	public void inputC(CommentsVO commentsVO) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery+".inputC", commentsVO);
	}
	@Override
	public void delCom(String bbno) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(mapperQuery+".delCom", bbno);
	}
	
	@Override
	public void insertAttach(String filename)throws Exception{
		sqlsession.insert(mapperQuery+".board_attach",filename);
	}
	
	@Override
	public void insertOne(BoardVO boardvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery+".boardinsert",boardvo);
		
	}
	@Override
	public BoardVO selectOne(String vno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".selectOne",vno);
	}
	
	@Override
	public void delBoard(String bno) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(mapperQuery+".delBoard", bno);
	}
	@Override
	public BoardVO modiB(String bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".modiB", bno);
	}
	@Override
	public void updateB(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".updateB",bvo);
	}
	@Override
	public void updateBfile(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".updateBfile", bvo);
	}
	@Override
	public int countSh(PageVO shPage) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".countSh", shPage);
	}
	
	@Override
	public List<BoardVO> selectSh(PageVO shPage) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectSh",shPage);
	}
	@Override
	public void modiC(CommentsVO cvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".modiC",cvo);
	}
	@Override
	public int countLike(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".countLike",gvo);
	}
	@Override
	public void updateG(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery+".updateG",gvo);
	}
	@Override
	public void deleteL(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(mapperQuery+".deleteL",gvo);
	}
	@Override
	public void insertL(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery+".insertL", gvo);
	}
	@Override
	public List<BoardVO> selectId(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectId",id);
	}
	
	@Override
	public List<CommentsVO> selectComId(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectComId",id);
	}
	@Override
	public int countBM(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".countBM",id);
	}
	@Override
	public List<BoardVO> selectML(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectML",pageVO);
	}

	@Override
	public int countCM(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery+".countCM",id);
	}
	@Override
	public List<CommentsVO> selectCL(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery+".selectCL",pageVO);
	}
}
