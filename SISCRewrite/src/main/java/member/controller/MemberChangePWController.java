package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			@RequestParam("id") String id
			) {
		return viewPage+"?id="+id;
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
	    
		if(pw.equals(pwCheck)) {
			mb.setId(id);
			mb.setPassword(pw);
			mdao.updatePW(mb);
			return gotoPage;
		} else {
			
			return viewPage;
		}
		
		
	}
	
}
