package member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberInsertController {
	
	@Autowired
	private MemberDao mdao;

	@Autowired
	ServletContext servletContext;
	
	public final String command = "/insertMember.mb";
	public final String viewPage = "insertMember";
	public final String gotoPage = "redirect:/login.mb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toInsertMember() {
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String tologinForm(
				MemberBean mb,
				@RequestParam(value="address_main") String address_main,
				@RequestParam(value="address_detail") String address_detail,
				@RequestParam(value="hp1") String hp1,
				@RequestParam(value="hp2") String hp2,
				@RequestParam(value="hp3") String hp3
			) throws IllegalStateException, IOException {
			
		String uploadPath = servletContext.getRealPath("/resources/img/member/pro_img/");
				
			// 메인주소와 상세주소 합치기
			mb.setAddress(address_main+" "+address_detail);
			
			// 핸드폰 번호 합치기
			mb.setPhone(hp1+"-"+hp2+"-"+hp3);
			
			mdao.insertMember(mb);
			
			File destination = new File(uploadPath+File.separator+mb.getPro_img());
			
			MultipartFile multi = mb.getUpload();
			
			multi.transferTo(destination);
			
		return gotoPage;
	}
	
}
