package manager.board;

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
	
	public final String command = "/boardList.mag";
	public final String viewPage = "board/magBoardList";
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
		List<BoardBean> board_MagcateList = null;
		// 해당 카테고리 게시판 레코드 숫자(원글)
		int boardMagCateCount = 0;
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
		
		// 관리자 자유게시판 리스트 불러오기
		if(bb.getB_cate().equals("Free")) {
			boardMagCateCount = bor_dao.getMagCountFree(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllFree(pageInfo,map);
		} 
		
		// 관리자 지식게시판 리스트 불러오기
		else if (bb.getB_cate().equals("Know")) {
			boardMagCateCount = bor_dao.getMagCountKnow(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllKnow(pageInfo,map);
		} 
		
		// 관리자 QnA게시판 리스트 불러오기
		else if (bb.getB_cate().equals("QnA")) {
			boardMagCateCount = bor_dao.getMagCountQnA(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllQnA(pageInfo,map);
		} 
		
		// 관리자 수료생게시판 리스트 불러오기
		else {
			boardMagCateCount = bor_dao.getMagCountGrad(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllGrad(pageInfo,map);
		}
		
		model.addAttribute("boardCate",bb.getB_cate());
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("blist",board_MagcateList);
		model.addAttribute("magb",magb);
		
		return viewPage;
	}
	
}
