package manager.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class ManagerBoardDetailController {

	@Autowired
	private BoardDao bor_dao;
	
	public final String command = "/dListBoard.mag";
	public final String viewPage = "board/magBoardDetail";
	public final String sessionID = "mag_loginInfo";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
				Model model
				,BoardBean bb
				,@RequestParam("b_num") int b_num
				,@RequestParam("pageNumber") int pageNumber
			) {
		
		bb.setB_num(b_num);
		BoardBean modelAttBor = bor_dao.getBoardInfoBnum(bb);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",modelAttBor);
		
		return viewPage;
	}
	
}
