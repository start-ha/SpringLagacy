package DI_03_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {

	public static void main(String[] args) {
		
		/*
		MessageBean_en en = new MessageBean_en();
		en.sayHello("hong");
		
		MessageBean_kr kr = new MessageBean_kr();
		kr.sayHello("hong");
		*/
		
		//인터페이스 (다형성) 부모타입 > 느슨한 구조 
		
		//인터페이스화 >> 타이어만 바꿔끼는....en, kr
		//MessageBean messageBean = new MessageBean_kr();
		//messageBean.sayHello("hong");
		
		//스프링 원하는 설계 방식 (인터페이스를 통한 다형성 : 느슨한 구조)
		
		//1. Spring 컨테이너 만들기
		//2. 컨테이너 안에 생성할 객체정보를 가지고 있는 xml 만들기
		//3. 필요한 객체 얻어내기
		
		//컨테이너 생성
		ApplicationContext context = 
				new  GenericXmlApplicationContext("classpath:DI_03_Spring/DI_03.xml");
		
		//Generic 사용시 Object 따로 명시안해도 됨
		
		//interface 사용(다형성) .... 좋은 코드
		//getBean 이름 다음 인터페이스 넣으면 자동으로 컨텍스트됨
		//원칙상 getBeans는 new 기능없고 꺼내기만 하는데
		//prototype을 바꾸면 기능을 쓸수는 있음
		//spring은 같은 객체를 계속 끄집어내는 싱글톤 패턴을 지향하기 때문에  prototype을 바꾸는 건 지양
		MessageBean messageBean = context.getBean("messageBean",MessageBean.class);
		messageBean.sayHello("hong");
	}

}
