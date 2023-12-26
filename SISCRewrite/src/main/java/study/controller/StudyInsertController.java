package study.controller;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import study.model.StudyBean;
import study.model.StudyDao;

@Controller
public class StudyInsertController {
	private final String command = "insert.st";
	private final String viewPage = "InsertStudy";
	private final String gotoPage = "redirect:SelectAllStudy.st";

	@Autowired
	private StudyDao sdao;
	
	@Autowired
	ServletContext servletcontext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String editor() {
		return viewPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String editorInsert(@ModelAttribute("st") @Valid StudyBean st, Model model) {
		
		sdao.insertStudy(st); 
		model.addAttribute("list", st);
		
		return gotoPage;
	}
}
