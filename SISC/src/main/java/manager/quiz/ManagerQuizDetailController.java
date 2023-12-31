package manager.quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class ManagerQuizDetailController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/dListQuiz.mag";
	public final String viewPage = "quiz/magQuizDetail";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
				Model model
				,QuizBean qb
				,@RequestParam("qz_num") int qz_num
				,@RequestParam("pageNumber") int pageNumber,
				@RequestParam(value = "que_cate", required = false) String que_cate
			) {
		
		qb.setQz_num(qz_num);
		qb.setQue_cate(que_cate);
		QuizBean modelAttBor = qdao.getDetailQuiz(qb);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("qb",modelAttBor);
		
		return viewPage;
	}
	
}
