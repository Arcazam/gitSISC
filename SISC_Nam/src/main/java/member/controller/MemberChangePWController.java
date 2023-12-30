package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberChangePWController {
	
	@Autowired
	private MemberDao mdao;

	public final String command = "/changePW.mb";
	public final String viewPage = "changeMemberPW";
	public final String gotoPage = "redirect:/login.mb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toChangePWform(
			Model model,
			@RequestParam("id") String id
			) {
		model.addAttribute("id",id);
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toChangPWProc(
				MemberBean mb,
				HttpServletResponse response,
				@RequestParam("id") String id,
				@RequestParam("pw") String pw, 
				@RequestParam("pwCheck") String pwCheck
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		if(!(pw.equals(pwCheck))) {
			out.println("<script>alert('비밀번호와 비밀번호확인이 서로 맞지 않습니다.');history.go(-1);</script>");
		    out.flush();
		    return viewPage;
		} else {
			mb.setId(id);
			mb.setPassword(pw);
			mdao.updatePW(mb);
			out.println("<script>alert('비밀번호가 변경되었습니다.');location.href='login.mb';</script>");
		    out.flush();
			return viewPage;
		}
		
		
	}
	
}
