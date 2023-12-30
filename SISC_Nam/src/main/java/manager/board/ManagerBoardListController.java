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
		
		// ����Ʈ ��ϵ�
		List<BoardBean> board_MagcateList = null;
		// �ش� ī�װ� �Խ��� ���ڵ� ����(����)
		int boardMagCateCount = 0;
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
		
		// ������ �����Խ��� ����Ʈ �ҷ�����
		if(bb.getB_cate().equals("Free")) {
			boardMagCateCount = bor_dao.getMagCountFree(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllFree(pageInfo,map);
		} 
		
		// ������ ���İԽ��� ����Ʈ �ҷ�����
		else if (bb.getB_cate().equals("Know")) {
			boardMagCateCount = bor_dao.getMagCountKnow(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllKnow(pageInfo,map);
		} 
		
		// ������ QnA�Խ��� ����Ʈ �ҷ�����
		else if (bb.getB_cate().equals("QnA")) {
			boardMagCateCount = bor_dao.getMagCountQnA(map);
			pageInfo = new ManagerPaging(pageNumber,null,boardMagCateCount,url,whatColumn,keyword);
			board_MagcateList = bor_dao.selectMagAllQnA(pageInfo,map);
		} 
		
		// ������ ������Խ��� ����Ʈ �ҷ�����
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
