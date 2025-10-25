package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Emp;


public interface EmpDao {
	
	//@mapper 쓰면 이름에 Mapper쓰고, 안쓰면 Dao 클래스 이름 지칭
	//Mapper와 연동할 추상함수(CRUD)
	
	List<Emp> select();
	
	Emp selectByEmpno(int empno);
	
	int insert(Emp emp);
	
	int update(Emp emp);
	
	int delete(int emp);
}
