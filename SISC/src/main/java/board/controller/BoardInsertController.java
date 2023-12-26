package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

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
public class BoardInsertController {

	@Autowired
	private BoardDao bor_dao;
	
	@Autowired
	private TagDao tdao;
	
	public final String command = "/insert.bd";
	public final String sessionID = "loginInfo";
	public final String viewPage = "InsertBoard";
	public final String gotoPage = "redirect:/list.bd";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertBoard(
				Model model,
				HttpSession session
			) {
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		model.addAttribute("mb",mb);
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toMainBoradList(
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam("tagValues") String tagValuesString,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		
		ObjectMapper objectMapper = new ObjectMapper();
		// ObjectMapper : java 객체를 Json 문자열로 변환 또는 Json문자열을 Java객체로 변환
		
		String[] tagValues = objectMapper.readValue(tagValuesString, String[].class);
		String inputBoardTaglist = "";
		
		for(int i=0;i<tagValues.length;i++) {
			TagBean tb = new TagBean();
			tb.setTag_val(tagValues[i]);
			int findtag = tdao.findTag(tb);	// for문을 돌리면서 각 주소값에 저장되어있는 값들을 긁어온다
			if(findtag != 0) { // 새로입력한 태그가 기존의 태그와 일치할때
				tdao.plusOneCntTagValues(tb);
			} else {
				tdao.plusTagValues(tb); // 새로 입력한 태그가 기존에 없을때
			}
			if(i != tagValues.length-1) {
				inputBoardTaglist += tagValues[i]+"-";
			} else {
				inputBoardTaglist += tagValues[i];
			}
		}
				
		int cnt;
		
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		bb.setTaglist(inputBoardTaglist);
		
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
		
		return gotoPage;
	}
	
}
