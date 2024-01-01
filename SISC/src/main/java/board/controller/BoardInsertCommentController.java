package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDate;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class BoardInsertCommentController {
	
	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/insertComments.bd";
	public final String command2 = "/insertReply.bd";
	public final String gotoPage = "redirect:/detailList.bd";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command)
	public String toInsertComments(
				HttpSession session,
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam("board") String board
			) throws IOException {
		
		//날짜 설정
		LocalDate now = LocalDate.now();
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef()  + "&pageNumber=" + pageNumber + "&board=" + board);
			return "redirect:login.mb";
		}
	    
	    bb.setWriter(mb.getId());
	    bb.setSubject("comments");
	    bb.setRe_level(1);
	    bb.setReg_date(String.valueOf(now));
	    
	    bor_dao.insertComments(bb);
		
		return gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef() + "&pageNumber=" + pageNumber + "&board=" + board;
	}
	
	@RequestMapping(value = command2)
	public String toInsertReply(
			HttpSession session,
			@ModelAttribute("bb") BoardBean bb,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("re_level") int re_level,
			@RequestParam("board") String board
		) throws IOException {
		
	//날짜 설정
	LocalDate now = LocalDate.now();
		
	MemberBean mb = (MemberBean)session.getAttribute(sessionID);
	
	if(mb == null) {
		session.setAttribute("destination", gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef()  + "&pageNumber=" + pageNumber + "&board=" + board);
		return "redirect:login.mb";
	}
	
	bb.setWriter(mb.getId());
	bb.setSubject("comments");
    bb.setReg_date(String.valueOf(now));
    
    int last_re_step = bor_dao.getLastRef2_Re_step(bb); //내가 답글 달려는 댓글에 달린 re_step의 마지막 값을 가져온다
    
    bb.setRe_step(last_re_step); //그 값을 re_step값으로 설정한다
    
    bor_dao.updateReply(bb);
    bor_dao.insertReply(bb);
	
	return gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef() + "&pageNumber=" + pageNumber +"&board=" + board;
}
	
}

