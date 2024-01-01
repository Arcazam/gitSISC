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
import utility.BoardPaging;

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
	    
		// (����ȭ��)�����Խ���
		List<BoardBean> free_board_list = bor_dao.getAllFreeBoard(map);
		
		// (����ȭ��)���İԽ���
		List<BoardBean> know_board_list = bor_dao.getAllKnowBoard(map);
		
		// (����ȭ��)qna�Խ���
		List<BoardBean> qna_board_list = bor_dao.getAllQnABoard(map);
		
		// (����ȭ��)������Խ���
		List<BoardBean> grad_board_list = bor_dao.getAllGradBoard(map);
		
		// (����ȭ��)å��
		List<BookBean> book_list = bok_dao.selectAllToMainBook();
		
		// å�� ���ڵ� ����
		int bookCount = bok_dao.getCountBook();
		
		// ���� �Խ���
		model.addAttribute("free_board_list",free_board_list);
		
		// ���� �Խ���
		model.addAttribute("know_board_list",know_board_list);
		
		// qna �Խ���
		model.addAttribute("qna_board_list",qna_board_list);
		
		// ����� �Խ���
		model.addAttribute("grad_board_list",grad_board_list);
		
		// å��
		model.addAttribute("book_list",book_list);
		model.addAttribute("bookCount",bookCount);
		
		// �α��� �� ����� ���ؼ� ����� ���� �ѱ��
		if(userId != null) {
			MemberBean mb = mem_dao.getAllMember(userId);
			model.addAttribute("mb",mb);
		}
		
		return viewPage;
		
	}

}
