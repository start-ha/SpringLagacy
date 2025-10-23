package dao;

import java.util.List;
import java.util.Map;

public interface EmpDao {
    List<Map<String, Object>> empList(Map<String, Object> param);
    Map<String, Object> empDetail(int empno);
    void empInsert(Map<String, Object> map);
    void empUpdate(Map<String, Object> map);
    void empDelete(int empno);

    int getTotalCount();
    int empCheck(int empno);
}