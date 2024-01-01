package study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import book.model.BookBean;
import study.model.StudyBean;
import study.model.StudyDao;
import utility.MyBoardPaging;
import utility.BookPaging;
import utility.StudyPaging;

@Controller
public class StudyDetailController {
	private final String command = "detail.st";
	private final String gotoPage = "DetailStudy";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(value = command)
	public String detail(@RequestParam("s_num") int s_num,
						@RequestParam("id") String id,
						@RequestParam("pro_img") String pro_img,
						@RequestParam("pageNumber") int pageNumber, Model model) {

		StudyBean sb = sdao.getDetailStudy(s_num);
		model.addAttribute("sb",sb);
		model.addAttribute("id",id);
		model.addAttribute("pro_img",pro_img);
		model.addAttribute("pageNumber",pageNumber);
		
		return gotoPage;
	}
}