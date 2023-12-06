package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberInsertController {

	public final String command = "/insertMember.mb";
	public final String viewPage = "insertMember";
	public final String gotoPage = "redirect:/login.mb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertMember() {
		return viewPage;
	}
	
}
