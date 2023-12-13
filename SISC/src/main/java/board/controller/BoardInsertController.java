package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

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
public class BoardInsertController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/insert.bd";
	public final String sessionID = "loginInfo";
	public final String viewPage = "InsertBoard";
	public final String gotoPage = "redirect:/board.bd";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertBoard(
			@RequestParam("board") String board,
				Model model,
				HttpSession session
			) {
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:insert.bd?board="+board);
			
			return "redirect:login.mb";
		}
		
		model.addAttribute("mb",mb);
		model.addAttribute("board", board);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toMainBoradList(
				@RequestParam("board") String board,
				@ModelAttribute("bb") BoardBean bb,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		
		int cnt;
		
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
				
		cnt = bor_dao.insertBoardContent(bb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			return viewPage;
		}
		
		return gotoPage + "?board=" + board;
	}
	
}
