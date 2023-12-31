package view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
				@RequestParam(value="userId",required = false) String userId,
				Model model, @RequestParam(value="search", required = false) String search,
				@RequestParam(value="whatColumn", required = false) String whatColumn,
    			@RequestParam(value="keyword", required = false) String keyword,
    			@RequestParam(value="pageNumber", required = false) String pageNumber
			) {
	
		Map<String, String> map = new HashMap<String, String>();
	      map.put("search", "%" + search + "%");
	      map.put("whatColumn", whatColumn);
	      map.put("keyword", "%"+keyword+"%");
		
	    BoardBean bb = new BoardBean();
	      
		// (메인화면)자유게시판
		List<BoardBean> free_board_list = bor_dao.getAllFreeBoard(map);
		// 자유게시판 레코드 숫자
		int freeBoardCount = bor_dao.getCountFree();
		
		// (메인화면)지식게시판
		List<BoardBean> know_board_list = bor_dao.getAllKnowBoard(map);
		// 지식게시판 레코드 숫자
		int knowBoardCount = bor_dao.getCountKnow();
		
		// (메인화면)qna게시판
		List<BoardBean> qna_board_list = bor_dao.getAllQnABoard(map);
		// QnA게시판 레코드 숫자
		int qnaBoardCount = bor_dao.getCountQnA();
		
		// (메인화면)수료생게시판
		List<BoardBean> grad_board_list = bor_dao.getAllGradBoard(map);
		// 수료생게시판 레코드 숫자
		int gradBoardCount = bor_dao.getCountGrad();
		
		// (메인화면)책방
		List<BookBean> book_list = bok_dao.selectAllToMainBook();
		
		// 책방 레코드 숫자
		int bookCount = bok_dao.getCountBook();
		
		// 자유 게시판
		model.addAttribute("free_board_list",free_board_list);
		model.addAttribute("freeBoardCount",freeBoardCount);
		
		// 정보 게시판
		model.addAttribute("know_board_list",know_board_list);
		model.addAttribute("knowBoardCount",knowBoardCount);
		
		// qna 게시판
		model.addAttribute("qna_board_list",qna_board_list);
		model.addAttribute("qnaBoardCount",qnaBoardCount);
		
		// 수료생 게시판
		model.addAttribute("grad_board_list",grad_board_list);
		model.addAttribute("gradBoardCount",gradBoardCount);
		
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
