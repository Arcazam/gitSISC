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
		
		// ����� ���ǰ� �ҷ��ͼ� BoardList.jsp�� ������ ���� ��ü�� �𵨷� ���� �غ�
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		// ī�װ��� ����� List Ÿ���� qlist. �ۼ�
		List<QuizBean> qlist = qdao.getCateQuizList();
		
		model.addAttribute("mb",mb);
		model.addAttribute("qlist",qlist);
		
		return viewPage;
	}
	
}