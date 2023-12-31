package manager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import manager.model.ManagerBean;

@Controller
public class ManagerMainController {
	
	// 관리자 메인 command
	public final String command = "/managerMainView.mag";
	
	// 관리자 세션 저장
	public final String sessionID = "mag_loginInfo";
	
	// 관리자 메인 view
	public final String viewPage = "siscManagerMain";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toManagerMainPage(
				Model model,
				HttpSession session,
				HttpServletRequest request
			) {
		// MemberBean(mb) 와 ManagerBean(magb) 차이를 두기위해 magb로 지음
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		model.addAttribute("magb",magb);
		return viewPage;
	}
}
