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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;
import utility.BoardPaging;

@Controller
public class BoardListController {

	// 게시판 리스트형식 출력
	@Autowired
	private BoardDao bor_dao;
		
	public final String command = "/list.bd";
	public final String viewPage = "BoardList";
	public final String sessionID = "loginInfo";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toBoardList(
				HttpSession session,
				Model model,
				BoardBean bb,
				@RequestParam("b_cate") String b_cate,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
		// 리스트 목록들
		List<BoardBean> board_cateList = null;
		// 해당 카테고리 게시판 레코드 숫자(원글)
		int boardCateCount;
		// 각 게시판마다 정해줄 게시판 페이징 클래스 객체
		BoardPaging pageInfo = null;
		
		// 사용자 세션값 불러와서 BoardList.jsp에 저장해 놓을 객체를 모델로 주입 준비
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
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
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectFreeDetailCate(pageInfo,map);
		} 
		
		// 지식 게시판 페이징 처리, 카테고리당 검색 기능
		else if (bb.getB_cate().equals("Know")) {
			boardCateCount = bor_dao.getCountKnow();
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectKnowDetailCate(pageInfo,map);
		} 
		
		// QnA 게시판 페이징 처리, 카테고리당 검색 기능
		else if (bb.getB_cate().equals("QnA")) {
			boardCateCount = bor_dao.getCountQnA();
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectQnADetailCate(pageInfo,map);
		} 
		
		// 수료생 게시판 페이징 처리, 카테고리당 검색 기능
		else {
			boardCateCount = bor_dao.getCountGrad();
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectGradDetailCate(pageInfo,map);
		}
		
		model.addAttribute("boardCateCount",boardCateCount);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("board_cateList",board_cateList);
		model.addAttribute("mb",mb);
		
		return viewPage;
	}
	
}
