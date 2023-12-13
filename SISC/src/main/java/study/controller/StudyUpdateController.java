package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.model.StudyBean;
import study.model.StudyDao;

@Controller
public class StudyUpdateController {
	private final String command = "update.st";
	private final String viewPage = "UpdateStudy";
	private final String gotoPage = "redirect:SelectAllStudy.st";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String updateGet(@RequestParam("s_num") int s_num, 
							@RequestParam("pageNumber") int pageNumber, Model model) {
		
		StudyBean sb = sdao.getDetailStudy(s_num);
		model.addAttribute("sb",sb);
		model.addAttribute("pageNumber",pageNumber);
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("sb") StudyBean sb, 
							 @RequestParam("pageNumber") int pageNumber) {
		
		sdao.updateStudy(sb);
		
		return gotoPage + "?pageNumber=" + pageNumber;
	}
	
	
	
}
