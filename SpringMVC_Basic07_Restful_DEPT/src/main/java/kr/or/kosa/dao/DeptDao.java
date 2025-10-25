package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Dept;


public interface DeptDao {
	
	//@mapper 쓰면 이름에 Mapper쓰고, 안쓰면 Dao 클래스 이름 지칭
	//Mapper와 연동할 추상함수(CRUD)
	
	List<Dept> select();
	
	Dept selectByDeptno(int deptno);
	
	int insert(Dept dept);
	
	int update(Dept dept);
	
	int delete(int dept);
}
