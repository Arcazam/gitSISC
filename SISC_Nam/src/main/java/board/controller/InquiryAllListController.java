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
public class InquiryAllListController {
   private final String command= "inquiry.bd";
   private final String gotoPage= "inquiry";
   
   @Autowired
   BoardDao bdao;
   
   @RequestMapping(command)
   public String allList(Model model, HttpServletRequest request,
                  @RequestParam("menu") String board,
                  @RequestParam(value="search", required = false) String search,
                     @RequestParam(value="whatColumn", required = false) String whatColumn,
                   @RequestParam(value="keyword", required = false) String keyword,
                   @RequestParam(value="pageNumber", required = false) String pageNumber,
                   @RequestParam(value="id", required = false) String id,
                   @RequestParam(value="pro_img", required = false) String pro_img) {
      
      Map<String, String> map = new HashMap<String, String>();
       map.put("search", "%" + search + "%");
       map.put("whatColumn", whatColumn);
       map.put("keyword", "%"+keyword+"%"); 
       
         
       String url = request.getContextPath()+"/"+command;
         
       String pageSize = "10"; 
       int boardSize = bdao.getInquiryCount(map,board);
       BoardPaging pageInfo = new BoardPaging(pageNumber,pageSize,boardSize,url,whatColumn,keyword, id, pro_img);
       
       
      List<BoardBean> list = bdao.getAllInquiry(map);
      
      model.addAttribute("pageInfo", pageInfo);
      model.addAttribute("list", list);
      
      return gotoPage;
   }
   
}