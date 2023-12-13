package book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class BookInsertController {

	@Autowired
	private BookDao bok_dao;
	
	public final String command = "/insert.bk";
	public final String viewPage = "BookInsert";
	public final String sessionID = "loginInfo";
	public final String gotoPage = "redirect:/list.bk";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertBookForm(
				Model model,
				HttpSession session
			) {
		// 사용자 세션값 불러와서 BoardList.jsp에 저장해 놓을 객체를 모델로 주입 준비
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		model.addAttribute("mb",mb);
		return viewPage;
	}
	
}
