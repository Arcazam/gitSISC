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

import board.model.BoardBean;
import book.model.BookBean;
import member.model.MemberBean;
import study.model.StudyBean;
import study.model.StudyDao;
import utility.BookPaging;
import utility.MyBoardPaging;
import utility.StudyPaging;

@Controller
public class StudyListController {
	
	private final String command = "SelectAllStudy.st";
	private final String viewPage = "SelectAllStudy";
	public final String sessionID = "loginInfo";
	
	private final String command2 = "myboard.st";
	private final String command3 = "mycomment.st";
	private final String command4 = "myBook.st";
	private final String gotoPage2 = "SelectMyBoard";
	private final String gotoPage3 = "SelectMyComment";
	private final String gotoPage4 = "SelectMyBook";
	
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
	
	
	@RequestMapping(command2)
	public String myBoard(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img,
			@RequestParam("writer") String writer) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String url = request.getContextPath()+"/"+command;
		
		Object updateImg = (Object) session.getAttribute("updateImg");
		
		String pageSize = "15"; 
		int totalCountForMember = sdao.getTotalCountComment(map, id); 
		MyBoardPaging pageInfo = new MyBoardPaging(pageNumber,pageSize,totalCountForMember,url,whatColumn,keyword,id,pro_img);
		
		List<BoardBean> lists = sdao.getMyBoard(pageInfo, map, writer);
		
		model.addAttribute("sb", lists);
		model.addAttribute("updateImg", updateImg);
		model.addAttribute("pageInfo", pageInfo);
		
		return gotoPage2;
	}
	
	@RequestMapping(command3)
	public String myComment(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img,
			@RequestParam("writer") String writer) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String url = request.getContextPath()+"/"+command;
		
		Object updateImg = (Object) session.getAttribute("updateImg");
		
		String pageSize = "15"; 
		int totalCountForMember = sdao.getTotalCountComment(map, id); 
		MyBoardPaging pageInfo = new MyBoardPaging(pageNumber,pageSize,totalCountForMember,url,whatColumn,keyword,id,pro_img);
		
		List<BoardBean> lists = sdao.getMyComment(pageInfo, map, writer);
		
		model.addAttribute("sb", lists);
		model.addAttribute("updateImg", updateImg);
		model.addAttribute("pageInfo", pageInfo);
		
		return gotoPage3;
	}
	
	@RequestMapping(command4)
	public String myBook(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img,
			@RequestParam("writer") String writer) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		String url = request.getContextPath()+"/"+command;
		
		Object updateImg = (Object) session.getAttribute("updateImg");
		
		String pageSize = "15"; 
		int totalCountForMember = sdao.getTotalCountBook(map, id); 
		BookPaging pageInfo = new BookPaging(pageNumber,pageSize,totalCountForMember,url,whatColumn,keyword,id,pro_img);
		
		List<BookBean> lists = sdao.getMyBook(pageInfo, map, writer);
		
		model.addAttribute("sb", lists);
		model.addAttribute("updateImg", updateImg);
		model.addAttribute("pageInfo", pageInfo);
		
		return gotoPage4;
	}

}