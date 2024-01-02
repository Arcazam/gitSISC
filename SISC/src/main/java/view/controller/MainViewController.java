package view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import book.model.BookBean;
import book.model.BookDao;
import member.model.MemberBean;
import member.model.MemberDao;
import utility.BoardPaging;
import utility.MyBoardPaging;

@Controller
public class MainViewController {

	// 게시판 리스트형식 출력
	@Autowired
	private BoardDao bor_dao; 

	// 회원 빈 형식 출력
	@Autowired
	private MemberDao mem_dao;

	// 책 리스트형식 출력
	@Autowired
	private BookDao bok_dao;

	public final String command = "SiscMain.view";
	public final String viewPage = "Main";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String siscMainjsp(
				@RequestParam(value="board", required = false) String board,
				@RequestParam(value="userId",required = false) String userId,
				@RequestParam(value="search", required = false) String search,
				@RequestParam(value="whatColumn", required = false) String whatColumn,
    			@RequestParam(value="keyword", required = false) String keyword,
    			@RequestParam(value="pageNumber", required = false) String pageNumber,
    			HttpServletRequest request, Model model
			) {
	
		Map<String, String> map = new HashMap<String, String>();
	      map.put("search", "%" + search + "%");
	      map.put("whatColumn", whatColumn);
	      map.put("keyword", "%"+keyword+"%");
		
	    BoardBean bb = new BoardBean();
	    
	    String url = request.getContextPath()+"/board.bd";
	      
	    int totalCount = 0;
	       
	    BoardPaging pageInfo = new BoardPaging(pageNumber,null,totalCount,url,whatColumn,keyword,board);
		// (메인화면)자유게시판
		List<BoardBean> free_board_list = bor_dao.getAllFreeBoard(pageInfo, map);
		
		// (메인화면)지식게시판
		List<BoardBean> know_board_list = bor_dao.getAllKnowBoard(pageInfo, map);
		
		// (메인화면)qna게시판
		List<BoardBean> qna_board_list = bor_dao.getAllQnABoard(pageInfo, map);
		
		// (메인화면)수료생게시판
		List<BoardBean> grad_board_list = bor_dao.getAllGradBoard(pageInfo, map);
		
		// (메인화면)책방
		List<BookBean> book_list = bok_dao.selectAllToMainBook();
		
		// 책방 레코드 숫자
		int bookCount = bok_dao.getCountBook();
		
		// 자유 게시판
		model.addAttribute("free_board_list",free_board_list);
		
		// 정보 게시판
		model.addAttribute("know_board_list",know_board_list);
		
		// qna 게시판
		model.addAttribute("qna_board_list",qna_board_list);
		
		// 수료생 게시판
		model.addAttribute("grad_board_list",grad_board_list);
		
		// 책방
		model.addAttribute("book_list",book_list);
		model.addAttribute("bookCount",bookCount);
		
		// 로그인 한 사람에 한해서 사용자 정보 넘기기
		if(userId != null) {
			MemberBean mb = mem_dao.getAllMember(userId);
			model.addAttribute("mb",mb);
		}
		
		return viewPage;
		
	}

}
