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
public class BoardSearchController {
   
   @Autowired
   private BoardDao bdao;
   
   @RequestMapping("search.bd")
   public String search(@RequestParam("search") String search,
		   		   @RequestParam(value="board", required = false) String board,
                   HttpServletRequest request,
                   Model model) {
      
      String whatColumn = "all";
      String keyword = search;
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("whatColumn", whatColumn);
      map.put("keyword", "%" + keyword + "%");
      
      String url = request.getContextPath()+"/board.bd";
      int totalCount = bdao.getCountFree(map);
      BoardPaging pageInfo = new BoardPaging(null, null, totalCount, url, whatColumn, keyword, board);
      
      //각 게시판의 검색결과 리스트
      List<BoardBean> FreeList = bdao.getAllFreeBoard(pageInfo, map);
      List<BoardBean> KnowList = bdao.getAllKnowBoard(pageInfo, map);
      List<BoardBean> QnAList = bdao.getAllQnABoard(pageInfo, map);
      List<BoardBean> GradList = bdao.getAllGradBoard(pageInfo, map);
      
      //아무것도 입력하지 않았을 때
      int searchNull = 1;
      
      if(search.equals("")) {
         searchNull = 0;
      }
      
      model.addAttribute("search", search);
      model.addAttribute("searchNull", searchNull);
      model.addAttribute("FreeList", FreeList);
      model.addAttribute("KnowList", KnowList);
      model.addAttribute("QnAList", QnAList);
      model.addAttribute("GradList", GradList);
      
      return "search";
      
   }

}