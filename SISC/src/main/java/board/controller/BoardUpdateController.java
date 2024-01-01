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
			updateBoardName = "자유";
		}
		if(board.equals("Know")) {
			updateBoardName = "지식";
		}
		if(board.equals("QnA")) {
			updateBoardName = "QnA";
		}
		if(board.equals("Grad")) {
			updateBoardName = "수료생";
		}
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		BoardBean bb = new BoardBean();
		bb.setB_num(b_num);
		
		BoardBean updatebb = bor_dao.getBoardInfoBnum(bb);
		
		model.addAttribute("pageNumber",pageNumber); //페이지 번호 넘겨주기
		model.addAttribute("board", board); //지금 어떤 게시판에서 작업중인지 넘겨주기
		model.addAttribute("updatebb",updatebb); //insert한 원글의 정보 가져오기
		model.addAttribute("updateBoardName",updateBoardName); //무슨 게시판인지 한글로 보내주기
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
		
		System.out.println("오긴 옴?");

		// 태그를 하나도 적지 않았을 때
		if (tagValuesString.equals("noTag")) {
			int cnt;
			updatebb.setTaglist("태그없음");

			cnt = bor_dao.updateBoardContent(updatebb);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			if (cnt == 1) {
				out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
				out.flush();
				MemberBean mb = (MemberBean) session.getAttribute(sessionID);
				model.addAttribute("mb", mb);
				return viewPage;
			}

			return gotoPage + "?b_num=" + updatebb.getB_num() + "&ref=" + updatebb.getB_num() + "&pageNumber=" + pageNumber + "&board=" + updatebb.getB_cate();
		}

		////////////////////////////////////////////////////////////

		// 태그를 하나 이상 적었을 때
		ObjectMapper objectMapper = new ObjectMapper();
		// ObjectMapper : java 객체를 Json 문자열로 변환 또는 Json문자열을 Java객체로 변환

		String[] tagValues = objectMapper.readValue(tagValuesString, String[].class);
		String inputBoardTaglist = "";

		TagBean tb = new TagBean();

		for (int i = 0; i < tagValues.length; i++) {
			tb.setTag_val(tagValues[i]);
			int findtag = tdao.findTag(tb); // for문을 돌리면서 각 주소값에 저장되어있는 값들을 긁어온다
			if (findtag != 0) { // 새로입력한 태그가 기존의 태그와 일치할때
				tdao.plusOneCntTagValues(tb);
			} else {
				tdao.plusTagValues(tb); // 새로 입력한 태그가 기존에 없을때
			}
			// 태그가 여러개이면 중간에 - 를 마지막엔 아무것도 붙이지 않는 함수
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
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			return viewPage;
		}
		
		return gotoPage + "?b_num=" + updatebb.getB_num() + "&ref=" + updatebb.getB_num() + "&pageNumber=" + pageNumber + "&board=" + updatebb.getB_cate();
	}
	
}
