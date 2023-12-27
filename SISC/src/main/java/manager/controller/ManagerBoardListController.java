package manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import manager.model.ManagerBean;
import member.model.MemberBean;
import utility.BoardPaging;
import utility.ManagerPaging;

@Controller
public class ManagerBoardListController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/bookList.mag";
	public final String viewPage = "MagBoardList";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toBoardList(
				HttpSession session,
				Model model,
				BoardBean bb,
				@RequestParam(value="b_cate",required = false) String b_cate,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
		if(b_cate == null) {
			b_cate = "Free";
		}
		
		// 리스트 목록들
		List<BoardBean> board_cateList = null;
		// 해당 카테고리 게시판 레코드 숫자(원글)
		int boardCateCount;
		// 각 게시판마다 정해줄 게시판 페이징 클래스 객체
		ManagerPaging pageInfo = null;
		
		// 관리자 세션값
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		
		// 게시판 카테고리를 불러와서 빈에 저장
		bb.setB_cate(b_cate);
		
		// map에 검색카테고리와 검색어를 저장
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		// 해당 url에 출력될 페이징 선택
		String url = request.getContextPath()+command;
		
		// 자유 게시판 페이징 처리, 카테고리당 검색 기능
		if(bb.getB_cate().equals("Free")) {
			boardCateCount = bor_dao.getCountFree();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectFreeDetailCate(pageInfo,map);
		} 
		
		// 지식 게시판 페이징 처리, 카테고리당 검색 기능
		else if (bb.getB_cate().equals("Know")) {
			boardCateCount = bor_dao.getCountKnow();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectKnowDetailCate(pageInfo,map);
		} 
		
		// QnA 게시판 페이징 처리, 카테고리당 검색 기능
		else if (bb.getB_cate().equals("QnA")) {
			boardCateCount = bor_dao.getCountQnA();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectQnADetailCate(pageInfo,map);
		} 
		
		// 수료생 게시판 페이징 처리, 카테고리당 검색 기능
		else {
			boardCateCount = bor_dao.getCountGrad();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectGradDetailCate(pageInfo,map);
		}
		
		model.addAttribute("boardCateCount",boardCateCount);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("board_cateList",board_cateList);
		model.addAttribute("magb",magb);
		
		return viewPage;
	}
	
}
