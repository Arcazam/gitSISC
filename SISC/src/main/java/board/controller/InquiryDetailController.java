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
public class InquiryDetailController {
	private final String command = "inquiryDetail.bd";
	private final String gotoPage = "inquiryDetail";
	public final String sessionID = "loginInfo";
	
	@Autowired
	BoardDao bdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insert(Model model, HttpServletRequest request,
						@RequestParam("b_num") int b_num,
						@RequestParam("menu") String board,
						HttpSession session) {
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		BoardBean bd = bdao.getInquiryDetail(b_num);
		bdao.readcountUpdate(bd);
		model.addAttribute("bd", bd);
		model.addAttribute("mb", mb);
		model.addAttribute("menu", board);
		
		return gotoPage;
	}
	
}
