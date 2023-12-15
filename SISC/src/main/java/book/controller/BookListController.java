package book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;
import member.model.MemberBean;
import utility.BookPaging;


@Controller
public class BookListController {

	@Autowired
	private BookDao bok_dao;
	
	public final String command = "list.bk";
	public final String viewPage = "BookList";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toBookList(
				HttpSession session,
				Model model,
				BookBean bb,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
	
				MemberBean mb = (MemberBean)session.getAttribute(sessionID); 
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		
		String url = request.getContextPath()+"/"+command;

		int bookCount = bok_dao.getCountBook();
		BookPaging pageInfo = new BookPaging(pageNumber,null,bookCount,url,whatColumn,keyword);
		List<BookBean> book_list = bok_dao.getBookList(pageInfo,map);
		
		model.addAttribute("book_list",book_list);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("bookCount",bookCount);
		 model.addAttribute("mb",mb); 
		
		return viewPage;
	}
	
}