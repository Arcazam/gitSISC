package quiz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class QuizCateController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/cateList.qz";
	public final String viewPage = "QuizCateList";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toQuizCate(
				Model model,
				HttpSession session
			) {
		
		// 사용자 세션값 불러와서 BoardList.jsp에 저장해 놓을 객체를 모델로 주입 준비
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		// 카테고리당 출력할 List 타입의 qlist. 작성
		List<QuizBean> qlist = qdao.getCateQuizList();
		
		model.addAttribute("mb",mb);
		model.addAttribute("qlist",qlist);
		
		return viewPage;
	}
	
}