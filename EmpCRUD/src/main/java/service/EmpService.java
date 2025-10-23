package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EmpDao;

@Service
public class EmpService {
    @Autowired
    private EmpDao empDao;

    public List<Map<String, Object>> list(Map<String, Object> param) {
        int page = (int) param.get("page");
        int pageSize = (int) param.get("pageSize");
        param.put("startRow", (page - 1) * pageSize);
        param.put("endRow", page * pageSize);
        return empDao.empList(param);
    }
  
    public int getTotalCount() {
        return empDao.getTotalCount();
    }
    public Map<String, Object> detail(int empno) { return empDao.empDetail(empno); }
    public int checkEmpno(int empno) { return empDao.empCheck(empno); }
    public void insert(Map<String, Object> map) {
        System.out.println("⚙️ [Service] insert() 파라미터: " + map);

        // 키 대소문자 대응 처리
        Object empnoObj = map.get("empno") != null ? map.get("empno") : map.get("EMPNO");
        if (empnoObj == null) {
            throw new RuntimeException("사번(EMPNO)이 입력되지 않았습니다.");
        }

        int empno = Integer.parseInt(empnoObj.toString());
        int count = empDao.empCheck(empno);

        if (count > 0) {
            throw new RuntimeException("이미 존재하는 사번입니다. (" + empno + ")");
        }

        empDao.empInsert(map);
        
        System.out.println("✅ [Service] 사원 등록 완료: " + empno);

    }
    public void update(Map<String, Object> map) {
        // 빈 문자열을 null로 교체 (커미션, 관리자 등)
        map.replaceAll((k, v) -> {
            if (v instanceof String && ((String) v).trim().isEmpty()) {
                return null;
            }
            return v;
        });

        empDao.empUpdate(map);
    }
    public void delete(int empno) { empDao.empDelete(empno); }
    public boolean isEmpExist(int empno) {
        return empDao.empCheck(empno) > 0;
    }
   

}