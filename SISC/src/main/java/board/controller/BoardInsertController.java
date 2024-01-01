package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.TagBean;
import board.model.TagDao;
import member.model.MemberBean;

@Controller
public class BoardInsertController {

	@Autowired
	private BoardDao bor_dao;
	
	@Autowired
	private TagDao tdao;
	
	public final String command = "/insert.bd";
	public final String sessionID = "loginInfo";
	public final String viewPage = "InsertBoard";
	public final String gotoPage = "redirect:/board.bd";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertBoard(@RequestParam("board") String board,
								Model model,
								HttpSession session) {
		
		String insertBoardName = "";
		
		if(board.equals("Free")) {
			insertBoardName = "����";
		}
		if(board.equals("Know")) {
			insertBoardName = "����";
		}
		if(board.equals("QnA")) {
			insertBoardName = "QnA";
		}
		if(board.equals("Grad")) {
			insertBoardName = "�����";
		}
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:insert.bd?board="+board);
			
			return "redirect:login.mb";
		}
		
		model.addAttribute("mb",mb);
		model.addAttribute("board", board);
		model.addAttribute("insertBoardName", insertBoardName);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toMainBoradList(
				@RequestParam("board") String board,
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam("tagValues") String tagValuesString,
				HttpServletResponse response,
				HttpSession session,
				Model model) throws IOException {
		
		//��¥ ����
		LocalDate now = LocalDate.now();
		
		//�±׸� �ϳ��� ���� �ʾ��� ��
		if(tagValuesString.equals("noTag")) {
			int cnt;
			bb.setReg_date(String.valueOf(now));
			bb.setTaglist("�±׾���");
			
			cnt = bor_dao.insertBoardContent(bb);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(cnt == 1) {
				out.println("<script>alert('���� ���ڼ� ������ �ʰ��Ͽ����ϴ�!');</script>");
				out.flush();
				MemberBean mb = (MemberBean)session.getAttribute(sessionID);
				model.addAttribute("mb",mb);
				return viewPage;
			}
			
			return gotoPage + "?board=" + board;
	      }
		
		////////////////////////////////////////////////////////////
		
		//�±׸� �ϳ� �̻� ������ ��
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
		bb.setReg_date(String.valueOf(now));
		bb.setTaglist(inputBoardTaglist);

		cnt = bor_dao.insertBoardContent(bb);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (cnt == 1) {
			out.println("<script>alert('���� ���ڼ� ������ �ʰ��Ͽ����ϴ�!');</script>");
			out.flush();
			MemberBean mb = (MemberBean) session.getAttribute(sessionID);
			model.addAttribute("mb", mb);
			return viewPage;
		}

		return gotoPage + "?board=" + board;
	}

}
