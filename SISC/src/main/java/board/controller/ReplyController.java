package board.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class ReplyController {
	private final String command = "reply.bd";
	private final String viewPage = "replyForm";
	private final String gotoPage = "redirect:detailList.bd";

	@Autowired
	private BoardDao bdao;


	@RequestMapping(value =  command, method = RequestMethod.POST)
	public String reply(
			@ModelAttribute("bb") BoardBean bb,
			@RequestParam("b_num") int b_num,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("ref") int ref, 
			@RequestParam("re_step") int re_step,
			@RequestParam("re_level") int re_level, 
			HttpServletRequest request, Model model) {

		bb.setRef(ref);
		bb.setRe_step(re_step);
		bb.setRe_level(re_level);
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));

		bdao.updateReply(bb);
		bdao.insertReply(bb);

		return gotoPage + "?b_num=" + b_num + "&ref=" + ref  + "&pageNumber=" + pageNumber;
	}
}
