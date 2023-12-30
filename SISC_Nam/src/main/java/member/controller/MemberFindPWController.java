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
public class MemberFindPWController {

	@Autowired
	private MemberDao mdao;
	
	public final String command = "/findMemberPW.mb";
	public final String viewPage = "findMemberPW";
	public final String gotoPage = "redirect:/changePW.mb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toFindIDform() {
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toFindAndLoginForm(
				Model model,
				MemberBean mb,
				HttpServletResponse response,
				@RequestParam("joomin1") String joomin1, 
				@RequestParam("joomin2") String joomin2
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		// 주민등록번호 앞,뒤 합치기
		mb.setJoomin(joomin1 + "-" + joomin2);
		
		MemberBean findMB = mdao.findMPW(mb);
		
		if(findMB != null) {
		    model.addAttribute("id",findMB.getId());
		    return gotoPage;
		} else {
			out.println("<script>alert('가입 정보가 없습니다');history.go(-1);</script>");
		    out.flush();
		    return viewPage;
		}
	
	}
	
}
