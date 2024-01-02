package member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
	private final String gotoPage = "redirect:SelectAllStudy.st";
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
	         @RequestParam(value = "address_detail") String address_detail,
	         @RequestParam(value = "joomin1") String joomin1, 
			 @RequestParam(value = "joomin2") String joomin2) {
		
		// 메인주소와 상세주소 합치기
		mb.setAddress(address_main + " " + address_detail);

		// 주민등록번호 앞,뒤 합치기
		mb.setJoomin(joomin1 + "-" + joomin2);

		mdao.updateMember(mb); 
		
		return gotoPage + "?id=" + mb.getId() + "&pro_img=" + mb.getPro_img();
	}
	
	@RequestMapping(value = command2, method = RequestMethod.GET)
	public String updateImg(@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img,
			Model model) {
		
		MemberBean mb =  mdao.selectGetById(id);
		model.addAttribute("mb",mb);
		model.addAttribute("id",id);
		model.addAttribute("pro_img",pro_img);
		
		return viewPage2;
	}
	
	@RequestMapping(value = command2, method = RequestMethod.POST)
	public String updateImg2(MemberBean mb, HttpSession session,
			@RequestParam("id") String id,
			@RequestParam("pro_img") String pro_img) {
		
		String uploadPath = servletContext.getRealPath("/resources/member/"+mb.getId()+"/pro_img/");
		
		String newProImg = mb.getPro_img();
		
		mdao.updateProImg(mb);
		
		MultipartFile multi = mb.getUpload();
		
		try {
			Path folder = Paths.get(uploadPath);
			
			// 폴더가 존재하지 않으면 폴더를 생성
            if (!Files.exists(folder)) {
                Files.createDirectories(folder);
            } else {
                
            }
				
			// 웹서버폴더의 새 이미지 업로드 
            File destination = new File(uploadPath+File.separator+mb.getPro_img());
            destination.delete(); 
            multi.transferTo(destination);
			
			// 웹서버폴더의 기존 이미지 삭제 
			File destination2 = new File(uploadPath+File.separator + mb.getUpload2());
			destination2.delete(); 
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} // 파일업로드
		 session.setAttribute("updateImg", newProImg);
		
		return gotoPage2 + "?id=" + id + "&pro_img=" + newProImg;
	}
}
