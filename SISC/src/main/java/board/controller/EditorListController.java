package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class EditorListController {
	
	private final String command = "SmartEditorList.pd";
	private final String viewPage = "SmartEditorList";
	
	@Autowired
	private BoardDao bdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<BoardBean> lists = bdao.getAllBoard();
		model.addAttribute("list",lists);
		return viewPage;
		
	}
	
}