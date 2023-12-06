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

	// �Խ��� ����Ʈ���� ���
	@Autowired
	private BoardDao bor_dao;
	
	// ȸ�� �� ���� ���
	@Autowired
	private MemberDao mem_dao;
	
	// å ����Ʈ���� ��� 
	@Autowired
	private BookDao bok_dao;
	
	public final String command = "/list.vw";
	public final String viewPage = "siscMain";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String siscMainjsp(
				Model model
			) {
	
		// (����ȭ��)�����Խ���
		List<BoardBean> free_board_list = bor_dao.getAllFreeBoard();
		// �����Խ��� ���ڵ� ����
		int freeBoardCount = bor_dao.getCountFree();
		
		// (����ȭ��)���İԽ���
		List<BoardBean> know_board_list = bor_dao.getAllKnowBoard();
		// ���İԽ��� ���ڵ� ����
		int knowBoardCount = bor_dao.getCountKnow();
		
		// (����ȭ��)qna�Խ���
		List<BoardBean> qna_board_list = bor_dao.getAllQnABoard();
		// QnA�Խ��� ���ڵ� ����
		int qnaBoardCount = bor_dao.getCountQnA();
		
		// (����ȭ��)������Խ���
		List<BoardBean> grad_board_list = bor_dao.getAllGradBoard();
		// ������Խ��� ���ڵ� ����
		int gradBoardCount = bor_dao.getCountGrad();
		
		// (����ȭ��)å��
		List<BookBean> book_list = bok_dao.selectAllToMainBook();
		// å�� ���ڵ� ����
		int bookCount = bok_dao.getCountBook();
		
		// ���� �Խ���
		model.addAttribute(free_board_list);
		model.addAttribute(freeBoardCount);
		
		// ���� �Խ���
		model.addAttribute(know_board_list);
		model.addAttribute(knowBoardCount);
		
		// qna �Խ���
		model.addAttribute(qna_board_list);
		model.addAttribute(qnaBoardCount);
		
		// ����� �Խ���
		model.addAttribute(grad_board_list);
		model.addAttribute(gradBoardCount);
		
		// å��
		model.addAttribute(book_list);
		model.addAttribute(bookCount);
		
		return viewPage;
		
	}
	
}
