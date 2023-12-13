package member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberUpdateController {
	private final String command = "update.mb";
	private final String command2 = "updateImg.mb";
	private final String viewPage = "updateMember";
	private final String viewPage2 = "updateProImg";
	private final String gotoPage = "redirect:SiscLoginMain.view";
	private final String gotoPage2 = "redirect:SelectAllStudy.st";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	ServletContext servletContext;
	 
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String update(@RequestParam("id") String id, Model model) {
		
		MemberBean mb =  mdao.selectGetById(id);
		model.addAttribute("mb",mb);
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String update2(MemberBean mb, @RequestParam(value = "address_main") String address_main,
	         @RequestParam(value = "address_detail") String address_detail) {
		// 메인주소와 상세주소 합치기
	      mb.setAddress(address_main + " " + address_detail);
	      
		mdao.updateMember(mb); 
		System.out.println("2");
		return gotoPage;
	}
	
	@RequestMapping(value = command2, method = RequestMethod.GET)
	public String updateImg(@RequestParam("id") String id, Model model) {
		
		MemberBean mb =  mdao.selectGetById(id);
		model.addAttribute("mb",mb);
		
		return viewPage2;
	}
	
	@RequestMapping(value = command2, method = RequestMethod.POST)
	public String updateImg2(MemberBean mb) {
		mdao.updateProImg(mb);
		
		String uploadPath = servletContext.getRealPath("/resources/member/pro_img/");
		File destination = new File(uploadPath+File.separator+mb.getPro_img());
		File destination2 = new File(uploadPath+File.separator + mb.getUpload2());
		
		MultipartFile multi = mb.getUpload();
		
		System.out.println("destination:"+destination);
		System.out.println("destination2:"+destination);
		try {
			
			// 웹서버폴더의 새 이미지 업로드 
			multi.transferTo(destination);
			
			// 웹서버폴더의 기존 이미지 삭제 
			destination2.delete(); 
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} // 파일업로드
		
		return gotoPage2;
	}
}
