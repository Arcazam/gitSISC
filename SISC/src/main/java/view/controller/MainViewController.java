package view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.model.BoardBean;
import board.model.BoardDao;
import book.model.BookBean;
import book.model.BookDao;
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
	
	public final String command = "/list.vw";
	public final String viewPage = "siscMain";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String siscMainjsp(
				Model model
			) {
	
		// (메인화면)자유게시판
		List<BoardBean> free_board_list = bor_dao.getAllFreeBoard();
		// 자유게시판 레코드 숫자
		int freeBoardCount = bor_dao.getCountFree();
		
		// (메인화면)지식게시판
		List<BoardBean> know_board_list = bor_dao.getAllKnowBoard();
		// 지식게시판 레코드 숫자
		int knowBoardCount = bor_dao.getCountKnow();
		
		// (메인화면)qna게시판
		List<BoardBean> qna_board_list = bor_dao.getAllQnABoard();
		// QnA게시판 레코드 숫자
		int qnaBoardCount = bor_dao.getCountQnA();
		
		// (메인화면)수료생게시판
		List<BoardBean> grad_board_list = bor_dao.getAllGradBoard();
		// 수료생게시판 레코드 숫자
		int gradBoardCount = bor_dao.getCountGrad();
		
		// (메인화면)책방
		List<BookBean> book_list = bok_dao.selectAllToMainBook();
		// 책방 레코드 숫자
		int bookCount = bok_dao.getCountBook();
		
		// 자유 게시판
		model.addAttribute(free_board_list);
		model.addAttribute(freeBoardCount);
		
		// 정보 게시판
		model.addAttribute(know_board_list);
		model.addAttribute(knowBoardCount);
		
		// qna 게시판
		model.addAttribute(qna_board_list);
		model.addAttribute(qnaBoardCount);
		
		// 수료생 게시판
		model.addAttribute(grad_board_list);
		model.addAttribute(gradBoardCount);
		
		// 책방
		model.addAttribute(book_list);
		model.addAttribute(bookCount);
		
		return viewPage;
		
	}
	
}
