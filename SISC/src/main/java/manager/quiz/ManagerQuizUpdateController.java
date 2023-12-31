package manager.quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import quiz.model.QuizBean;
import quiz.model.QuizDao;

@Controller
public class ManagerQuizUpdateController {

	@Autowired
	private QuizDao qdao;
	
	public final String command = "/quizUpdate.mag";
	public final String viewPage = "quiz/magQuizUpdate";
	public final String sessionID = "mag_loginInfo";
	public final String gotoPage = "redirect:/quizList.mag";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
				Model model
				,QuizBean qb
				,@RequestParam("qz_num") int qz_num
				,@RequestParam("que_cate") String que_cate
				,@RequestParam("pageNumber") int pageNumber
			) {
		
		System.out.println("qz_num : "+qz_num);
		System.out.println("que_cate : "+que_cate);
		System.out.println("pageNumber : "+pageNumber);
		
		qb.setQz_num(qz_num);
		qb.setQue_cate(que_cate);
		
		QuizBean modelAttBor = qdao.getDetailQuiz(qb);
		
		String find_qzview = modelAttBor.getQz_view();
		
		// 정규 표현식 패턴 설정
        String regex = "<input[^>]*>(.*?)<br>";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(find_qzview);
        
        String[] findList = new String[4];
        int j = 0;
        
        // 매칭된 부분을 배열에 인덱스 형태로 저장
        while (matcher.find()) {
            String match = matcher.group(1);
            if(match != null) {
            	findList[j] = match;
                j++;
            }
        }
        
        String qz_view1 = "";
        String qz_view2 = "";
        String qz_view3 = "";
        String qz_view4 = "";
        
        for(int i=0;i<findList.length;i++) {
        	
        	if(findList[0] != null && findList[0].contains("&lt;")) {
        		findList[0] = findList[0].replace("&lt;", "<");
        		if(findList[0].contains("&gt;")) {
        			findList[0] = findList[0].replace("&gt;", ">");
        		}
        		qz_view1 = findList[0];
        	} else if(findList[0] != null) {
        		qz_view1 = findList[0];
        	}
        	
        	if(findList[1] != null && findList[1].contains("&lt;")) {
        		findList[1] = findList[1].replace("&lt;", "<");
        		if(findList[1].contains("&gt;")) {
        			findList[1] = findList[1].replace("&gt;", ">");
        		}
        		qz_view2 = findList[1];
        	} else if(findList[1] != null) {
        		qz_view2 = findList[1];
        	}
        	
        	if(findList[2] != null && findList[2].contains("&lt;")) {
        		findList[2] = findList[2].replace("&lt;", "<");
        		if(findList[2].contains("&gt;")) {
        			findList[2] = findList[2].replace("&gt;", ">");
        		}
        		qz_view3 = findList[2];
        	} else if(findList[2] != null) {
        		qz_view3 = findList[2];
        	}
        	
        	if(findList[3] != null && findList[3].contains("&lt;")) {
        		findList[3] = findList[3].replace("&lt;", "<");
        		if(findList[3].contains("&gt;")) {
        			findList[3] = findList[3].replace("&gt;", ">");
        		}
        		qz_view4 = findList[3];
        	} else if(findList[3] != null) {
        		qz_view4 = findList[3];
        	}
        	
        }
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("qb",modelAttBor);
		model.addAttribute("qz_num",qz_num);
		model.addAttribute("que_cate",que_cate);
		model.addAttribute("qz_view1",qz_view1);
		model.addAttribute("qz_view2",qz_view2);
		model.addAttribute("qz_view3",qz_view3);
		model.addAttribute("qz_view4",qz_view4);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toUpdateandList(
			Model model
			,QuizBean qb
			,HttpServletResponse response
			,@RequestParam("que_cate") String que_cate
			,@RequestParam(value = "qz_view1", required = false) String qz_view1
			,@RequestParam(value = "qz_view2", required = false) String qz_view2
			,@RequestParam(value = "qz_view3", required = false) String qz_view3
			,@RequestParam(value = "qz_view4", required = false) String qz_view4
			) throws IOException {
				
		String[] qz_views = new String[4];
		
		if(qz_view1 != null) {
			qz_views[0] = qz_view1;
		}
		if(qz_view2 != null) {
			qz_views[1] = qz_view2;
		}
		if(qz_view3 != null) {
			qz_views[2] = qz_view3;
		}
		if(qz_view4 != null) {
			qz_views[3] = qz_view4;
		}
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
				
		String finalQzview = "";
		
		for (int i = 0; i < qz_views.length; i++) {
		    String qz_view = qz_views[i];
		    System.out.println("for문 안에 있는 qz_view : " + qz_view);

		    if (qz_view != null && qz_view.contains("<")) {
		        qz_view = qz_view.replace("<", "&lt;");
		    }

		    if (qz_view != null && qz_view.contains(">")) {
		        qz_view = qz_view.replace(">", "&gt;");
		    }

		    if (qb.getInterpre().contains("<")) {
		        qb.setInterpre(qb.getInterpre().replace("<", "&lt;"));
		    }

		    if (qb.getInterpre().contains(">")) {
		        qb.setInterpre(qb.getInterpre().replace(">", "&gt;"));
		    }

		    if (qz_view != null) {
		        String qz_viewPlus = "<input type='radio' name='q||qz_seq.currval||' value='" + (i + 1) + "'>" + qz_view + "<br>";
		        finalQzview += qz_viewPlus;
		    }
		}

		
		qb.setQz_view(finalQzview);
		
		int cnt = qdao.updateQuiz(qb);
		
		System.out.println("que_cate:"+que_cate);
		
		if(cnt != 0) {
			out.println("<script>alert('레코드가 수정되었습니다!');location.href='quizList.mag?que_cate="+que_cate+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('오류 : 레코드 수정');history.go(-1);</script>");
			out.flush();
		}
		
		return gotoPage;
	}
	
	
}
