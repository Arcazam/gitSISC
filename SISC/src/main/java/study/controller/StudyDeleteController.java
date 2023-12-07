package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import study.model.StudyDao;

@Controller
public class StudyDeleteController {
	private final String command = "delete.st";
	private final String gotoPage = "redirect:SelectAllStudy.st";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("s_num") int s_num){
		
		sdao.deleteStudy(s_num);
		
		return gotoPage;
	}
}
