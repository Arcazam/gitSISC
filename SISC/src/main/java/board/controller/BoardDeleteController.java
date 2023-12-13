package board.controller;

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
	public final String gotoPage = "redirect:/list.bd";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelete(
				Model model,
				@RequestParam("b_num") int b_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		BoardBean bb = new BoardBean();
		bb.setB_num(b_num);
		bor_dao.deleteBoardContent(bb);
		
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage;
	}
	
}
