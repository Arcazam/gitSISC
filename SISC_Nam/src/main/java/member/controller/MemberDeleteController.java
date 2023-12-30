package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class MemberDeleteController {
	private final String command = "delete.mb";
	private final String viewPage = "redirect:SelectAllStudy.st";
	private final String gotoPage = "redirect:SiscMain.view";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("id") String id) {
		
		mdao.deleteMember(id);
		 
		return gotoPage;
	}
}
