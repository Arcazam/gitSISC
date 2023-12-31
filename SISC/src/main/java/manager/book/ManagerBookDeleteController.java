package manager.book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;

@Controller
public class ManagerBookDeleteController {

	@Autowired
	private BookDao bdao;
	
	public final String command = "/bookDelete.mag";
	public final String gotoPage = "redirect:/bookList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
				Model model
				,HttpServletResponse response
				,BookBean bb
				,@RequestParam("bk_num") int bk_num
				,@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		bb.setBk_num(bk_num);
		
		bdao.deleteBook(bk_num);
		
		out.println("<script>alert('"+bk_num+"번 레코드가 삭제되었습니다!');location.href='bookList.mag?pageNumber="+pageNumber+"';</script>");
		out.flush();
		
		return gotoPage;
	}
	
}
