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
   public final String command2 = "updateMyBook.bk";
   public final String viewPage = "BookUpdate";
   public final String viewPage2 = "updateMyBook";
   public final String sessionID = "loginInfo";
   public final String gotoPage = "redirect:/list.bk";
   public final String gotoPage2 = "redirect:/myBook.st";
 

   @RequestMapping(value = command, method = RequestMethod.GET)
   public String toUpdateBookForm(
       Model model,
       @RequestParam("bk_num") String bk_num,
       HttpSession session
   ) {
       MemberBean mb = (MemberBean)session.getAttribute(sessionID);

       if (mb == null) {
           session.setAttribute("destination", "redirect:/update.bk?bk_num=" + bk_num);
           return "redirect:login.mb";
       }
       

       BookBean bb = bok_dao.getWriterNumDetail2(bk_num);

       if (bb == null) {
    
           return "redirect:/list.bk";
       }

       bb.setWriter(mb.getId());

       BookBean modelDetailBook = bok_dao.getWriterNumDetail(bb);

       model.addAttribute("mb", mb);
       model.addAttribute("bb", modelDetailBook);
       model.addAttribute("bk_num", bk_num); // bk_num 

       return viewPage;
   }


   @RequestMapping(value = command, method = RequestMethod.POST)
   public String update(
           HttpServletRequest request,
           HttpServletResponse response,
           @ModelAttribute("bb") @Valid BookBean bb,
           Model model,
           HttpSession session,
           @RequestParam(value = "upload1", required = false) MultipartFile upload1,
           @RequestParam(value = "upload2", required = false) MultipartFile upload2,
           @RequestParam(value = "upload3", required = false) MultipartFile upload3
		   ) throws IOException {

       String uploadPath = servletContext.getRealPath("/resources/book/");
       System.out.println("uploadPath:" + uploadPath);
      
       System.out.println("1");
       int cnt = bok_dao.updateBook(bb);
       System.out.println("2");
       System.out.println("bok_dao.updateBook(bb):" + cnt);
       response.setContentType("text/html; charset=UTF-8");

       deleteFileIfExists(uploadPath, bb.getPrevUpload1());
       deleteFileIfExists(uploadPath, bb.getPrevUpload2());
       deleteFileIfExists(uploadPath, bb.getPrevUpload3());

       handleFileUpload(upload1, uploadPath, bb.getB_image1());
       handleFileUpload(upload2, uploadPath, bb.getB_image2());
       handleFileUpload(upload3, uploadPath, bb.getB_image3());

       return gotoPage;
   }

   private void deleteFileIfExists(String uploadPath, String filename) {
       File file = new File(uploadPath + File.separator + filename);
       if (file.exists()) {
           file.delete();
       }
   }

   private void handleFileUpload(MultipartFile file, String uploadPath, String existingFilename) {
       File existingFile = new File(uploadPath + File.separator + existingFilename);
       try {
           if (file != null && !file.isEmpty()) {
               file.transferTo(existingFile);
           } else { 
        	   System.out.println("업로드된 파일이 없습니다.");
           }
       } catch (IllegalStateException | IOException e) {
           e.printStackTrace();
      
       }
   }
   
   @RequestMapping(value = command2, method = RequestMethod.GET)
   public String updateMyBookForm(
       Model model, HttpSession session,
       @RequestParam("bk_num") String bk_num, 
       @RequestParam("pageNumber") int pageNumber,
       @RequestParam("writer") String seller,
       @RequestParam("id") String id,
       @RequestParam("pro_img") String pro_img) {
       MemberBean mb = (MemberBean)session.getAttribute(sessionID);

       if (mb == null) {
    	   session.setAttribute("destination", "redirect:/updateMyBook.bk?bk_num=" + bk_num + "&pageNumber=" + pageNumber + "&writer=" + seller + "&id=" + id + "&pro_img=" + pro_img);

           return "redirect:login.mb";
       }
       

       BookBean bb = bok_dao.getWriterNumDetail2(bk_num);

       if (bb == null) {
    
           return "redirect:/list.bk";
       }

       bb.setWriter(mb.getId());

       BookBean modelDetailBook = bok_dao.getWriterNumDetail(bb);

       model.addAttribute("mb", mb);
       model.addAttribute("bb", modelDetailBook);
       model.addAttribute("bk_num", bk_num);
       model.addAttribute("pageNumber", pageNumber);
       model.addAttribute("writer", seller);

       return viewPage2;
   }


   @RequestMapping(value = command2, method = RequestMethod.POST)
   public String updateMyBook(
           HttpServletRequest request,HttpSession session,
           HttpServletResponse response,Model model,
           @ModelAttribute("bb") @Valid BookBean bb,
           @RequestParam(value = "bk_num", required = false) String bk_num,
           @RequestParam(value = "pageNumber", required = false) int pageNumber,
           @RequestParam(value = "seller", required = false) String writer,
           @RequestParam(value = "id", required = false) String id,
           @RequestParam(value = "pro_img", required = false) String pro_img,
           @RequestParam(value = "upload1", required = false) MultipartFile upload1,
           @RequestParam(value = "upload2", required = false) MultipartFile upload2,
           @RequestParam(value = "upload3", required = false) MultipartFile upload3
		   ) throws IOException {

       String uploadPath = servletContext.getRealPath("/resources/book/");
       System.out.println("uploadPath:" + uploadPath);
      
       int cnt = bok_dao.updateBook(bb);
       
       response.setContentType("text/html; charset=UTF-8");

       deleteFileIfExists(uploadPath, bb.getPrevUpload1());
       deleteFileIfExists(uploadPath, bb.getPrevUpload2());
       deleteFileIfExists(uploadPath, bb.getPrevUpload3());

       handleFileUpload(upload1, uploadPath, bb.getB_image1());
       handleFileUpload(upload2, uploadPath, bb.getB_image2());
       handleFileUpload(upload3, uploadPath, bb.getB_image3());

       return gotoPage2 + "?id=" + id + "&pro_img=" + pro_img + "&writer=" + writer;
   }
}