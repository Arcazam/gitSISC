package board.controller;

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

@Controller
public class InquiryUpdateController {
	private final String command = "InquiryUpdate.bd";
	private final String viewPage = "InquiryUpdate";
	private final String gotoPage = "redirect:inquiryDetail.bd";
	public final String sessionID = "loginInfo";
	
	@Autowired
	BoardDao bdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String updateForm(
			@RequestParam("b_num") int b_num,
			@RequestParam("menu") String board, 
			HttpSession session, Model model) {

		BoardBean bd = bdao.getInquiryDetail(b_num);
		
		model.addAttribute("bd", bd);
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String update(
			@ModelAttribute("bb") BoardBean bb,
			@RequestParam("b_num") int b_num,
			@RequestParam("menu") String board,
			HttpSession session, Model model) {
		
		bdao.updateInquiry(bb);
		
		model.addAttribute("bd", bb);
		model.addAttribute("b_num", b_num);
		model.addAttribute("menu", board);
		
		return gotoPage;
	}
}
