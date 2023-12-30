package manager.quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class ManagerQuizInsertController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/quizInsert.mag";
	public final String viewPage = "quiz/magQuizInsert";
	public final String sessionID = "mag_loginInfo";
	public final String gotoPage = "redirect:/quizList.mag";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
				Model model
				,@RequestParam("quizCate") String quizCate
			) {
		
		model.addAttribute("quizCate",quizCate);
		
		return viewPage;
	}
	
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toInsertAndList(
				Model model
				,QuizBean qb
				,HttpServletResponse response
				,@RequestParam("que_cate") String que_cate
				,@RequestParam(value = "qz_view1", required = false) String qz_view1
				,@RequestParam(value = "qz_view2", required = false) String qz_view2
				,@RequestParam(value = "qz_view3", required = false) String qz_view3
				,@RequestParam(value = "qz_view4", required = false) String qz_view4
			) throws IOException {
		
		System.out.println("qz_view1 : "+ qz_view1);
		
		String[] qz_views = new String[4];
		
		if(qz_view1 != null) {
			qz_views[0] = qz_view1;
		}
		if(qz_view2 != null) {
			qz_views[1] = qz_view2;
		}
		if(qz_view3 != null) {
			qz_views[2] = qz_view3;
		}
		if(qz_view4 != null) {
			qz_views[3] = qz_view4;
		}
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
	//	System.out.println("qz_views 바인딩 잘했나 : "+ qz_views.length);
		
		String finalQzview = "";
		
		for (int i = 0; i < qz_views.length; i++) {
		    String qz_view = qz_views[i];
		    System.out.println("for문 안에 있는 qz_view : " + qz_view);

		    if (qz_view != null && qz_view.contains("<")) {
		        qz_view = qz_view.replace("<", "&lt;");
		    }

		    if (qz_view != null && qz_view.contains(">")) {
		        qz_view = qz_view.replace(">", "&gt;");
		    }

		    if (qb.getInterpre().contains("<")) {
		        qb.setInterpre(qb.getInterpre().replace("<", "&lt;"));
		    }

		    if (qb.getInterpre().contains(">")) {
		        qb.setInterpre(qb.getInterpre().replace(">", "&gt;"));
		    }

		    if (qz_view != null) {
		        String qz_viewPlus = "<input type='radio' name='q||qz_seq.currval||' value='" + (i + 1) + "'>" + qz_view + "<br>";
		        finalQzview += qz_viewPlus;
		    }
		}

		
		qb.setQz_view(finalQzview);
		
		int cnt = qdao.insertQuiz(qb);
		
		if(cnt != 0) {
			out.println("<script>alert('레코드가 추가되었습니다!');location.href='quizList.mag?que_cate="+que_cate+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('오류 : 레코드 추가');history.go(-1);</script>");
			out.flush();
		}
		
		return gotoPage;
	}
	
}
