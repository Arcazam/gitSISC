package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class EditorController {
	private final String command = "editor.bd";
	private final String viewPage = "SmartEditor";
	private final String gotoPage = "redirect:SmartEditorList.bd";

	@Autowired
	private BoardDao edao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String editor() {
		
		return viewPage;
	}

	@RequestMapping(value = "editor2.pd")
	public String editorInsert(@RequestParam("txt") String txt) {
		
		edao.insertBoard(txt); 
		return gotoPage;
	}

}
