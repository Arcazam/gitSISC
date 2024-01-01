package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDate;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.TagBean;
import board.model.TagDao;
import member.model.MemberBean;

@Controller
public class BoardUpdateController {

	@Autowired
	private BoardDao bor_dao;
	
	@Autowired
	private TagDao tdao;
	
	public final String command = "/updateForm.bd";
	public final String command2 = "/update.bd";
	public final String sessionID = "loginInfo";
	public final String viewPage = "UpdateBoard";
	public final String gotoPage = "redirect:/detailList.bd";
	
	@RequestMapping(command)
	public String toUpdateForm(
				Model model,
				HttpSession session,
				@RequestParam("b_num") int b_num,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam("board") String board
			) {
		
		String updateBoardName = "";
		
		if(board.equals("Free")) {
			updateBoardName = "����";
		}
		if(board.equals("Know")) {
			updateBoardName = "����";
		}
		if(board.equals("QnA")) {
			updateBoardName = "QnA";
		}
		if(board.equals("Grad")) {
			updateBoardName = "�����";
		}
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		BoardBean bb = new BoardBean();
		bb.setB_num(b_num);
		
		BoardBean updatebb = bor_dao.getBoardInfoBnum(bb);
		
		model.addAttribute("pageNumber",pageNumber); //������ ��ȣ �Ѱ��ֱ�
		model.addAttribute("board", board); //���� � �Խ��ǿ��� �۾������� �Ѱ��ֱ�
		model.addAttribute("updatebb",updatebb); //insert�� ������ ���� ��������
		model.addAttribute("updateBoardName",updateBoardName); //���� �Խ������� �ѱ۷� �����ֱ�
		model.addAttribute("mb",mb);
		return viewPage;
	}
	
	@RequestMapping(command2)
	public String toUpdateBoard(
				@ModelAttribute("updatebb") BoardBean updatebb,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam("tagValues") String tagValuesString,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		
		System.out.println("���� ��?");

		// �±׸� �ϳ��� ���� �ʾ��� ��
		if (tagValuesString.equals("noTag")) {
			int cnt;
			updatebb.setTaglist("�±׾���");

			cnt = bor_dao.updateBoardContent(updatebb);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			if (cnt == 1) {
				out.println("<script>alert('���� ���ڼ� ������ �ʰ��Ͽ����ϴ�!');</script>");
				out.flush();
				MemberBean mb = (MemberBean) session.getAttribute(sessionID);
				model.addAttribute("mb", mb);
				return viewPage;
			}

			return gotoPage + "?b_num=" + updatebb.getB_num() + "&ref=" + updatebb.getB_num() + "&pageNumber=" + pageNumber + "&board=" + updatebb.getB_cate();
		}

		////////////////////////////////////////////////////////////

		// �±׸� �ϳ� �̻� ������ ��
		ObjectMapper objectMapper = new ObjectMapper();
		// ObjectMapper : java ��ü�� Json ���ڿ��� ��ȯ �Ǵ� Json���ڿ��� Java��ü�� ��ȯ

		String[] tagValues = objectMapper.readValue(tagValuesString, String[].class);
		String inputBoardTaglist = "";

		TagBean tb = new TagBean();

		for (int i = 0; i < tagValues.length; i++) {
			tb.setTag_val(tagValues[i]);
			int findtag = tdao.findTag(tb); // for���� �����鼭 �� �ּҰ��� ����Ǿ��ִ� ������ �ܾ�´�
			if (findtag != 0) { // �����Է��� �±װ� ������ �±׿� ��ġ�Ҷ�
				tdao.plusOneCntTagValues(tb);
			} else {
				tdao.plusTagValues(tb); // ���� �Է��� �±װ� ������ ������
			}
			// �±װ� �������̸� �߰��� - �� �������� �ƹ��͵� ������ �ʴ� �Լ�
			if (i != tagValues.length - 1) {
				inputBoardTaglist += tagValues[i] + "-";
			} else {
				inputBoardTaglist += tagValues[i];
			}
		}
		
		int cnt;
		updatebb.setTaglist(inputBoardTaglist);
		
		cnt = bor_dao.updateBoardContent(updatebb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			out.println("<script>alert('���� ���ڼ� ������ �ʰ��Ͽ����ϴ�!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			return viewPage;
		}
		
		return gotoPage + "?b_num=" + updatebb.getB_num() + "&ref=" + updatebb.getB_num() + "&pageNumber=" + pageNumber + "&board=" + updatebb.getB_cate();
	}
	
}
