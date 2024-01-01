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
      
      //각 게시판의 리스트를 받기 위함
      List<BoardBean> list = null;
      
      //각 게시판의 이름을 얻기 위함
      String boardName = null;
      
      //각 게시판의 댓글 수를 불러오기 위함
      int CommentTotaldSize = 0;
      
      //게시판 검색을 했을 때 해당 게시판에서만 검색하기 위함
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
            //원글은 ref2를 쓰지 않는다. 그래서 이곳에서만 ref2에 각 게시물의 댓글 개수를 넘겨줘 사용할 것이다.
            bb.setRef2(CommentTotaldSize);
         }
         boardName = "자유";
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
         boardName = "지식";
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
         boardName = "수료생";
         boardConfirm = "Grad";
      }
      
      //태그
      List<TagBean> taglist = tagdao.getRank();
      
      //HOT게시물
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