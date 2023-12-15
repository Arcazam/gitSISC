package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDeleteController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/delete.bd";
	public final String gotoPage = "redirect:/board.bd";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelete(
				Model model, HttpSession session,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "board", required = false) String board
			) {
		System.out.println("board"+board);
		
		Object loginInfo = session.getAttribute("loginInfo");
	    if(loginInfo == null) {
	    	session.setAttribute("destination", "redirect:delete.bd?b_num=" + b_num + "&board=" + board + "&pageNumber=" + pageNumber);
	        return "redirect:login.mb";
	    }
	    
		BoardBean bb = new BoardBean();
		bb.setB_num(b_num);
		bor_dao.deleteBoardContent(bb);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("board",board);
		
		return gotoPage;
	}
	
}
