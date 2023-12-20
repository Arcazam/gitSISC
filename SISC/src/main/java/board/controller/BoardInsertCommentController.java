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
public class BoardInsertCommentController {
	
	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/insertComments.bd";
	public final String gotoPage = "redirect:/detailList.bd";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toInsertComments(
				Model model,
				HttpSession session,
				@ModelAttribute("bb") BoardBean bb,
				HttpServletResponse response,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam(value = "board", required = false) String board
			) throws IOException {
			
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef()  + "&pageNumber=" + pageNumber + "&board=" + board);
			
			return "redirect:login.mb";
		}
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
	    bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	    
	    bor_dao.updateCommentsProc(bb);
	    System.out.println("level1:"+bb.getRe_level());
	    int cnt = bor_dao.insertCommentsProc(bb);
	    System.out.println("level2:"+bb.getRe_level());
	    System.out.println("cnt:"+cnt);
	    
	    if(cnt == 1) {
			out.println("<script>alert('내용 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			model.addAttribute("b_num",bb.getB_num());
			model.addAttribute("pageNumber",pageNumber);
		}
	    
	    model.addAttribute("b_num",bb.getB_num());
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef() + "&board=" + board;
	}
	
	@RequestMapping(value = "insertComments2.bd")
	public String isnert(		Model model,
			HttpSession session,
			@ModelAttribute("bb") BoardBean bb,
			HttpServletResponse response,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("re_level") int re_level,
			@RequestParam(value = "board", required = false) String board
		) throws IOException {
		
	MemberBean mb = (MemberBean)session.getAttribute(sessionID);
	
	if(mb == null) {
		session.setAttribute("destination", gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef()  + "&pageNumber=" + pageNumber + "&board=" + board);
		
		return "redirect:login.mb";
	}
	
	response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
	
    bb.setReg_date(new Timestamp(System.currentTimeMillis()));
    bb.setRe_level(bb.getRe_level());
    bor_dao.updateCommentsProc(bb);
    System.out.println(re_level);
    int cnt = bor_dao.insertCommentsProc(bb);
    System.out.println("level2:"+bb.getRe_level());
    
    if(cnt == 1) {
		out.println("<script>alert('내용 글자수 제한을 초과하였습니다!');</script>");
		out.flush();
		model.addAttribute("b_num",bb.getB_num());
		model.addAttribute("pageNumber",pageNumber);
	}
    
    model.addAttribute("b_num",bb.getB_num());
	model.addAttribute("pageNumber",pageNumber);
	
	return gotoPage + "?b_num=" + bb.getB_num() + "&ref=" + bb.getRef() + "&board=" + board;
}
	
}
