package manager.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;

@Controller
public class ManagerBookDetailController {

	@Autowired
	private BookDao bdao;
	
	public final String command = "/dListBook.mag";
	public final String viewPage = "book/magBookDetail";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
				Model model
				,BookBean bb
				,@RequestParam("bk_num") int bk_num
				,@RequestParam("pageNumber") int pageNumber
			) {
		
		bb.setBk_num(bk_num);
		BookBean modelAttBor = bdao.getWriterNumDetail(bb);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",modelAttBor);
		
		return viewPage;
	}
	
}
