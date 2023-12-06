package study.controller;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import study.model.StudyBean;
import study.model.StudyDao;

@Controller
public class StudyInsertController {
	private final String command = "editor.st";
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
	public String editorInsert(@RequestParam("txt") String txt, @ModelAttribute("sm") @Valid StudyBean sb) {
		
		sdao.insertMemo(txt); 
		return gotoPage;
	}
}
