package book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class BookDeleteController {
	private final String command = "delete.bk";  
	private final String command2 = "deleteMyBook.bk";
	private final String command3 = "endsell.bk";
	private final String gotoPage = "redirect:list.bk";
	private final String gotoPage2 = "redirect:myBook.st";
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
		
	@RequestMapping(value=command2)
	public String toDeleteMyBoard(
				Model model, HttpSession session,
				@RequestParam("bk_num") int bk_num, 
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "id", required = false) String id,
				@RequestParam(value = "pro_img", required = false) String pro_img
			) {
		
		bdao.deleteBook(bk_num); 
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage2 + "?id=" + id + "&pro_img=" + pro_img + "&writer=" + id;
	}
	
	@RequestMapping(value=command3)
	public String endSell(
				Model model, HttpSession session,
				@RequestParam("bk_num") int bk_num, 
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "id", required = false) String id,
				@RequestParam(value = "pro_img", required = false) String pro_img
			) {
		
		bdao.SaleComple(bk_num); 
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage2 + "?id=" + id + "&pro_img=" + pro_img + "&writer=" + id;
	}
}
