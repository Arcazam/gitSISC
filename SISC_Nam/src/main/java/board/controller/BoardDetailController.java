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
import utility.BoardCommentsPaging;

@Controller
public class BoardDetailController {

	@Autowired
	private BoardDao bor_dao;
		
	public final String command = "/detailList.bd";
	public final String viewPage = "BoardDetailList";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailPage(
				Model model,
				HttpSession session,
				HttpServletRequest request,
				@RequestParam("b_num") int b_num,
				@RequestParam("ref") int ref,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				@RequestParam(value="board",required = false) String board
			) {
		
		String url = request.getContextPath()+command;
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		BoardBean bb = new BoardBean();
		bb.setB_num(b_num);
		bb.setRef(ref);
		
		// �̰� board�� �� �������� �������°�
		BoardBean modelAttBor = bor_dao.getBoardInfoBnum(bb);
		
		//��ȸ�ҋ����� readcount+1
		bor_dao.readcountUpdate(bb);
		
		// BoardCommentsPaging ���⼭ ������ ���ϴ°����� �ٲ�� ���ϴ� ���ڵ���� ���
		Map<String, String> map = new HashMap<String, String>();
		
		int CommentTotaldSize = bor_dao.getCommentCount(bb.getRef());
		BoardCommentsPaging pageInfo = new BoardCommentsPaging(pageNumber,null,CommentTotaldSize,url,whatColumn,keyword,b_num,ref,board);
		List<BoardBean> numCommentsList = bor_dao.getAllCommentsLists(pageInfo,bb);
		
		model.addAttribute("numCommentsList",numCommentsList);
		model.addAttribute("bb",modelAttBor);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("mb",mb);
		model.addAttribute("board",board);
		model.addAttribute("originalb_num",b_num);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("ref",ref);
		
		return viewPage;
	}
}