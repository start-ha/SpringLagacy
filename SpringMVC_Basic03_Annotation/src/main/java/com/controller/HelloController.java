package com.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/*
 public class NoticeController implements Controller 기존방식
 하나의 요청만 처리
 
 <bean  id="/customer/notice.htm"           class="controllers.customer.NoticeController"></bean>

 단순한 작업아니면...
 
 게시판 하나만 만들어도 (목록보기, 글쓰기, 수정, 삭제 등의 요청 여러개)
 
 >> 하나의 클래스가 여러 개의 요청을 메서드로 처리하자
 >>@Controller >> 그안에서 함수단위로 mapping 작업 가능
 
 
 */


@Controller
public class HelloController {
	
	//생성자
	public HelloController() {
		System.out.println("HelloController 생성됨");
	}

	//요청    <a href="hello.do">hello.do 요청하기</a>
	@RequestMapping("/hello.do")
	public ModelAndView hello() {
		System.out.println("hello.do 요청에 대해서 method call");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("greeting",getGreeting());
		mv.setViewName("Hello"); //WEB-INF/views + Hello +.jsp
		return mv;
	}
	
	//클래스인 장점 : 함수로 쓰기 편함. 내부함수임
	
	private String getGreeting() {
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		String data = "";
		if( hour >=6 && hour <=10 ) {
			data = "학습시간";
		}else if (hour >=11 && hour <=13) {
			data = "배고픈 시간";
		}else if (hour >=14 && hour <= 18) {
			data = "졸려운 시간";
		}else {
			data = "go home";
		}
		return data;
	}
	
	
}
