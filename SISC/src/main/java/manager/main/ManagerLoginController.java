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
	 
	// 관리자 로그인 커맨드
	public final String command = "/manager_login.mag";

	// 관리자 로그인 뷰 페이지
	public final String viewPage = "managerLogin";

	// 로그인 성공시 가는 관리자 메인페이지 커맨드(ManagerMainController.java)
	public final String gotoPage = "redirect:/memberList.mag";

	// 무조건 init 메소드를 호출해서 config를 받아온다음 flag를 설정시켜둔다
    public void init(ServletConfig config) throws ServletException {
		sc = config.getServletContext();
    }

	// 관리자 로그인 페이지 메소드
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String toLoginForm() {
		return viewPage;
	}

	// 관리자 메인페이지 뷰 메소드
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

			// 로그인할 정보랑 같은지 볼 ManagerBean 타입의 비교객체변수(contrastMagB)
			ManagerBean contrastMagB = mag_dao.getCheckManager(magb);

			if (contrastMagB == null) {
				out.println("<script>alert('없는 관리자 계정입니다.');</script>");
				out.flush();
				sc.setAttribute("flag", true);
				return viewPage;
			} else { // 아이디 존재함
				if (magb.getManager_pw().equals(contrastMagB.getManager_pw())) {
					session.setAttribute("mag_loginInfo", contrastMagB);
					sc.setAttribute("flag", true);
					return gotoPage;
				} else {
					out.println("<script>alert('비밀번호가 맞지 않습니다');</script>");
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
