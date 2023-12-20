package quiz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import quiz.model.QuizDao;

@Controller
public class QuizInsertController {
	private final String command = "insert.qz";
	private final String viewPage = "QuizInsert";
	private final String gotoPage = "redirect:list.qz";
	public final String sessionID = "loginInfo";
	
	@Autowired
	private QuizDao qdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insert(Model model, HttpSession session) {
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:insert.bk");
			
			return "redirect:login.mb";
		}
		
		model.addAttribute("mb",mb);
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String goList() {
		
		
		return gotoPage;
	}
}
