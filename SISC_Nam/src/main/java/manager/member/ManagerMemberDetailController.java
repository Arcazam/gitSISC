package manager.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class ManagerMemberDetailController {

	@Autowired
	private MemberDao mdao;
	
	public final String command = "/dListMember.mag";
	public final String viewPage = "member/magMemberDetail";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
				Model model
				,@RequestParam("id") String id
				,@RequestParam("pageNumber") int pageNumber
			) {
		
		MemberBean modelAttBor = mdao.getAllMember(id);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("mb",modelAttBor);
		
		return viewPage;
	}
	
}
