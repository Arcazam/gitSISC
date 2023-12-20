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

import quiz.model.QuizDao;

@Controller
public class QuizListController {
	private final String command = "QuizSelect.qz";
	private final String gotoPage = "QuizSelect";
	
	@Autowired
	private QuizDao qdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		return gotoPage;
	}
}
