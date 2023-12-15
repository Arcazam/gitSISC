package book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookDao;

@Controller
public class BookDeleteController {
	private final String command = "delete.bk";  
	private final String gotoPage = "redirect:list.bk";
	public final String sessionID = "loginInfo";
	
	@Autowired
	private BookDao bdao;
	
	@RequestMapping(value = command)
	public String detail(@RequestParam("bk_num") int bk_num, 
						@RequestParam("pageNumber") int pageNumber, Model model) {

		bdao.deleteBook(bk_num); 
		
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage;
	}
		
}
