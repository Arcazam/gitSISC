package manager.controller;

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
	
	public final String command = "/bookList.mag";
	public final String viewPage = "MagBoardList";
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
		
		// ����Ʈ ��ϵ�
		List<BoardBean> board_cateList = null;
		// �ش� ī�װ� �Խ��� ���ڵ� ����(����)
		int boardCateCount;
		// �� �Խ��Ǹ��� ������ �Խ��� ����¡ Ŭ���� ��ü
		ManagerPaging pageInfo = null;
		
		// ������ ���ǰ�
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		
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
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectFreeDetailCate(pageInfo,map);
		} 
		
		// ���� �Խ��� ����¡ ó��, ī�װ��� �˻� ���
		else if (bb.getB_cate().equals("Know")) {
			boardCateCount = bor_dao.getCountKnow();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectKnowDetailCate(pageInfo,map);
		} 
		
		// QnA �Խ��� ����¡ ó��, ī�װ��� �˻� ���
		else if (bb.getB_cate().equals("QnA")) {
			boardCateCount = bor_dao.getCountQnA();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectQnADetailCate(pageInfo,map);
		} 
		
		// ����� �Խ��� ����¡ ó��, ī�װ��� �˻� ���
		else {
			boardCateCount = bor_dao.getCountGrad();
			pageInfo = new ManagerPaging(pageNumber,null,boardCateCount,url,whatColumn,keyword);
			board_cateList = bor_dao.selectGradDetailCate(pageInfo,map);
		}
		
		model.addAttribute("boardCateCount",boardCateCount);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("board_cateList",board_cateList);
		model.addAttribute("magb",magb);
		
		return viewPage;
	}
	
}
