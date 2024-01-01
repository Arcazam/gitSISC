package board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDeleteController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/delete.bd";
	public final String gotoPage = "redirect:/board.bd";
	public final String sessionID = "loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDelete(
				@RequestParam("b_num") int b_num,
				@RequestParam("b_cate") String b_cate
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_num", b_num);
		map.put("b_cate", b_cate);
		
		System.out.println("¿À´Ï?");
		
		bor_dao.deleteBoard(map);
		
		return gotoPage + "?board=" + b_cate;
	}
	
}
