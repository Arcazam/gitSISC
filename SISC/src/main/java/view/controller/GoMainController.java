package view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoMainController {
	private final String commandNotLogin = "SiscMain.view";
	private final String commandLogin = "SiscLoginMain.view";
	private final String gotoNotLoginPage = "NotLoginHome";
	private final String gotoLoginPage = "LoginHome";
	
	@RequestMapping(commandNotLogin)
	public String goMain() {
		
		return gotoNotLoginPage;
	}
	
	@RequestMapping(commandLogin)
	public String goMain2() {
		
		return gotoLoginPage;
	}
}
