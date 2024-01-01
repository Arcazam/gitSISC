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
import org.springframework.web.context.request.RequestAttributes;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.TagBean;
import board.model.TagDao;
import utility.BoardPaging;

@Controller
public class BoardListController {
   
   @Autowired
   private BoardDao boarddao;
   
   @Autowired
   private TagDao tagdao;
   
   @RequestMapping("board.bd")
   public String board(@RequestParam(value="board", required = false) String board,
                  @RequestParam(value="whatColumn", required = false) String whatColumn,
                  @RequestParam(value="keyword", required = false) String keyword,                  
                  @RequestParam(value="pageNumber", required = false) String pageNumber,
                  HttpServletRequest request,
                  Model model) {
      
      //�� �Խ����� ����Ʈ�� �ޱ� ����
      List<BoardBean> list = null;
      
      //�� �Խ����� �̸��� ��� ����
      String boardName = null;
      
      //�� �Խ����� ��� ���� �ҷ����� ����
      int CommentTotaldSize = 0;
      
      //�Խ��� �˻��� ���� �� �ش� �Խ��ǿ����� �˻��ϱ� ����
      String boardConfirm = null;
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("whatColumn", whatColumn);
      map.put("keyword", "%" + keyword + "%");
      
      String url = request.getContextPath()+"/board.bd";
      
       int totalCount = 0;
         
       BoardPaging pageInfo = null;
      
      if(board.equals("Free")) {
         totalCount = boarddao.getCountFree(map);
         
         pageInfo = new BoardPaging(pageNumber,null,totalCount,url,whatColumn,keyword,board);
         
         list = boarddao.getAllFreeBoard(pageInfo, map);
         for(int i=0; i<list.size(); i++) {
            BoardBean bb = list.get(i);
            CommentTotaldSize = boarddao.getCommentCount(bb.getRef());
            //������ ref2�� ���� �ʴ´�. �׷��� �̰������� ref2�� �� �Խù��� ��� ������ �Ѱ��� ����� ���̴�.
            bb.setRef2(CommentTotaldSize);
         }
         boardName = "����";
         boardConfirm = "Free";
      }
      
      if(board.equals("Know")) {
         totalCount = boarddao.getCountKnow(map);
         pageInfo = new BoardPaging(pageNumber,null,totalCount,url,whatColumn,keyword,board);
         list = boarddao.getAllKnowBoard(pageInfo, map);
         for(int i=0; i<list.size(); i++) {
            BoardBean bb = list.get(i);
            CommentTotaldSize = boarddao.getCommentCount(bb.getRef());
            bb.setRef2(CommentTotaldSize);
         }
         boardName = "����";
         boardConfirm = "Know";
      }
      
      if(board.equals("QnA")) {
         totalCount = boarddao.getCountQnA(map);
         pageInfo = new BoardPaging(pageNumber,null,totalCount,url,whatColumn,keyword,board);
         list = boarddao.getAllQnABoard(pageInfo, map);
         for(int i=0; i<list.size(); i++) {
            BoardBean bb = list.get(i);
            CommentTotaldSize = boarddao.getCommentCount(bb.getRef());
            bb.setRef2(CommentTotaldSize);
         }
         boardName = "QnA";
         boardConfirm = "QnA";
      }
      
      if(board.equals("Grad")) {
         totalCount = boarddao.getCountGrad(map);
         pageInfo = new BoardPaging(pageNumber,null,totalCount,url,whatColumn,keyword,board);
         list = boarddao.getAllGradBoard(pageInfo, map);
         for(int i=0; i<list.size(); i++) {
            BoardBean bb = list.get(i);
            CommentTotaldSize = boarddao.getCommentCount(bb.getRef());
            bb.setRef2(CommentTotaldSize);
         }
         boardName = "�����";
         boardConfirm = "Grad";
      }
      
      //�±�
      List<TagBean> taglist = tagdao.getRank();
      
      //HOT�Խù�
      List<BoardBean> hotlist = boarddao.getHotBoard();
      
      model.addAttribute("list", list);
      model.addAttribute("keyword", keyword);
      model.addAttribute("boardName", boardName);
      model.addAttribute("boardConfirm", boardConfirm);
      model.addAttribute("pageInfo", pageInfo);
      model.addAttribute("taglist", taglist);
      model.addAttribute("hotlist", hotlist);
      
      return "BoardList";
   }

}