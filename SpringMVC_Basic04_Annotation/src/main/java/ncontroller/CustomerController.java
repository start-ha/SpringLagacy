package ncontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.NoticeDao;
import vo.Notice;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired 
	private NoticeDao noticeDao;
	
	@GetMapping("/notice")
	public String noticeList(@RequestParam(value = "pg", defaultValue = "1") int page,
							@RequestParam(value = "f", defaultValue = "TITLE") String field,
							@RequestParam(value = "p", defaultValue = "%%") String query, Model model) throws Exception{
		
		List<Notice> list = noticeDao.getNotices(page, field, query);
		model.addAttribute("list", list);
		return "customer/notice";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("seq") String seq, Model model) throws Exception{
		Notice notice = noticeDao.getNotice(seq);
		model.addAttribute("notice", notice);
		return "customer/noticeDetail";
	}
	
	@GetMapping("/noticeReg")
	public String regForm() {
		return "customer/noticeReg";
	}
	
	@PostMapping("/noticeReg")
	public String reg(@ModelAttribute Notice notice) throws Exception{
		noticeDao.insert(notice);
		return "redirect:/customer/notice";
	}
	
	@GetMapping("/noticeEdit")
	public String editForm(@RequestParam("seq") String seq, Model model) throws Exception{
		Notice notice = noticeDao.getNotice(seq);
		model.addAttribute("notice", notice);
		return "customer/noticeEdit";
	}
	
	@PostMapping("/noticeEdit")
	public String edit(@ModelAttribute Notice notice) throws Exception{
		noticeDao.update(notice);
		return "redirect:/customer/noticeDetail?seq=" + notice.getSeq();
	}
	
	@GetMapping("/noticeDel")
	public String del(@RequestParam("seq") String seq) throws Exception{
		noticeDao.delete(seq);
		return "redirect:/customer/notice";
	}

}
