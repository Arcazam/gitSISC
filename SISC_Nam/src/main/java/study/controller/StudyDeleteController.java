package study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import study.model.StudyDao;

@Controller
public class StudyDeleteController {
	private final String command = "delete.st";
	private final String gotoPage = "redirect:SelectAllStudy.st";
	private final String command2 = "delete2.st";
	private final String gotoPage2 = "redirect:myboard.st";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("s_num") int s_num, 
						@RequestParam("pageNumber") int pageNumber,
						@RequestParam("id") String id,
						@RequestParam("pro_img") String pro_img){
		
		sdao.deleteStudy(s_num);
		
		return gotoPage + "?id=" + id +"&pro_img=" + pro_img + "&pageNumber=" + pageNumber;
	}
}