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
import member.model.MemberDao;
import utility.BoardCommentsPaging;

@Controller
public class BoardDetailController {

	@Autowired
	private BoardDao bor_dao;
	
	@Autowired
	private MemberDao mem_dao;
		
	public final String command = "/detailList.bd";
	public final String viewPage = "BoardDetailList";
	public final String sessionID = "loginInfo";	
	
	@RequestMapping(value=command)
	public String toDetailPage(
				Model model,
				HttpSession session,
				HttpServletRequest request,
				@RequestParam(value="b_num",required = false) int b_num,
				@RequestParam(value="ref",required = false) int ref,
				@RequestParam(value="pageNumber",required = false) int pageNumber,
				@RequestParam(value="board",required = false) String board,
				@RequestParam(value="check", required = false) String check,
				@RequestParam(value="b_num2", required = false) String b_num2,
				@RequestParam(value="com_writer", required = false) String writer
			) {
		
		if(check != null) {
			if(b_num2 != null) {
				bor_dao.updateAdopt(b_num2);
				mem_dao.updateAdopt_num(writer);
			}
		}
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		BoardBean bb = new BoardBean();
		bb.setB_num(b_num);
		bb.setRef(ref);
		
		//��ȸ�� ������ readcount+1
		bor_dao.readcountUpdate(bb);
		
		// re_level�� 0�� b_num�� ��� ������ �������°�
		BoardBean modelAttBor = bor_dao.getBoardInfoBnum(bb);
		
		// re_level�� 1�̻�(���)�� ���ڵ� �� ��������
		int CommentTotaldSize = bor_dao.getCommentCount(ref);
		
		//������ url����
		String url = request.getContextPath()+command;
		
		BoardCommentsPaging pageInfo = new BoardCommentsPaging(Integer.toString(pageNumber), null, CommentTotaldSize,url, b_num, ref, board);
		  
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ref",ref);
		  
		// re_level�� 1, 2��(���) ���ڵ� ��������
		List<BoardBean> numCommentsList = bor_dao.getAllCommentsLists(pageInfo, map);
		
		model.addAttribute("bb", modelAttBor); // ����
		model.addAttribute("numCommentsList", numCommentsList); // ��� ����
		model.addAttribute("CommentTotaldSize", CommentTotaldSize); //��� ��
		model.addAttribute("pageNumber", pageNumber); // ���� �ִ� �������� �ٽ� ���� ����
		model.addAttribute("mb", mb); // loginInfo ����
		model.addAttribute("pageInfo", pageInfo); // pageInfo ����
		model.addAttribute("board", board); // ��� ������ ����
		return viewPage;
	}
		
}
