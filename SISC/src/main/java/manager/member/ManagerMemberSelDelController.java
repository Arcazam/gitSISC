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

import member.model.MemberDao;

@Controller
public class ManagerMemberSelDelController {

	@Autowired
	private MemberDao mdao;
	
	public final String command = "/delSelMember.mag";
	public final String gotoPage = "redirect:/memberList.mag";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelandList(
			Model model
			,HttpServletResponse response
			,String[] rowcheck
			,@RequestParam("pageNumber") int pageNumber
			) throws IOException {
		
		int checkDelete = 0;
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		for(int i=0;i<rowcheck.length;i++) {
			String id = rowcheck[i];
			checkDelete += mdao.deleteMember(id);
		}
		if(checkDelete == 0) {
			out.println("<script>alert('선택삭제중 오류발생!');location.href='memberList.mag?pageNumber="+pageNumber+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('선택된 레코드가 삭제되었습니다');location.href='memberList.mag?pageNumber="+pageNumber+"';</script>");
			out.flush();
		}
		return gotoPage;
	}
	
}
