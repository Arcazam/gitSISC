package member.controller;

import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String toInsertMember() {
		return viewPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String tologinForm(MemberBean mb, @RequestParam(value = "address_main") String address_main,
			@RequestParam(value = "address_detail") String address_detail,
			@RequestParam(value = "upload", required = false) MultipartFile upload,
			@RequestParam(value = "joomin1") String joomin1, 
			@RequestParam(value = "joomin2") String joomin2,
			@RequestParam(value = "hp1") String hp1, 
			@RequestParam(value = "hp2") String hp2,
			@RequestParam(value = "hp3") String hp3) throws IllegalStateException, IOException {

		String uploadPath = servletContext.getRealPath("/resources/member/"+ mb.getId() +"/pro_img/");
		System.out.println("uploadPath:"+uploadPath);
		// uploadPath : F:\쌍용강북\팀프로젝트\WorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SISC\resources
		
		 try {
	            // 폴더를 생성할 경로를 나타내는 Path 객체 생성
	            Path folder = Paths.get(uploadPath);

	            // 폴더가 존재하지 않으면 폴더를 생성
	            if (!Files.exists(folder)) {
	                Files.createDirectories(folder);
	            } else {
	                System.out.println("폴더가 이미 존재합니다.");
	            }
	        } catch (IOException e) {
	            System.err.println("폴더 생성 중 오류 발생: " + e.getMessage());
	        }

		
		// 메인주소와 상세주소 합치기
		mb.setAddress(address_main + " " + address_detail);

		// 주민등록번호 앞,뒤 합치기
		mb.setJoomin(joomin1 + "-" + joomin2);

		// 핸드폰 번호 합치기
		mb.setPhone(hp1 + "-" + hp2 + "-" + hp3);
		
		if (upload.isEmpty()) {
			mb.setPro_img("defaultImg.png");
			mdao.insertMember(mb);
		} else {
			mdao.insertMember(mb);
			File destination = new File(uploadPath + File.separator + mb.getPro_img());
			MultipartFile multi = mb.getUpload();
			multi.transferTo(destination);
		}

		return gotoPage;
	}

}