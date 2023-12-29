package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class InquiryDeleteController {
	private final String command = "InquiryDelete.bd";
	private final String gotoPage = "redirect:inquiry.bd";
	public final String sessionID = "loginInfo";
	
	@Autowired
	BoardDao bdao;
	
	@RequestMapping(command)
	public String delete(
			@RequestParam("menu") String board,
			@RequestParam("b_num") int b_num,
			HttpSession session){ 
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:inquiryDetail.bd?b_num=" + b_num + "&menu="+board);
			
			return "redirect:login.mb";
		}
		
		bdao.deleteInquiry(b_num);
		
		return gotoPage + "?menu=" + board;
	}
}
