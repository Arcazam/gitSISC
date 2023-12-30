package manager.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import manager.model.ManagerBean;
import quiz.model.QuizBean;
import survey.model.SurveyBean;
import survey.model.SurveyDao;
import utility.ManagerPaging;

@Controller
public class ManagerSurveyListController {

	@Autowired
	private SurveyDao sdao;
	
	public final String command = "/surList.mag";
	public final String viewPage = "/magSurveyList";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toMagSurveyList(
				HttpSession session,
				Model model,
				SurveyBean sb,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
		// 관리자 세션값
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		
		// map에 검색카테고리와 검색어를 저장
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		// 해당 url에 출력될 페이징 선택
		String url = request.getContextPath()+command;
		
		int surveyMagCateCount = sdao.getMagSurveyCount(map);
		
		ManagerPaging pageInfo = new ManagerPaging(pageNumber,null,surveyMagCateCount,url,whatColumn,keyword);
		
		List<SurveyBean> slist = sdao.getAllMagSurvey(pageInfo,map);
		
		return viewPage;
	}
	
}
