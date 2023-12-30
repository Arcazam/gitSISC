package manager.quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class ManagerQuizSelDelController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/delSelQuiz.mag";
	public final String gotoPage = "redirect:/boardList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
			Model model
			,HttpServletResponse response
			,QuizBean qb
			,String[] rowcheck
			,@RequestParam("pageNumber") int pageNumber
			,@RequestParam("que_cate") String que_cate
			) throws IOException {
		
		int checkDelete = 0;
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		for(int i=0;i<rowcheck.length;i++) {
			int qz_num = Integer.parseInt(rowcheck[i]);
			qb.setQz_num(qz_num);
			checkDelete += qdao.selectAndDelteQuiz(qb);
		}
		
		if(checkDelete == 0) {
			out.println("<script>alert('선택삭제중 오류발생!');location.href='quizList.mag?pageNumber="+pageNumber+"&que_cate="+que_cate+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('선택된 레코드가 삭제되었습니다');location.href='quizList.mag?pageNumber="+pageNumber+"&que_cate="+que_cate+"';</script>");
			out.flush();
		}
		
		return gotoPage;
	}
	
}
