package manager.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import manager.model.ManagerBean;
import manager.model.ManagerDao;

@Controller
public class ManagerLoginController {

	@Autowired
	private ManagerDao mag_dao;
	
	@Autowired
	ServletContext sc;
	 
	// ������ �α��� Ŀ�ǵ�
	public final String command = "/manager_login.mag";

	// ������ �α��� �� ������
	public final String viewPage = "managerLogin";

	// �α��� ������ ���� ������ ���������� Ŀ�ǵ�(ManagerMainController.java)
	public final String gotoPage = "redirect:/memberList.mag";

	// ������ init �޼ҵ带 ȣ���ؼ� config�� �޾ƿ´��� flag�� �������ѵд�
    public void init(ServletConfig config) throws ServletException {
		sc = config.getServletContext();
    }

	// ������ �α��� ������ �޼ҵ�
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String toLoginForm() {
		return viewPage;
	}

	// ������ ���������� �� �޼ҵ�
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String toManagerMainView(
				ManagerBean magb,
				HttpSession session,
				HttpServletRequest request,
				HttpServletResponse response,
				Model model
			) throws IOException {
		
		boolean flag = (Boolean)sc.getAttribute("flag");   
		
		if (flag == false) {
						
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			// �α����� ������ ������ �� ManagerBean Ÿ���� �񱳰�ü����(contrastMagB)
			ManagerBean contrastMagB = mag_dao.getCheckManager(magb);

			if (contrastMagB == null) {
				out.println("<script>alert('���� ������ �����Դϴ�.');</script>");
				out.flush();
				sc.setAttribute("flag", true);
				return viewPage;
			} else { // ���̵� ������
				if (magb.getManager_pw().equals(contrastMagB.getManager_pw())) {
					session.setAttribute("mag_loginInfo", contrastMagB);
					sc.setAttribute("flag", true);
					return gotoPage;
				} else {
					out.println("<script>alert('��й�ȣ�� ���� �ʽ��ϴ�');</script>");
					out.flush();
					sc.setAttribute("flag", true);
					return viewPage;
				}
			}
			
		} else {
			sc.setAttribute("flag", true);
			return viewPage;
		}
		
	}

}
