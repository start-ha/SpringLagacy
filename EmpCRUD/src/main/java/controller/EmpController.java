package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    private EmpService empService;

    @RequestMapping("/empList.do")
    public String list(@RequestParam(value="page", defaultValue="1") int page, Model model) {
        int pageSize = 8;
        int totalCount = empService.getTotalCount();

        Map<String, Object> param = new java.util.HashMap<>();
        param.put("page", page);
        param.put("pageSize", pageSize);

        model.addAttribute("list", empService.list(param));
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalCount", totalCount);

        return "emp/empList";
    }

    @RequestMapping("/empDetail.do")
    public String detail(@RequestParam int empno, Model model) {
        model.addAttribute("emp", empService.detail(empno));
        return "emp/empDetail";
    }

    @RequestMapping("/empAddForm.do")
    public String addForm() {
        return "emp/empAdd";
    }

    @PostMapping("/empAdd.do")
    public String add(@RequestParam Map<String, Object> map, Model model) {
        System.out.println("📥 [Controller] empAdd 요청 수신: " + map);
        try {
            empService.insert(map);
        } catch (RuntimeException e) {
            model.addAttribute("msg", e.getMessage());
            return "emp/empAdd"; // 다시 입력 폼으로 이동
        }
        return "redirect:/emp/empList.do";
    }


    @RequestMapping("/empEditForm.do")
    public String editForm(@RequestParam int empno, Model model) {
        model.addAttribute("emp", empService.detail(empno));
        return "emp/empEdit";
    }

    @PostMapping("/empEdit.do")
    public String edit(@RequestParam Map<String, Object> map) {
        empService.update(map);
        return "redirect:/emp/empList.do";
    }

    @RequestMapping("/empDelete.do")
    public String delete(@RequestParam int empno) {
        empService.delete(empno);
        return "redirect:/emp/empList.do";
    }
}
