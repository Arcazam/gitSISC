package book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;

@Controller
public class BookDetailController {

	private final String command = "detail.bk";
	private final String gotoPage = "BookDetail";
	public final String sessionID = "loginInfo";
	
	@Autowired
	private BookDao bdao;
	
	@RequestMapping(value = command)
	public String detail(@RequestParam("bk_num") int bk_num, 
						@RequestParam("pageNumber") int pageNumber, Model model) {

		BookBean bb = new BookBean();
		bb.setBk_num(bk_num);
		
		BookBean detail = bdao.getWriterNumDetail(bb);
		 
		//System.out.println("detail:"+detail.getBk_num());
		
		model.addAttribute("bb",detail);
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage;
	}
		
}
