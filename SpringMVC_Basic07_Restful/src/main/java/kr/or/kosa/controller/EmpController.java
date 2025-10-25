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

import kr.or.kosa.dto.Emp;
import kr.or.kosa.service.EmpService;

@RestController
@RequestMapping("/emp")
public class EmpController {

	//method = GET, POST, PUT, DELET 판단
	//@RestController 여기 안에 함수는 다 비동기야~~
	//EmpController는 EmpService 에 의존
	//1.lombok 2.멤버필드
	
	//service에 의존
	private EmpService empService;

	@Autowired
	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}
	
	//@RestController > @Controller + @ResponseBody 모든 함수는 비동기 처리 ...
	//@RequestMapping("/emp") + GET(행위)
	//전체조회
	
	@GetMapping
	public ResponseEntity<List<Emp>> empList(){
		
		
		List<Emp> list = new ArrayList<Emp>();
		try {
			System.out.println("실행");
			list = empService.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list, HttpStatus.OK);
			
		}catch(Exception e) {
			System.out.println("비정상 실행");
			return new ResponseEntity<List<Emp>>(list, HttpStatus.BAD_REQUEST);
		}
		
		
		
	}
	
	//조건조회
	//http://192.168.2.8/emp/7902
	//@RequestMapping("/emp")
	//@RequestMapping(value="{empno}", method=RequestMethod.GET)

	/*
	 @GetMapping("/{userId}/{itemId}")
	
	 */
	
	@GetMapping("{empno}")
	public Emp empListByEmpno(@PathVariable("empno") int empno) {
		return empService.selectEmpByEmpno(empno);
	}
	
	//삽입
	//   /emp + 데이터(JSON객체 형태의 문자열) + POST
	// 동기방식 (DTO 타입으로 parameter 받음) -> 비동기도 가능한데 대신에 (@RequestBody Emp emp)로 DTO를 받는다
	@PostMapping
	public ResponseEntity<String> insert(@RequestBody Emp emp){
		
		try {
			System.out.println("insert");
			System.out.println(emp.toString()); //데이터 나오는지 확인
			empService.insert(emp);
			return new ResponseEntity<String>("insert success", HttpStatus.OK); // 원하는 상태코드 문자열(200번) 보냄
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		
		}
		
		
	}
	
	
	//수정
	//@PutMapping  @RequestBody Emp emp
	@PutMapping
	public ResponseEntity<String> update(@RequestBody Emp emp){
		
		try {
			System.out.println("update");
			System.out.println(emp.toString());
			empService.update(emp);
			return new ResponseEntity<>("update success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("update failed", HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
	
	
	
	//삭제
	//@DeleteMapping @PathVriable("empno") int empno
	@DeleteMapping("/{empno}")
	public ResponseEntity<String> delete(@PathVariable("empno") int empno){
		try {
			System.out.println("delete");
			empService.delete(empno);
			return new ResponseEntity<>("delete success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("delete success", HttpStatus.BAD_REQUEST);
		}
	}
	
	
	
}
