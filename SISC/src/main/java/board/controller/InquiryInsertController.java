package board.controller;

import javax.servlet.http.HttpServletRequest;
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
public class InquiryInsertController {
	private final String command= "insertInquiry.bd";
	private final String viewPage= "insertInquiry";
	private final String gotoPage= "redirect:inquiry.bd";
	public final String sessionID = "loginInfo";
	
	@Autowired
	BoardDao bdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insertForm(Model model, HttpServletRequest request,
						@RequestParam("menu") String board,
						HttpSession session) {
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:insertInquiry.bd?menu="+board);
			
			return "redirect:login.mb";
		}
		
		model.addAttribute("board", board);
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(Model model, HttpServletRequest request,
						@RequestParam("board") String board,
						@ModelAttribute("bb") BoardBean bb,
						HttpSession session) {
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		bb.setWriter(mb.getId());
		bb.setB_cate("inquiry");
		
		bdao.insertInquiry(bb);
		
		
		return gotoPage + "?menu=" + board;
	}
}
