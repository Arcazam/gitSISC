package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberKakaoLoginController {

	public final String command = "/https://kauth.kakao.com/oauth/authorize.mb";
	public final String viewPage = "memberlogin";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toLoginForm(@RequestParam(value = "code", required = false) String code) {
		System.out.println("code:"+code);
		return null;
	}
	
}
