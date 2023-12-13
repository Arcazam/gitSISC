package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {

	@Autowired
	private MemberDao mdao;
	
	public final String command = "/login.mb";
	public final String viewPage = "memberlogin";
	
//	public final String tempPage = "redirect:insert.bd";
	
	public final String gotoPage = "redirect:/list.view";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toLoginForm() {
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toLoginResult(
				MemberBean mb,
				HttpSession session,
				HttpServletResponse response
			) throws IOException {
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberBean contrastMB = mdao.getAllMember(mb.getId());
		
		if(contrastMB == null) {
			out.println("<script>alert('�������� ���� ȸ���Դϴ�');</script>");
			out.flush();
			return viewPage;
		} else { // ���̵� ������
			if(mb.getPassword().equals(contrastMB.getPassword())) {
				session.setAttribute("loginInfo", contrastMB);
				return gotoPage;
			} else {
				out.println("<script>alert('��й�ȣ�� ���� �ʽ��ϴ�');</script>");
			    out.flush();
			    return viewPage;
			}
		}
		
	}
	
}