package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class EditorListController {
	private final String command = "SmartEditorList.pd";
	private final String viewPage = "SmartEditorList";
	
	@Autowired
	private BoardDao edao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		
		List<BoardBean> lists = edao.getAllBoard();
		model.addAttribute("list",lists);
		return viewPage;
	}
	
}