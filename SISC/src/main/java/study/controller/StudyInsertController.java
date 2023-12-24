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
	public String editor(@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img,
			Model model) {
		model.addAttribute("id",id);
		model.addAttribute("pro_img",pro_img);
		
		return viewPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String editorInsert(@ModelAttribute("st") @Valid StudyBean st, 
			Model model,
			@RequestParam("s_writer") String id,
			@RequestParam("pro_img") String pro_img) {
		sdao.insertStudy(st);
		model.addAttribute("list", st);
		model.addAttribute("pro_img", pro_img);
		
		return gotoPage + "?id=" + id;
	}
}
