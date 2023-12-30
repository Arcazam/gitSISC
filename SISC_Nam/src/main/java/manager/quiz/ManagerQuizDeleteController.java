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
public class ManagerQuizDeleteController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/quizDelete.mag";
	public final String gotoPage = "redirect:/quizList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
				Model model
				,HttpServletResponse response
				,QuizBean qb
				,@RequestParam("qz_num") int qz_num
				,@RequestParam("que_cate") String que_cate
				,@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		qb.setQz_num(qz_num);
		qb.setQue_cate(que_cate);
		
		qdao.deleteQuiz(qb);
		
		out.println("<script>alert('"+qz_num+"번 레코드가 삭제되었습니다!');location.href='quizList.mag?pageNumber="+pageNumber+"&que_cate="+que_cate+"';</script>");
		out.flush();
		
		return gotoPage;
	}
	
}
