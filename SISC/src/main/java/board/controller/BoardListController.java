package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import utility.BoardPaging;

@Controller
public class BoardListController {
	private final String command = "board.bd";
	private final String gotoPage = "BoardList";
	
   @Autowired
   private BoardDao boarddao;
   
   @RequestMapping(command)
   public String board(@RequestParam("board") String board,
                @RequestParam(value="search", required = false) String search,
      			@RequestParam(value="whatColumn", required = false) String whatColumn,
    			@RequestParam(value="keyword", required = false) String keyword,
    			@RequestParam(value="pageNumber", required = false) String pageNumber,
    			@RequestParam(value="id", required = false) String id,
    			@RequestParam(value="pro_img", required = false) String pro_img,
    			Model model, HttpServletRequest request
    			) {
      
      //각 게시판의 리스트를 받기 위함
      List<BoardBean> list = null;
      
      //각 게시판의 이름을 얻기 위함
      String boardName = null;
      
      //게시판 검색을 했을 때 해당 게시판에서만 검색하기 위함
      String boardConfirm = null;
      
      //게시판 메뉴를 눌렀을 때 그 게시판으로 가기 위함
      String FreeB = "Free";
      String KnowB = "Know";
      String QnAB = "QnA";
      String GradB = "Grad";
      String QuizB = "Quiz";
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("search", "%" + search + "%");
      map.put("whatColumn", whatColumn);
      map.put("keyword", "%"+keyword+"%"); 
		
      String url = request.getContextPath()+"/"+command;
		
      String pageSize = "10"; 
      int boarTotaldSize = boarddao.getBoardCount(map,board);
      BoardPaging pageInfo = new BoardPaging(pageNumber,pageSize,boarTotaldSize,url,whatColumn,keyword, id, pro_img);
      
      if(board.equals("Free")) {
         list = boarddao.getAllFreeBoard(map);
         boardName = "자유";
         boardConfirm = "Free";
      }
      
      if(board.equals("Know")) {
         list = boarddao.getAllKnowBoard(map);
         boardName = "지식"; 
         boardConfirm = "Know";
      }
      
      if(board.equals("QnA")) {
         list = boarddao.getAllQnABoard(map);
         boardName = "Q&A";
         boardConfirm = "QnA";
      }
      
      if(board.equals("Grad")) {
         list = boarddao.getAllGradBoard(map);
         boardName = "수료생";
         boardConfirm = "Grad";
      }
      
      if(board.equals("Quiz")) {
         boardName = "퀴즈";
         boardConfirm = "Quiz";
      }
      
      model.addAttribute("list", list);
      model.addAttribute("boardName", boardName);
      model.addAttribute("boardConfirm", boardConfirm);
      model.addAttribute("FreeB", FreeB);
      model.addAttribute("KnowB", KnowB);
      model.addAttribute("QnAB", QnAB);
      model.addAttribute("GradB", GradB);
      model.addAttribute("QuizB", QuizB);
      model.addAttribute("pageInfo", pageInfo);
      
      return gotoPage;
   }

}