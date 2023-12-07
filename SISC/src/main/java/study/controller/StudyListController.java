package study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import study.model.StudyBean;
import study.model.StudyDao;
import utility.Paging;

@Controller
public class StudyListController {
	
	private final String command = "SelectAllStudy.st";
	private final String viewPage = "SelectAllStudy";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(command)
	public String list(Model model, HttpServletRequest request,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String url = request.getContextPath()+"/"+command;
		
		int totalCount = sdao.getTotalCount(map); 
		
		String pageSize = "5"; 
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		List<StudyBean> lists = sdao.getAllStudy(pageInfo, map);
		model.addAttribute("list",lists);
		model.addAttribute("pageInfo", pageInfo);
		
		return viewPage;
		
	}
	
}