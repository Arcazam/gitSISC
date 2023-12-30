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

	@RequestMapping(value=command)
	public String toUpdateComments(
				Model model,
				@ModelAttribute("bb") BoardBean bb,
				HttpServletResponse response,
				@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
	    bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	    
	    int cnt = bor_dao.updateCommentsProc(bb);
	    
	    if(cnt == 1) {
	    	out.println("<script>alert('내용 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			model.addAttribute("b_num",bb.getB_num());
			model.addAttribute("pageNumber",pageNumber);
			return gotoPage;
	    }
	    model.addAttribute("b_num",bb.getB_num());
		model.addAttribute("pageNumber",pageNumber);
		return gotoPage;
	}
	
}