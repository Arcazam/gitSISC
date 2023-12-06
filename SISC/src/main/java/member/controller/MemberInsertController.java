package member.controller;

import org.springframework.stereotype.Controller;

@Controller
public class MemberInsertController {

	public final String command = "/insertMember.mb";
	public final String viewPage = "insertMember";
	public final String gotoPage = "redirect:/login.mb";
	
}
