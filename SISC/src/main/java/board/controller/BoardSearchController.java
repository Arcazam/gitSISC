package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardSearchController {
   
   @RequestMapping("search.bd")
   public String search(@RequestParam("search") String search,
         Model model) {
      
      model.addAttribute("search", search);
      
      return "search";
      
   }

}