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

	// �Խ��� ����Ʈ���� ���
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
		
		// ����Ʈ ��ϵ�
		List<BoardBean> board_cateList = null;
		// �ش� ī�װ� �Խ��� ���ڵ� ����(����)
		int boardCateCount;
		// �� �Խ��Ǹ��� ������ �Խ��� ����¡ Ŭ���� ��ü
		BoardPaging pageInfo = null;
		
		// ����� ���ǰ� �ҷ��ͼ� BoardList.jsp�� ������ ���� ��ü�� �𵨷� ���� �غ�
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		// �Խ��� ī�װ��� �ҷ��ͼ� �� ����
		bb.setB_cate(b_cate);
		
		// map�� �˻�ī�װ��� �˻�� ����
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		// �ش� url�� ��µ� ����¡ ����
		String url = request.getContextPath()+command;
		
		// ���� �Խ��� ����¡ ó��, ī�װ��� �˻� ���
		if(bb.getB_cate().equals("Free")) {
			boardCateCount = bor_dao.getCountFree();
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectFreeDetailCate(pageInfo,map);
		} 
		
		// ���� �Խ��� ����¡ ó��, ī�װ��� �˻� ���
		else if (bb.getB_cate().equals("Know")) {
			boardCateCount = bor_dao.getCountKnow();
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectKnowDetailCate(pageInfo,map);
		} 
		
		// QnA �Խ��� ����¡ ó��, ī�װ��� �˻� ���
		else if (bb.getB_cate().equals("QnA")) {
			boardCateCount = bor_dao.getCountQnA();
			pageInfo = new BoardPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectQnADetailCate(pageInfo,map);
		} 
		
		// ����� �Խ��� ����¡ ó��, ī�װ��� �˻� ���
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
