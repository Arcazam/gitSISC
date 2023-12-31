package manager.book;

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
import manager.model.ManagerBean;
import utility.ManagerPaging;

@Controller
public class ManagerBookListController {

	@Autowired
	private BookDao bok_dao;
	
	public final String command = "/bookList.mag";
	public final String viewPage = "book/magBookList";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toMagBookList(
			HttpSession session,
			Model model,
			BookBean bb,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request
			) {
		
		// 관리자 세션값
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		// 해당 url에 출력될 페이징 선택
		String url = request.getContextPath()+command;

		int bookMagCount = bok_dao.bookMagCount(map);
		ManagerPaging pageInfo = new ManagerPaging(pageNumber,null,bookMagCount,url,whatColumn,keyword);
		List<BookBean> book_list = bok_dao.getMagBookList(pageInfo,map);
		
		model.addAttribute("book_list",book_list);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("magb",magb);
		
		return viewPage;
		
	}
	
}
