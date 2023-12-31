package manager.member;

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
public class ManagerMemberDeleteController {

	@Autowired
	private MemberDao mdao;
	
	public final String command = "/memberDelete.mag";
	public final String gotoPage = "redirect:/memberList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
				Model model
				,HttpServletResponse response
				,@RequestParam("id") String id
				,@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		mdao.deleteMember(id);
		
		out.println("<script>alert('아이디:"+id+" 의 레코드가 삭제되었습니다!');location.href='memberList.mag?pageNumber="+pageNumber+"';</script>");
		out.flush();
		
		return gotoPage;
	}
	
}
