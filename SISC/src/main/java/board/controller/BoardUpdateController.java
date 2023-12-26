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
public class BoardUpdateController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/update.bd";
	public final String command2 = "/update2.bd";
	public final String sessionID = "loginInfo";
	public final String viewPage = "UpdateBoard";
	public final String viewPage2 = "UpdateMyBoard";
	public final String gotoPage = "redirect:/board.bd";
	public final String gotoPage2 = "redirect:/myboard.st";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toUpdateBoard(
				Model model,
				HttpSession session,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "board", required = false) String board,
				@RequestParam(value = "writer", required = false) String writer
			) {
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		Object loginInfo = session.getAttribute("loginInfo");
	    if(loginInfo == null) {
	    	session.setAttribute("destination", "redirect:update.bd?b_num=" + b_num + "&board=" + board + "&pageNumber=" + pageNumber);
	        return "redirect:login.mb";
	    }
		
		BoardBean bb = bor_dao.getBoardInfoWriter(b_num);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		model.addAttribute("mb",mb);
		model.addAttribute("board",board);
		model.addAttribute("id",mb.getId());
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toUpdateProcBoard(
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "board", required = false) String board,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		
		int cnt;
		
		bb.setB_num(b_num);
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		cnt = bor_dao.updateBoardContent(bb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			model.addAttribute("pageNumber",pageNumber);
			model.addAttribute("board",board);
			
			return viewPage;
		}
		
		return gotoPage + "?board=" + board;
	}
	
	
	@RequestMapping(value=command2,method=RequestMethod.GET)
	public String toUpdateMyBoard(
				Model model,
				HttpSession session,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "writer", required = false) String writer,
				@RequestParam(value = "id", required = false) String id,
				@RequestParam(value = "pro_img", required = false) String pro_img
			) {
		
		BoardBean bb = bor_dao.getBoardInfoWriter(b_num);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		model.addAttribute("id",id);
		model.addAttribute("pro_img",pro_img);
		
		return viewPage2;
	}
	
	@RequestMapping(value=command2,method=RequestMethod.POST)
	public String toUpdateMyProcBoard(
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "writer", required = false) String writer,
				@RequestParam(value = "id", required = false) String id,
				@RequestParam(value = "pro_img", required = false) String pro_img,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		
		int cnt;
		
		bb.setB_num(b_num);
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		cnt = bor_dao.updateBoardContent(bb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			model.addAttribute("pageNumber",pageNumber);
			
			return viewPage2;
		}
		
		return gotoPage2 + "?id=" + id + "&pro_img=" + pro_img + "&writer=" + id;
	}
}
