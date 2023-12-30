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
   public final String viewPage = "BookUpdate";
   public final String sessionID = "loginInfo";
   public final String gotoPage = "redirect:/list.bk";

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

       // 여기서 BookBean을 생성하거나 초기화해야 합니다.
       BookBean bb = bok_dao.getWriterNumDetail2(bk_num);

       if (bb == null) {
           // bk_num에 해당하는 BookBean이 없을 경우 예외 처리 또는 적절한 조치를 취하세요.
           // 예를 들어, 존재하지 않는 경우 리스트 페이지로 리다이렉트하는 등의 처리를 추가할 수 있습니다.
           return "redirect:/list.bk";
       }

       bb.setWriter(mb.getId());

       BookBean modelDetailBook = bok_dao.getWriterNumDetail(bb);

       model.addAttribute("mb", mb);
       model.addAttribute("bb", modelDetailBook);
       model.addAttribute("bk_num", bk_num); // bk_num을 모델에 추가

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
      
       System.out.println("upload1: " + upload1);
       System.out.println("upload2: " + upload2);
       System.out.println("upload3: " + upload3);
       int cnt = bok_dao.updateBook(bb);
       System.out.println("bok_dao.updateBook(bb) 반환값" + cnt);
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
           // 파일 처리 예외에 대한 추가적인 처리 로직이 필요할 경우 여기에 구현
       }
   }
}