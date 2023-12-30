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
public class BoardUpdateController {

	@Autowired
	private BoardDao bor_dao;
	
	@Autowired
	private TagDao tdao;
	
	public final String command = "/update.bd";
	public final String command2 = "/update2.bd";
	public final String sessionID = "loginInfo";
	public final String viewPage = "UpdateBoard";
	public final String viewPage2 = "UpdateMyBoard";
	public final String gotoPage = "redirect:/board.bd";
	public final String gotoPage2 = "redirect:/myboard.st";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toUpdateBoard(
				Model model,
				HttpSession session,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "board", required = false) String board,
				@RequestParam(value = "writer", required = false) String writer
			) {
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		Object loginInfo = session.getAttribute("loginInfo");
	    if(loginInfo == null) {
	    	session.setAttribute("destination", "redirect:update.bd?b_num=" + b_num + "&board=" + board + "&pageNumber=" + pageNumber);
	        return "redirect:login.mb";
	    }
		
		BoardBean bb = bor_dao.getBoardInfoWriter(b_num);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		model.addAttribute("mb",mb);
		model.addAttribute("board",board);
		model.addAttribute("id",mb.getId());
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toUpdateProcBoard(
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "board", required = false) String board,
				@RequestParam("tagValues") String tagValuesString,
				@RequestParam("taglist") String taglist,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		// ObjectMapper : java 객체를 Json 문자열로 변환 또는 Json문자열을 Java객체로 변환
			
		String[] tagValues = objectMapper.readValue(tagValuesString, String[].class);
		String inputBoardTaglist = "";
		int cnt;
		
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
		
		bb.setB_num(b_num);
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		bb.setTaglist(inputBoardTaglist);
		
		cnt = bor_dao.updateBoardContent(bb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			model.addAttribute("pageNumber",pageNumber);
			model.addAttribute("board",board);
			
			return viewPage;
		}
		
		return gotoPage + "?board=" + board;
	}
	
	
	@RequestMapping(value=command2,method=RequestMethod.GET)
	public String toUpdateMyBoard(
				Model model,
				HttpSession session,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "writer", required = false) String writer,
				@RequestParam(value = "id", required = false) String id,
				@RequestParam(value = "pro_img", required = false) String pro_img
			) {
		
		BoardBean bb = bor_dao.getBoardInfoWriter(b_num);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		model.addAttribute("id",id);
		model.addAttribute("pro_img",pro_img);
		
		return viewPage2;
	}
	
	@RequestMapping(value=command2,method=RequestMethod.POST)
	public String toUpdateMyProcBoard(
				@ModelAttribute("bb") BoardBean bb,
				@RequestParam(value = "b_num", required = false) int b_num,
				@RequestParam(value = "pageNumber", required = false) int pageNumber,
				@RequestParam(value = "writer", required = false) String writer,
				@RequestParam(value = "id", required = false) String id,
				@RequestParam(value = "pro_img", required = false) String pro_img,
				@RequestParam(value = "tagValues", required = false) String tagValuesString,
				@RequestParam(value = "taglist", required = false) String taglist,
				HttpServletResponse response,
				HttpSession session,
				Model model
			) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("asdlkjsakdljsadlsakdsjakldkaljklja:"+bb.getContent());
		
		String[] tagValues = objectMapper.readValue(tagValuesString, String[].class);
		String inputBoardTaglist = "";
		int cnt;
		
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
		bb.setB_num(b_num);
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		cnt = bor_dao.updateBoardContent(bb);
		bb.setTaglist(inputBoardTaglist);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			out.println("<script>alert('제목 글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			model.addAttribute("pageNumber",pageNumber);
			
			return viewPage2;
		}
		
		return gotoPage2 + "?id=" + id + "&pro_img=" + pro_img + "&writer=" + id;
	}
}
