package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.model.StudyBean;
import study.model.StudyDao;

@Controller
public class StudyDetailController {
	private final String command = "detail.st";
	private final String gotoPage = "DetailStudy";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(value = command)
	public String detail(@RequestParam("s_num") int s_num, 
						@RequestParam("pageNumber") int pageNumber, Model model) {

		StudyBean sb = sdao.getDetailStudy(s_num);
		model.addAttribute("sb",sb);
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage;
	}
}
