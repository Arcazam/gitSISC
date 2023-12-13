package book.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class BookUpdateController {

	@Autowired
	private BookDao bok_dao;
	
	@Autowired
	ServletContext servletContext;
	
	public final String command = "/update.bk";
	public final String viewPage = "BookUpdate";
	public final String sessionID = "loginInfo";
	public final String gotoPage = "redirect:/list.bk";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toUpdateBookForm(
				Model model,
				@RequestParam("bk_num") int bk_num,
				BoardBean bb,
				HttpSession session
			) {
		// 사용자 세션값 불러와서 BoardList.jsp에 저장해 놓을 객체를 모델로 주입 준비
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		// 사용자가 쓴 게시판
		bb.setB_num(bk_num);
		bb.setWriter(mb.getId());
		
		BoardBean modelDetailBoard = bok_dao.getWriterNumDetail(bb);
		
		model.addAttribute("mb",mb);
		model.addAttribute("bb",modelDetailBoard);
		return viewPage;
	}
	
}
