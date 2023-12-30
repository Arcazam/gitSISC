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
public class ManagerBoardDeleteController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/boardDelete.mag";
	public final String gotoPage = "redirect:/boardList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
				Model model
				,HttpServletResponse response
				,BoardBean bb
				,@RequestParam("b_num") int b_num
				,@RequestParam("b_cate") String b_cate
				,@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		bb.setB_num(b_num);
		bb.setB_cate(b_cate);
		
		bor_dao.deleteBoardContent(bb);
		
		out.println("<script>alert('"+b_num+"번 레코드가 삭제되었습니다!');location.href='boardList.mag?pageNumber="+pageNumber+"&b_cate="+b_cate+"';</script>");
		out.flush();
		
		return gotoPage;
	}
	
}
