package study.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import study.model.StudyBean;
import study.model.StudyDao;
import utility.BoardPaging;

@Controller
public class StudyListController {
	
	private final String command = "SelectAllStudy.st";
	private final String viewPage = "SelectAllStudy";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(command)
	public String list(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String url = request.getContextPath()+"/"+command;
		
		int totalCount = sdao.getTotalCount(map); 
		
		File updateImg = (File)session.getAttribute("updateImg");
		
		String pageSize = "5"; 
		BoardPaging pageInfo = new BoardPaging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		List<StudyBean> lists = sdao.getAllStudy(pageInfo, map);
		model.addAttribute("list",lists);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("updateImg", updateImg);
		
		return viewPage;
		
	}
	
}