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
public class MemberFindIDController {

	@Autowired
	private MemberDao mdao;
	
	public final String command = "/findMemberID.mb";
	public final String viewPage = "findMemberID";
	public final String gotoPage = "redirect:/login.mb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toFindIDform() {
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toFindAndLoginForm(
				MemberBean mb,
				HttpServletResponse response,
				@RequestParam("joomin1") String joomin1, 
				@RequestParam("joomin2") String joomin2
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
			    
		// �ֹε�Ϲ�ȣ ��,�� ��ġ��
		mb.setJoomin(joomin1 + "-" + joomin2);
		
		MemberBean findMB = mdao.findMemberId(mb);
		
		if(findMB != null) {
			out.println("<script>alert('�����ϼ̴� ���̵�� "+findMB.getId()+"�Դϴ�');</script>");
		    out.flush();
		    return gotoPage;
		} else {
			out.println("<script>alert('���Ե��� ���� ȸ���Դϴ�');</script>");
		    out.flush();
		    return viewPage;
		}
	
	}
	
}
