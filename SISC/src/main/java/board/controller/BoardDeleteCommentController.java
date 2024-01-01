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
	public final String command2 = "/deleteReply.bd";
	public final String gotoPage = "redirect:/detailList.bd";
	
	@RequestMapping(value=command)
	public String toDeleteComments(
			Model model,
			@ModelAttribute("bb") BoardBean bb,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("orib_num") int orib_num,
			@RequestParam("board") String board
			) {
		//orib_num과 board는 경로 설정을 위해 가져온다
		
		bor_dao.deleteComments(bb);
		
		return gotoPage + "?b_num=" + orib_num + "&ref=" + bb.getRef() + "&pageNumber=" + pageNumber +"&board=" + board;
	}
	
	@RequestMapping(value=command2)
	public String toDeleteReply(
			Model model,
			@ModelAttribute("bb") BoardBean bb,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("orib_num") int orib_num,
			@RequestParam("board") String board
			) {
		
		bor_dao.deleteReply(bb);
		
		return gotoPage + "?b_num=" + orib_num + "&ref=" + bb.getRef() + "&pageNumber=" + pageNumber +"&board=" + board;
	}
	
}
