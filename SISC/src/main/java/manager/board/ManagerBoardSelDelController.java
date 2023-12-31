package manager.board;

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

@Controller
public class ManagerBoardSelDelController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/delSelBoard.mag";
	public final String gotoPage = "redirect:/boardList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
			Model model
			,HttpServletResponse response
			,BoardBean bb
			,String[] rowcheck
			,@RequestParam("pageNumber") int pageNumber
			,@RequestParam("b_cate") String b_cate
			) throws IOException {
		
		int checkDelete = 0;
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		for(int i=0;i<rowcheck.length;i++) {
			int bnum = Integer.parseInt(rowcheck[i]);
			bb.setB_num(bnum);
			bb.setRef(bnum);
			checkDelete += bor_dao.selectAndDelteBoard(bb);
		}
		
		if(checkDelete == 0) {
			out.println("<script>alert('선택삭제중 오류발생!');location.href='boardList.mag?pageNumber="+pageNumber+"&b_cate="+b_cate+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('선택된 레코드가 삭제되었습니다');location.href='boardList.mag?pageNumber="+pageNumber+"&b_cate="+b_cate+"';</script>");
			out.flush();
		}
		
		return gotoPage;
	}
	
}
