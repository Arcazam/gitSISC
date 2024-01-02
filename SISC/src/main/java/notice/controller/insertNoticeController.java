package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import notice.model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class insertNoticeController {
	private final String command = "insertNotice.bd";
	private final String viewPage = "../manager/board/magNoticeInsert";
	private final String gotoPage = "boardList.mag";
	
	@Autowired
	NoticeDao ndao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String isnertForm() {
		
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String isnert(@ModelAttribute("bd") NoticeBean bd) {
		
		ndao.insertNotice(bd);
		
		return gotoPage;
	}
}
