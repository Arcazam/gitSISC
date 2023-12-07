package study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import board.model.BoardDao;
import study.model.StudyBean;
import study.model.StudyDao;

@Controller
public class StudyListController {
	
	private final String command = "SelectAllStudy.st";
	private final String viewPage = "SelectAllStudy";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<StudyBean> lists = sdao.getAllStudy();
		model.addAttribute("list",lists);
		return viewPage;
		
	}
	
}