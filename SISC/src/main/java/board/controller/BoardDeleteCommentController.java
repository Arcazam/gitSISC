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
	
	public final String command = "/deleteComments.bd";
	public final String gotoPage = "redirect:/detailList.bd";
	
	@RequestMapping(value=command)
	public String toDeleteComments(
			Model model,
			@ModelAttribute("bb") BoardBean bb,
			HttpServletResponse response,
			@RequestParam(value = "pageNumber", required = false) int pageNumber,
			@RequestParam(value = "board", required = false) String board,
			@RequestParam(value = "b_num", required = false) int b_num,
			@RequestParam(value = "ref", required = false) int ref,
			@RequestParam(value = "originalb_num", required = false) int originalb_num
			) {
		
		int cnt = bor_dao.deleteCommentsProc(bb);
		
		return gotoPage + "?b_num=" + originalb_num + "&ref=" + ref + "&pageNumber=" + pageNumber + "&board=" + board;
	}
	
}
