package com.groupone.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.groupone.service.IF_boardservice;
import com.groupone.service.IF_reserveservice;
import com.groupone.util.FileDataUtil;
import com.groupone.vo.BoardVO;
import com.groupone.vo.CommentsVO;
import com.groupone.vo.GoodlistVO;
import com.groupone.vo.PageVO;
import com.groupone.vo.ReserveVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
   @Inject
   IF_boardservice bsvs;
   @Inject
   IF_reserveservice rsvs;
   @Inject
   private FileDataUtil FileDataUtil;
   /**
    * Simply selects the home view to render by returning its name.
    */

   @RequestMapping(value = "/boardview", method = RequestMethod.GET)  
   public String boardview(Locale locale, Model model, @ModelAttribute("pageVO")PageVO pageVO) throws Exception {
      
      if(pageVO.getPage()==null) { //클라이언트가 페이지정보를 넘겨주지 않는다면 기본값 1로 셋팅
         pageVO.setPage(1);         
      }
            
      int totalpageCnt=bsvs.countBoard();
      System.out.println(totalpageCnt+"건 등록됨");
      pageVO.setTotalCount(totalpageCnt);
      
      List<BoardVO> list=bsvs.selectAll(pageVO);
      for(int i=0; i<list.size(); i++) {
    	  System.out.println(list.get(i).getContent().length());
      }
      
      model.addAttribute("bList",list);
      model.addAttribute("pageVO",pageVO);
      
      return "board/board";
   }
   
	@RequestMapping(value = "/boardone", method = RequestMethod.GET) //게시글 자세히 보기
	public String boardone(Locale locale, Model model,@RequestParam("bno") String bno,@RequestParam("id") String id) throws Exception {
		System.out.println(bno);
		bsvs.plusCnt(bno); //조회수 증가
		
		BoardVO bvo=bsvs.selectB(bno); //게시글 정보 객체 받아오기
		String attach =bsvs.selectAttach(bno); //게시글 사진 받아오기
		String carName=bsvs.selectCN(bvo.getRno()); // 예약한 차모델 받아오기
		
		GoodlistVO gvo=new GoodlistVO();
		gvo.setBno(Integer.parseInt(bno));
		gvo.setId(id);
		
		int heartval =bsvs.countLike(gvo); //로그인 아이디가 해당글에 좋아요 눌렀는지 여부 확인

		List<CommentsVO> clist=bsvs.selectCom(bno);//댓글 받아오기
		
		bvo.setFname(attach); // 게시글 객체에 사진 정보넣어주기
		
		model.addAttribute("heartval",heartval);
		model.addAttribute("clist",clist); //게시글 댓글 정보 넘겨주기
		model.addAttribute("bvo",bvo); //게시글 정보 객체 넘겨주기
		model.addAttribute("carName",carName);//차모델 정보 객체 넘겨주기 
		return "board/boardone";
	}
	
	@RequestMapping(value = "/comAction", method = RequestMethod.GET)	//댓글 등록
	public void comAction(Locale locale, Model model, HttpServletResponse response, @ModelAttribute("CommentsVO") CommentsVO CommentsVO) throws Exception {
		System.out.println(CommentsVO.getBno()); 
		System.out.println(CommentsVO.getComments());
		System.out.println(CommentsVO.getId());
		bsvs.inputC(CommentsVO);
		
		response.sendRedirect("boardone?bno="+CommentsVO.getBno()+"&id="+CommentsVO.getId());
	}
	
	@RequestMapping(value = "/delCom", method = RequestMethod.GET)	//댓글 삭제
	public String delCom(Locale locale, Model model,@RequestParam("id") String id, @RequestParam("bbno") String bbno,@RequestParam("bno") String bno) throws Exception {
		bsvs.delCom(bbno);
		return "redirect:/boardone?bno="+bno+"&id="+id;
	}
	
	
	@ResponseBody
	   @RequestMapping(value = "/boardpo", method = RequestMethod.GET) // 게시글 등록여부
	   public String post(Locale locale, Model model, ReserveVO rvo, @RequestParam("id") String id, BoardVO bvo,
	         HttpSession session) throws Exception {
	      String message = "";
	      System.out.println(id);
	      List<ReserveVO> list = rsvs.selectlist(id);
	      if (list.size() == 0) {
	         message = "<script>alert('후기를 작성할 예약건이 없습니다.');location.href='/one/boardview';</script>";
	         return message;
	      }
	      model.addAttribute("list", list);
	      message = "<script>location.href='/one/boardpost?id=" + id + "';</script>";
	      return message;
	   }
	
	@RequestMapping(value = "/boardpost", method = RequestMethod.GET)
	public String post(Locale locale, Model model, ReserveVO rvo, @RequestParam("id") String id) throws Exception {
		
		System.out.println(id);
		List<ReserveVO> list = rsvs.selectlist(id);
		model.addAttribute("list", list);
		
		return "board/boardpost"; //
	}

	@RequestMapping(value = "/wrAction", method = RequestMethod.POST)
	public String wrAction(Locale locale, Model model, BoardVO bvo, MultipartFile[] file) throws Exception {
		String[] fileNames = FileDataUtil.fileUpload(file);
		bvo.setFiles(fileNames);
		
		bsvs.insertOne(bvo); //게시글 등록
		rsvs.updateR(bvo.getRno()); //예약 테이블의 후기 여부 업데이트
		return "redirect:/boardview"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/delBoard", method = RequestMethod.GET)	//게시글 삭제
	public String delBoard(Locale locale, Model model, @RequestParam("bno") String bno, HttpSession session) throws Exception {
		String message = "";
		bsvs.delBoard(bno);
	
		message = "<script>alert('게시글이 삭제되었습니다.');location.href='/one/boardview';</script>";
		return message;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/modiAction", method = RequestMethod.POST)	//수정 등록
	public String modiAction(Locale locale, Model model, BoardVO bvo, HttpSession session,MultipartFile[] file) throws Exception {
		
		String message = "";
		if(bvo.getTitle().equals("")) {
			message = "<script>alert('제목을 입력해주세요');history.back()</script>";
			return message;
		}else if(bvo.getContent().equals("")) {
			message = "<script>alert('내용을 입력해주세요');history.back()</script>";
			return message;
		}
		
		String[] fileNames = FileDataUtil.fileUpload(file);
		bvo.setFname(fileNames[0]);
		
		bsvs.updateB(bvo); //게시글 수정
		bsvs.updateBfile(bvo); // 첨부파일 수정

		message = "<script>alert('게시글이 수정되었습니다.');location.href='/one/boardone?bno="+bvo.getBno()+"&id="+bvo.getId()+"';</script>";
		return message;
	}
	
	@RequestMapping(value = "/modiBoard", method = RequestMethod.GET)	//수정폼
	public String modiBoard(Locale locale, Model model,@RequestParam("bno") String bno, HttpSession session) throws Exception {
		BoardVO bvo=bsvs.modiB(bno);	// 게시글 정보 받아오기
		ReserveVO rvo= rsvs.reservOne(bvo.getRno()); //예약 정보 받아오기

		model.addAttribute("bvo",bvo); //게시글 정보 객체 넘겨주기
		model.addAttribute("rvo",rvo);
		return "board/boardmodview";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)	//검색
	public String search(Locale locale, Model model,  @ModelAttribute("pageVO")PageVO shPage,@RequestParam("keyword") String keyword,HttpSession session) throws Exception {
		
		if (shPage.getPage() == null) { // 클라이언트가 페이지정보를 넘겨주지 않는다면 기본값 1로 셋팅
			shPage.setPage(1);
		}
		
		
		shPage.setKeyword(keyword); //검색한 단어 

		int searchpageCnt = bsvs.countSh(shPage); //총 글 갯수

		shPage.setTotalCount(searchpageCnt);
		
		System.out.println(shPage.getStartNo()+"시작");
		System.out.println(shPage.getEndNo()+"끝");
		
		List<BoardVO> list = bsvs.selectSh(shPage);
		
		
		
		model.addAttribute("bList", list);
		model.addAttribute("pageVO", shPage);

		return "board/boardsearch";
	}
	
	
	@RequestMapping(value = "/modicom", method = RequestMethod.GET)	
	public String modicom(Locale locale, Model model,@ModelAttribute("CommentsVO")CommentsVO cvo) throws Exception {
		bsvs.modiC(cvo);
		
		return "board/boardone";
	}
	
	
	@RequestMapping(value = "/updateG", method = RequestMethod.GET)	
	public String updateG(Locale locale, Model model,@ModelAttribute("GoodlistVO")GoodlistVO gvo) throws Exception {

		bsvs.updateG(gvo); //좋아요 갯수 +,-1 업데이트 mapper안에 if걸어둠
		if(gvo.getHeartval()==0) {
			bsvs.insertL(gvo);
		}else if(gvo.getHeartval()==1){
			bsvs.deleteL(gvo);
		}
		
		return "board/boardone";
	}

}
