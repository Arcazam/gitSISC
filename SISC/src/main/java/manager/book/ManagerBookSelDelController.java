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

import board.model.BoardBean;
import board.model.BoardDao;
import book.model.BookBean;
import book.model.BookDao;

@Controller
public class ManagerBookSelDelController {

	@Autowired
	private BookDao bdao;
	
	public final String command = "/delSelBook.mag";
	public final String gotoPage = "redirect:/bookList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
			Model model
			,HttpServletResponse response
			,BookBean bb
			,String[] rowcheck
			,@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		int checkDelete = 0;
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		for(int i=0;i<rowcheck.length;i++) {
			int bnum = Integer.parseInt(rowcheck[i]);
			bb.setBk_num(bnum);
			checkDelete += bdao.selectAndDelteBook(bb);
		}
		if(checkDelete == 0) {
			out.println("<script>alert('선택삭제중 오류발생!');location.href='bookList.mag?pageNumber="+pageNumber+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('선택된 레코드가 삭제되었습니다');location.href='bookList.mag?pageNumber="+pageNumber+"';</script>");
			out.flush();
		}
		return gotoPage;
	}
	
}
