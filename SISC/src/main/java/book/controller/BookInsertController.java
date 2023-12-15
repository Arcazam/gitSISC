package book.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		// 사용자 세션값 불러와서 BoardList.jsp에 저장해 놓을 객체를 모델로 주입 준비
		MemberBean mb = (MemberBean)session.getAttribute(sessionID);
		model.addAttribute("mb",mb);
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String toInsertBookProc(
				@ModelAttribute("bb") BookBean bb,
				@RequestParam("upload1") MultipartFile upload1,
				HttpServletResponse response,
				HttpSession session,
				@RequestParam(value = "upload2", required = false) MultipartFile upload2,
				@RequestParam(value = "upload3", required = false) MultipartFile upload3,
				@RequestParam("seller_pnum1") String seller_pnum1,
				@RequestParam("seller_pnum2") String seller_pnum2,
				@RequestParam("seller_pnum3") String seller_pnum3,
				@RequestParam("kind1") String kind1,
				@RequestParam("kind2") String kind2,
				@RequestParam("kind3") String kind3,
				@RequestParam("kind4") String kind4,
				@RequestParam("kind5") String kind5,
				@RequestParam("kind6") String kind6,
				Model model
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		bb.setSeller_pnum(seller_pnum1+"-"+seller_pnum2+"-"+seller_pnum3);
		bb.setKind(kind1+kind2+kind3+kind4+kind5+kind6);
		
		String uploadPath = servletContext.getRealPath("/resources/book/");
		
		int cnt = bok_dao.insertBookMarket(bb);
		
		if(cnt == 1) {
			out.println("<script>alert('글자수 제한을 초과하였습니다!');</script>");
			out.flush();
			MemberBean mb = (MemberBean)session.getAttribute(sessionID);
			model.addAttribute("mb",mb);
			return viewPage;
		}

		File destination1 = new File(uploadPath + File.separator + bb.getB_image1());
		MultipartFile multi1 = bb.getUpload1();
		multi1.transferTo(destination1);
		
		File destination2 = new File(uploadPath + File.separator + bb.getB_image2());
		MultipartFile multi2 = bb.getUpload2();
		multi2.transferTo(destination2);
		
		File destination3 = new File(uploadPath + File.separator + bb.getB_image3());
		MultipartFile multi3 = bb.getUpload3();
		multi3.transferTo(destination3);
		
		return gotoPage;
	}
}