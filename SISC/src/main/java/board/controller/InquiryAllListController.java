package board.controller;

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
import member.model.MemberBean;
import utility.MyBoardPaging;
import utility.InquiryPaging;

@Controller
public class InquiryAllListController {
	private final String command= "inquiryList.bd";
	private final String gotoPage= "inquiryList";
	public final String sessionID = "loginInfo";
	
	@Autowired
	BoardDao bdao;
	 
	@RequestMapping(command)
	public String allList(Model model, HttpServletRequest request,
						@RequestParam("menu") String board,
						@RequestParam(value="search", required = false) String search,
		      			@RequestParam(value="whatColumn", required = false) String whatColumn,
		    			@RequestParam(value="keyword", required = false) String keyword,
		    			@RequestParam(value="pageNumber", required = false) String pageNumber,
		    			@RequestParam(value="id", required = false) String id,
		    			@RequestParam(value="pro_img", required = false) String pro_img,
						HttpSession session) {
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		Map<String, String> map = new HashMap<String, String>();
	    map.put("search", "%" + search + "%");
	    map.put("whatColumn", whatColumn);
	    map.put("keyword", "%"+keyword+"%"); 
	    
			
	    String url = request.getContextPath()+"/"+command;
			
	    String pageSize = "10"; 
	    int boardSize = bdao.getInquiryCount(map,board);
	    System.out.println("boardSize:"+boardSize);
	    InquiryPaging pageInfo = new InquiryPaging(pageNumber,pageSize,boardSize,url,whatColumn,keyword);
	    
		List<BoardBean> list = bdao.getAllInquiry(pageInfo, map);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return gotoPage;
	}
	
}
