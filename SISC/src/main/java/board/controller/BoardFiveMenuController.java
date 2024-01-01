package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardFiveMenuController {
	
	@RequestMapping("fiveMenu.bd")
	public String Menu(@RequestParam("menu") String menu) {
		
		String link = "";
		
		if(menu.equals("notice")) {
			link = "notice";
		}
		
		if(menu.equals("rank")) {
			link = "rank";
		}
		
		if(menu.equals("survey")) {
			link = "survey";
		}
		
		if(menu.equals("quiz")) {
			link = "quiz";
		}
		
		if(menu.equals("inquiry")) {
			link = "inquiry";
		}
		return link;
	}
}
