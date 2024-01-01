package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

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
public class BoradUpdateCommentController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/updateComments.bd";
	public final String gotoPage = "redirect:/detailList.bd";

	@RequestMapping(command)
	public String updateComments(
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam("orib_num") int orib_num,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam("board") String board
			) {
		
		bor_dao.updateComments(bb);
		
		return gotoPage + "?b_num=" + orib_num + "&ref=" + bb.getRef() + "&pageNumber=" + pageNumber +"&board=" + board;
	}
	
}