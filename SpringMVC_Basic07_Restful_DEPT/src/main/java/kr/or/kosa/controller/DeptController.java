package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Dept;
import kr.or.kosa.service.DeptService;

@RestController
@RequestMapping("/dept")
public class DeptController {

	//method = GET, POST, PUT, DELET 판단
	//@RestController 여기 안에 함수는 다 비동기야~~
	//EmpController는 EmpService 에 의존
	//1.lombok 2.멤버필드
	
	//service에 의존
	private DeptService deptService;

	@Autowired
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}
	
	//@RestController > @Controller + @ResponseBody 모든 함수는 비동기 처리 ...
	//@RequestMapping("/emp") + GET(행위)
	//전체조회
	
	@GetMapping
	public ResponseEntity<List<Dept>> deptList(){
		
		
		List<Dept> list = new ArrayList<Dept>();
		try {
			System.out.println("실행");
			list = deptService.selectAllDeptList();
			return new ResponseEntity<List<Dept>>(list, HttpStatus.OK);
			
		}catch(Exception e) {
			System.out.println("비정상 실행");
			return new ResponseEntity<List<Dept>>(list, HttpStatus.BAD_REQUEST);
		}
		
		
		
	}
	
	//조건조회
	//http://192.168.2.8/emp/7902
	//@RequestMapping("/emp")
	//@RequestMapping(value="{empno}", method=RequestMethod.GET)

	/*
	 @GetMapping("/{userId}/{itemId}")
	
	 */
	
	@GetMapping("{deptno}")
	public Dept deptListByDeptno(@PathVariable("deptno") int deptno) {
		return deptService.selectDeptByDeptno(deptno);
	}
	
	//삽입
	//   /emp + 데이터(JSON객체 형태의 문자열) + POST
	// 동기방식 (DTO 타입으로 parameter 받음) -> 비동기도 가능한데 대신에 (@RequestBody Emp emp)로 DTO를 받는다
	@PostMapping
	public ResponseEntity<String> insert(@RequestBody Dept dept){
		
		try {
			System.out.println("insert");
			System.out.println(dept.toString()); //데이터 나오는지 확인
			deptService.insert(dept);
			return new ResponseEntity<String>("insert success", HttpStatus.OK); // 원하는 상태코드 문자열(200번) 보냄
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		
		}
		
		
	}
	
	
	//수정
	//@PutMapping  @RequestBody Emp emp
	@PutMapping
	public ResponseEntity<String> update(@RequestBody Dept dept){
		
		try {
			System.out.println("update");
			System.out.println(dept.toString());
			deptService.update(dept);
			return new ResponseEntity<>("update success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("update failed", HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
	
	
	
	//삭제
	//@DeleteMapping @PathVriable("empno") int empno
	@DeleteMapping("/{deptno}")
	public ResponseEntity<String> delete(@PathVariable("deptno") int deptno){
		try {
			System.out.println("delete");
			deptService.delete(deptno);
			return new ResponseEntity<>("delete success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("delete success", HttpStatus.BAD_REQUEST);
		}
	}
	
	
	
}
