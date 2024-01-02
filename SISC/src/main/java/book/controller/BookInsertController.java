package book.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import book.model.BookBean;
import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class BookInsertController {

	@Autowired
	private BookDao bok_dao;
	
	@Autowired
	ServletContext servletContext;
	
	public final String command = "/insert.bk";
	public final String viewPage = "BookInsert";
	public final String sessionID = "loginInfo";
	public final String gotoPage = "redirect:/list.bk";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertBookForm(
				Model model,
				HttpSession session
			) {
	
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		
		if(mb == null) {
			session.setAttribute("destination", "redirect:insert.bk");
			
			return "redirect:login.mb";
		}
		model.addAttribute("mb",mb);
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toInsertBookProc(
				@ModelAttribute("bb") BookBean bb,
				@RequestParam(value = "upload1", required = false) MultipartFile upload1,
				HttpServletResponse response,
				HttpSession session,
				@RequestParam(value = "upload2", required = false) MultipartFile upload2,
				@RequestParam(value = "upload3", required = false) MultipartFile upload3,
				@RequestParam(value = "seller_pnum1", required = false) String seller_pnum1,
				@RequestParam(value = "seller_pnum2", required = false) String seller_pnum2,
				@RequestParam(value = "seller_pnum3", required = false) String seller_pnum3,
				Model model
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		bb.setSeller_pnum(seller_pnum1+"-"+seller_pnum2+"-"+seller_pnum3);
		
		String uploadPath = servletContext.getRealPath("/resources/book/");
		System.out.println("uploadPath:"+uploadPath);
		int cnt = bok_dao.insertBookMarket(bb);
		
		try {
          
            Path folder = Paths.get(uploadPath);

          
            if (!Files.exists(folder)) {
                Files.createDirectories(folder);
            } else {
                System.out.println("dd.");
            }
        } catch (IOException e) {
            System.err.println("dd: " + e.getMessage());
        }
		
		if(cnt == 1) {
			out.println("<script>alert('글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			return viewPage;
		}
		try {

			File destination1 = new File(uploadPath + File.separator + bb.getB_image1());
			MultipartFile multi1 = bb.getUpload1();
			multi1.transferTo(destination1);
			
			File destination2 = new File(uploadPath + File.separator + bb.getB_image2());
			MultipartFile multi2 = bb.getUpload2();
			multi2.transferTo(destination2);
			
			File destination3 = new File(uploadPath + File.separator + bb.getB_image3());
			MultipartFile multi3 = bb.getUpload3();
			multi3.transferTo(destination3);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		
		return gotoPage;
	}
}