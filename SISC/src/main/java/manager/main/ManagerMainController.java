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
	
	// ������ ���� command
	public final String command = "/managerMainView.mag";
	
	// ������ ���� ����
	public final String sessionID = "mag_loginInfo";
	
	// ������ ���� view
	public final String viewPage = "siscManagerMain";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toManagerMainPage(
				Model model,
				HttpSession session,
				HttpServletRequest request
			) {
		// MemberBean(mb) �� ManagerBean(magb) ���̸� �α����� magb�� ����
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		model.addAttribute("magb",magb);
		return viewPage;
	}
}
