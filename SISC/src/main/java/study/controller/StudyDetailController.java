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
import utility.BoardPaging;
import utility.BookPaging;
import utility.StudyPaging;

@Controller
public class StudyDetailController {
	private final String command = "detail.st";
	private final String command2 = "myboard.st";
	private final String command3 = "mycomment.st";
	private final String command4 = "myBook.st";
	private final String gotoPage = "DetailStudy";
	private final String gotoPage2 = "SelectMyBoard";
	private final String gotoPage3 = "SelectMyComment";
	private final String gotoPage4 = "SelectMyBook";
	
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
		BoardPaging pageInfo = new BoardPaging(pageNumber,pageSize,totalCountForMember,url,whatColumn,keyword,id,pro_img);
		
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
		BoardPaging pageInfo = new BoardPaging(pageNumber,pageSize,totalCountForMember,url,whatColumn,keyword,id,pro_img);
		
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
