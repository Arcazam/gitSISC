package manager.quiz;

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

import board.model.BoardBean;
import manager.model.ManagerBean;
import quiz.model.QuizBean;
import quiz.model.QuizDao;
import utility.ManagerPaging;

@Controller
public class ManagerQuizListController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/quizList.mag";
	public final String viewPage = "quiz/magQuizList";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toMagQuizList(
			HttpSession session,
				Model model,
				QuizBean qb,
				@RequestParam(value="que_cate",required = false) String que_cate,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
	
		if (que_cate == null) {
			que_cate = "HTML";
		}
		
		// 관리자 세션값
		ManagerBean magb = (ManagerBean)session.getAttribute(sessionID);
		
		qb.setQue_cate(que_cate);
		
		// map에 검색카테고리와 검색어를 저장
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		// 해당 url에 출력될 페이징 선택
		String url = request.getContextPath()+command;
		
		int quizMagCateCount = qdao.getMagQuizCount(qb,map);
		
		ManagerPaging pageInfo = new ManagerPaging(pageNumber,null,quizMagCateCount,url,whatColumn,keyword);
		
		List<QuizBean> qlist = qdao.getAllMagQuizList(qb,pageInfo,map);
			
		model.addAttribute("quizCate",qb.getQue_cate());
		model.addAttribute("quizCateCount",quizMagCateCount);
		model.addAttribute("qlist",qlist);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("magb",magb);
		
		return viewPage;
	}
	
}
