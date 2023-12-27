package quiz.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;


import member.model.MemberBean;
import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class QuizMakeController {

	@Autowired
	private QuizDao qdao;

	public final String command = "/makeAQ.qz";
	public final String viewPage = "MakeAQuestion";
	public final String sessionID = "loginInfo";
	public final String gotoPage = "redirect:/cateList.qz";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String toMakeAQuestion(
				@RequestParam("que_cate") String que_cate,
				HttpSession session, Model model
			) throws JsonProcessingException {

		
		// 사용자 세션값 불러와서 BoardList.jsp에 저장해 놓을 객체를 모델로 주입 준비
		MemberBean mb = (MemberBean) session.getAttribute(sessionID);

		QuizBean qb = new QuizBean();

		qb.setQue_cate(que_cate);

		// 넘겨줄 QuizBean타입 List
		List<QuizBean> list = new ArrayList<QuizBean>();

		// 랜덤 정수 5개를 받을 배열 선언
		int[] calculate_list = new int[5];

		int start_num = qdao.getStartPoint(qb);
		int end_num = qdao.getEndPoint(qb);

		calculate_list = range_Question(start_num, end_num);
		
		for (int i = 0; i < 5; i++) {
			QuizBean qb_info = quiz_info(que_cate, calculate_list[i]);
			list.add(qb_info);
		}
		
		model.addAttribute("calculate_list", Arrays.toString(calculate_list));
		model.addAttribute("mb", mb);
		model.addAttribute("que_cate", que_cate);
		model.addAttribute("list", list);

		return viewPage;
	}

	public int[] range_Question(int a, int b) {
		int[] questionList = new int[5];
		Set<Integer> chosenNumbers = new HashSet<Integer>();

		for (int i = 0; i < 5;) {
			int randomQzNum = (int) (Math.random() * (b - a + 1)) + a;
			if (chosenNumbers.add(randomQzNum)) {
				questionList[i] = randomQzNum;
				i++;
			}
		}
		return questionList;
	}

	public QuizBean quiz_info(String que_cate, int qz_num) {
		QuizBean qb = new QuizBean();
		qb.setQz_num(qz_num);
		qb.setQue_cate(que_cate);
		QuizBean sendBean = qdao.makeAQuestion(qb);
		return sendBean;
	}

}