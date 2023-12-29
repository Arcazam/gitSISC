package survey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import survey.model.SurveyBean;
import survey.model.SurveyDao;

@Controller
public class InsertSurveyController {
	private final String command = "survey.su";
	private final String gotoPage = "redirect:SiscMain.view";
	public final String sessionID = "loginInfo";
	@Autowired 
	SurveyDao sdao;
	
	@RequestMapping(command)
	public String survyInsert(@ModelAttribute("su") @Valid SurveyBean su, 
			Model model, HttpServletResponse response, HttpSession session) throws IOException {
		
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		Object loginInfo = session.getAttribute("loginInfo");
	    if(loginInfo == null) {
	    	session.setAttribute("destination", "redirect:survey.su");
	        return "redirect:login.mb";
	    }
		
		sdao.insertSurvey(su);
		
		return gotoPage;
	}
}
