package board.controller;

import javax.servlet.http.HttpServletResponse;

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
public class BoardDeleteCommentController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/updateComments.bd";
	public final String gotoPage = "redirect:/detailList.bd";
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toDeleteComments(
			Model model,
			@ModelAttribute("bb") BoardBean bb,
			HttpServletResponse response,
			@RequestParam("pageNumber") int pageNumber
			) {
		
		bor_dao.deleteCommentsProc(bb);
		
		return gotoPage;
	}
	
}
