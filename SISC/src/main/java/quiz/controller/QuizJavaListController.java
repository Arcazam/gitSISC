package quiz.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import quiz.model.QuizBean;
import quiz.model.QuizDao;
import utility.QuizPaging;

@Controller
public class QuizJavaListController {
	private final String command = "JavaList.qz";
	private final String gotoPage = "QuizJavaList";
	
	@Autowired
	private QuizDao qdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<QuizBean> lists = qdao.getJavaQuiz();
		
		model.addAttribute("list",lists);
		
		return gotoPage;
	}
}
