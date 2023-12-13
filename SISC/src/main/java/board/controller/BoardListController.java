package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardListController {
	private final String command = "board.bd";
	private final String gotoPage = "BoardList";
	
   @Autowired
   private BoardDao boarddao;
   
   @RequestMapping(command)
   public String board(@RequestParam("board") String board,
                  @RequestParam(value="search", required = false) String search,
                  Model model) {
      
      //�� �Խ����� ����Ʈ�� �ޱ� ����
      List<BoardBean> list = null;
      
      //�� �Խ����� �̸��� ��� ����
      String boardName = null;
      
      //�Խ��� �˻��� ���� �� �ش� �Խ��ǿ����� �˻��ϱ� ����
      String boardConfirm = null;
      
      //�Խ��� �޴��� ������ �� �� �Խ������� ���� ����
      String FreeB = "Free";
      String KnowB = "Know";
      String QnAB = "QnA";
      String GradB = "Grad";
      String QuizB = "Quiz";
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("search", "%" + search + "%");
      
      if(board.equals("Free")) {
         list = boarddao.getAllFreeBoard(map);
         boardName = "����";
         boardConfirm = "Free";
      }
      
      if(board.equals("Know")) {
         list = boarddao.getAllKnowBoard(map);
         boardName = "����"; 
         boardConfirm = "Know";
      }
      
      if(board.equals("QnA")) {
         list = boarddao.getAllQnABoard(map);
         boardName = "Q&A";
         boardConfirm = "QnA";
      }
      
      if(board.equals("Grad")) {
         list = boarddao.getAllGradBoard(map);
         boardName = "�����";
         boardConfirm = "Grad";
      }
      
      if(board.equals("Quiz")) {
         boardName = "����";
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
      
      return gotoPage;
   }

}