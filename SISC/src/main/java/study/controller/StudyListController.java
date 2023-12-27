package study.controller;

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

import member.model.MemberBean;
import study.model.StudyBean;
import study.model.StudyDao;
import utility.StudyPaging;

@Controller
public class StudyListController {
	
	private final String command = "SelectAllStudy.st";
	private final String viewPage = "SelectAllStudy";
	public final String sessionID = "loginInfo";
	
	@Autowired
	private StudyDao sdao;
	
	@RequestMapping(command)
	public String list(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img,
			@RequestParam(value = "searchCnt", required = false) String searchCnt) {
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:SelectAllStudy.st?id="+id + "&pro_img=" + pro_img);
			
			return "redirect:login.mb";
		}
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String url = request.getContextPath()+"/"+command;
		
		Object updateImg = (Object) session.getAttribute("updateImg");
		
		String pageSize = "15"; 
		int getTotalCountForMember = sdao.getTotalCountForMember(map, id); 
		StudyPaging pageInfo = new StudyPaging(pageNumber,pageSize,getTotalCountForMember,url,whatColumn,keyword,id,pro_img);
		
		List<StudyBean> lists = sdao.getAllStudy(pageInfo, map, id);
		model.addAttribute("list",lists);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("updateImg", updateImg);
		model.addAttribute("id",id);
		model.addAttribute("pro_img",pro_img);
		
		return viewPage;
		
	}
}