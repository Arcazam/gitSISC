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
			insertBoardName = "자유";
		}
		if(board.equals("Know")) {
			insertBoardName = "지식";
		}
		if(board.equals("QnA")) {
			insertBoardName = "QnA";
		}
		if(board.equals("Grad")) {
			insertBoardName = "수료생";
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
		
		//날짜 설정
		LocalDate now = LocalDate.now();
		
		//태그를 하나도 적지 않았을 때
		if(tagValuesString.equals("noTag")) {
			int cnt;
			bb.setReg_date(String.valueOf(now));
			bb.setTaglist("태그없음");
			
			cnt = bor_dao.insertBoardContent(bb);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(cnt == 1) {
				out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
				out.flush();
				MemberBean mb = (MemberBean)session.getAttribute(sessionID);
				model.addAttribute("mb",mb);
				return viewPage;
			}
			
			return gotoPage + "?board=" + board;
	      }
		
		////////////////////////////////////////////////////////////
		
		//태그를 하나 이상 적었을 때
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
		bb.setReg_date(String.valueOf(now));
		bb.setTaglist(inputBoardTaglist);

		cnt = bor_dao.insertBoardContent(bb);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (cnt == 1) {
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean) session.getAttribute(sessionID);
			model.addAttribute("mb", mb);
			return viewPage;
		}

		return gotoPage + "?board=" + board;
	}

}
