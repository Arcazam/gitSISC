package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String toFindAndLoginForm() {
		return null;
	}
	
}
