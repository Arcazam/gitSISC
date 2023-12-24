package book.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import book.model.BookBean;
import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class BookUpdateController {
   @Autowired
   private BookDao bok_dao;

   @Autowired
   ServletContext servletContext;

   public final String command = "/update.bk";
   public final String command2 = "/updateMyBook.bk";
   public final String viewPage = "BookUpdate";
   public final String viewPage2 = "BookUpdate";
   public final String sessionID = "loginInfo";
   public final String gotoPage = "redirect:/list.bk";
   public final String gotoPage2 = "redirect:/mybook.bk";

   @RequestMapping(value=command, method=RequestMethod.GET)
   public String toUpdateBookForm(
       Model model,
       @RequestParam("bk_num") int bk_num,
       HttpSession session
   ) {
       MemberBean mb = (MemberBean)session.getAttribute(sessionID);
       
       if (mb == null) {
           session.setAttribute("destination", "redirect:/update.bk?bk_num=" + bk_num);
           return "redirect:login.mb";
       }

       // 여기서 BookBean을 생성하거나 초기화해야 합니다.
       // 예를 들어,
       BookBean bb = new BookBean();
       bb.setBk_num(bk_num);
       bb.setWriter(mb.getId());

       BookBean modelDetailBook = bok_dao.getWriterNumDetail(bb);

       model.addAttribute("mb", mb);
       model.addAttribute("bb", modelDetailBook);
       
       return viewPage;
   }
   
   @RequestMapping(value = command, method = RequestMethod.POST)
   public String update(
		   HttpServletRequest request, 
		   HttpServletResponse response,
		   @ModelAttribute("bb") @Valid BookBean bb,
		   @RequestParam("pageNumber") String pageNumber, 
		   Model model,
		   HttpSession session) throws IOException {
     
	   bok_dao.updateBook(bb);
     
     
      String uploadPath = servletContext.getRealPath("/resources/book/");
      System.out.println("uploadPath:"+uploadPath);
      int cnt = bok_dao.insertBookMarket(bb);
      
      PrintWriter out = response.getWriter();
      if(cnt == 1) {
         out.println("<script>alert('글자수 제한을 초과하였습니다!');</script>");
         out.flush();
         MemberBean mb = (MemberBean)session.getAttribute(sessionID);
         model.addAttribute("mb",mb);
         return viewPage;
      }
      
      File destination1 = new File(uploadPath + File.separator + bb.getPrevUpload1());
      File destination2 = new File(uploadPath + File.separator + bb.getPrevUpload2());
      File destination3 = new File(uploadPath + File.separator + bb.getPrevUpload3());
      
      File existing1 = new File(uploadPath + File.separator + bb.getB_image1());
      File existing2 = new File(uploadPath + File.separator + bb.getB_image2());
      File existing3 = new File(uploadPath + File.separator + bb.getB_image3());
      
      MultipartFile multi1 = bb.getUpload1();
      MultipartFile multi2 = bb.getUpload2();
      MultipartFile multi3 = bb.getUpload3();
      
      try {
          multi1.transferTo(existing1);
          multi2.transferTo(existing2);
          multi3.transferTo(existing3);
          
          destination1.delete(); 
          destination2.delete(); 
          destination3.delete(); 
      } catch (IllegalStateException | IOException e) {
          e.printStackTrace();
      }
     
     return gotoPage+"?pageNumber="+pageNumber; 
     } 
   
   
   @RequestMapping(value=command2, method=RequestMethod.GET)
   public String toUpdateMyBookForm(
       Model model,
       @RequestParam("bk_num") int bk_num,
       @RequestParam("pageNumber") String pageNumber,
       @RequestParam(value = "board", required = false) String board,
	   @RequestParam(value = "writer", required = false) String writer,
	   @RequestParam(value = "id", required = false) String id,
	   @RequestParam(value = "pro_img", required = false) String pro_img,
       HttpSession session
   ) {
	   
       MemberBean mb = (MemberBean)session.getAttribute(sessionID);
       
       if (mb == null) {
           session.setAttribute("destination", "redirect:/update.bk?bk_num=" + bk_num);
           return "redirect:login.mb";
       }

       // 여기서 BookBean을 생성하거나 초기화해야 합니다.
       // 예를 들어,
       BookBean bb = new BookBean();
       bb.setBk_num(bk_num);
       bb.setWriter(id);
       BookBean modelDetailBook = bok_dao.getWriterNumDetail(bb);
       model.addAttribute("mb", mb);
       model.addAttribute("bb", modelDetailBook);
       model.addAttribute("board",board);
	   model.addAttribute("id",id);
	   model.addAttribute("pro_img",pro_img);
       
       return viewPage2;
   }
   
   @RequestMapping(value = command2, method = RequestMethod.POST)
   public String updateMyBook(
		   HttpServletRequest request, 
		   HttpServletResponse response,
		   @ModelAttribute("bb") @Valid BookBean bb,
		   @RequestParam("pageNumber") String pageNumber,
		   @RequestParam(value = "board", required = false) String board,
		   @RequestParam(value = "writer", required = false) String writer,
		   @RequestParam(value = "id", required = false) String id,
		   @RequestParam(value = "pro_img", required = false) String pro_img,
		   Model model,
		   HttpSession session) throws IOException {
     
	   bok_dao.updateBook(bb);
     
     
      String uploadPath = servletContext.getRealPath("/resources/book/");
      System.out.println("uploadPath:"+uploadPath);
      int cnt = bok_dao.insertBookMarket(bb);
      
      PrintWriter out = response.getWriter();
      if(cnt == 1) {
         out.println("<script>alert('글자수 제한을 초과하였습니다!');</script>");
         out.flush();
         MemberBean mb = (MemberBean)session.getAttribute(sessionID);
         model.addAttribute("mb",mb);
         return viewPage;
      }
      
      File destination1 = new File(uploadPath + File.separator + bb.getPrevUpload1());
      File destination2 = new File(uploadPath + File.separator + bb.getPrevUpload2());
      File destination3 = new File(uploadPath + File.separator + bb.getPrevUpload3());
      
      File existing1 = new File(uploadPath + File.separator + bb.getB_image1());
      File existing2 = new File(uploadPath + File.separator + bb.getB_image2());
      File existing3 = new File(uploadPath + File.separator + bb.getB_image3());
      
      MultipartFile multi1 = bb.getUpload1();
      MultipartFile multi2 = bb.getUpload2();
      MultipartFile multi3 = bb.getUpload3();
      
      try {
          multi1.transferTo(existing1);
          multi2.transferTo(existing2);
          multi3.transferTo(existing3);
          
          destination1.delete(); 
          destination2.delete(); 
          destination3.delete(); 
      } catch (IllegalStateException | IOException e) {
          e.printStackTrace();
      }
     
     return gotoPage2+"?pageNumber="+pageNumber; 
     } 
}
