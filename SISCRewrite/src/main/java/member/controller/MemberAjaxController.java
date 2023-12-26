package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberAjaxController {
	
	@Autowired
	private MemberDao mdao;

	public final String command="/ajax.mb";
	
	@RequestMapping(value=command)
	@ResponseBody
	public String checkMemberId(
			@RequestParam(value="userid") String userid,
			MemberBean mb
			) {
		
		mb.setId(userid);
		
		int check = mdao.checkMemberId(mb);
		
		if(check == 0) {
			return "YES";
		} else {
			return "NO";
		}
		
	}
	
}
