package survey.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import survey.model.SurveyDao;

//@Controller
public class selectAllSurveyController {
	private final String command = "";
	private final String gotoPage = "";
	
	@Autowired
	SurveyDao sdao;
	
	/*
	 * @RequestMapping(command) public String allSurvey() {
	 * 
	 * sdao.getAllSurvey();
	 * 
	 * return gotoPage; }
	 */
}
