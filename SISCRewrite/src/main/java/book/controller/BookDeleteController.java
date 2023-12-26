package book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class BookDeleteController {
	private final String command = "delete.bk";  
	private final String gotoPage = "redirect:list.bk";
	public final String sessionID = "loginInfo";
	
	@Autowired
	private BookDao bdao;
	
	@RequestMapping(value = command)
	public String detail(@RequestParam("bk_num") int bk_num, 
						@RequestParam("pageNumber") int pageNumber, 
						Model model, HttpSession session) {

		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:detail.bk?bk_num="+bk_num+"&pageNumber="+pageNumber);
			
			return "redirect:login.mb";
		}
		
		bdao.deleteBook(bk_num); 
		
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage;
	}
		
}
