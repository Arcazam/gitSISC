package view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoMainController {
	private final String command = "SiscMain.view";
	private final String gotoPage = "Main";
	
	@RequestMapping(command)
	public String goMain() {
		return gotoPage;
	}
	
}
