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

       // ���⼭ BookBean�� �����ϰų� �ʱ�ȭ�ؾ� �մϴ�.
       BookBean bb = bok_dao.getWriterNumDetail2(bk_num);

       if (bb == null) {
           // bk_num�� �ش��ϴ� BookBean�� ���� ��� ���� ó�� �Ǵ� ������ ��ġ�� ���ϼ���.
           // ���� ���, �������� �ʴ� ��� ����Ʈ �������� �����̷�Ʈ�ϴ� ���� ó���� �߰��� �� �ֽ��ϴ�.
           return "redirect:/list.bk";
       }

       bb.setWriter(mb.getId());

       BookBean modelDetailBook = bok_dao.getWriterNumDetail(bb);

       model.addAttribute("mb", mb);
       model.addAttribute("bb", modelDetailBook);
       model.addAttribute("bk_num", bk_num); // bk_num�� �𵨿� �߰�

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
       System.out.println("bok_dao.updateBook(bb) ��ȯ��" + cnt);
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
               System.out.println("���ε�� ������ �����ϴ�.");
           }
       } catch (IllegalStateException | IOException e) {
           e.printStackTrace();
           // ���� ó�� ���ܿ� ���� �߰����� ó�� ������ �ʿ��� ��� ���⿡ ����
       }
   }
}