package quiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class QuizAnswerCheckController {

	@Autowired
	private QuizDao qdao;

	public final String command = "/checkAnswer.qz";

	@RequestMapping(value = command)
	@ResponseBody
	public String checkAnswer(QuizBean qb, @RequestParam("questionNumber") int questionNumber,
			@RequestParam("selectedValue") String selectedValue) {

		qb.setQz_num(questionNumber);
		qb.setAnswer(selectedValue);

		int checkAnswer = qdao.checkAnswer(qb);

		if (checkAnswer == 1) {
			return "correct";
		} else {
			return "incorrect";
		}

	}

}
