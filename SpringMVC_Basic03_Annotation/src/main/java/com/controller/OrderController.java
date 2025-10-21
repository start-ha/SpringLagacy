package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.OrderCommand;

/*
 * 하나의 요청 주소로 2가지 업무를 처리
 * Get 방식 > 화면
 * Post 방식 > 처리기능
 * 
 * */


@Controller
@RequestMapping("/order/order.do")
public class OrderController {

	
	@GetMapping
	public String form() {
		return "order/OrderForm";
	}
	
	
	@PostMapping
	public String submit(OrderCommand orderCommand) {
		
		return "order/OrderCommitted"; //뷰의 주소
	}
}


/*
 * 
 *private List<OrderItem> orderItem; parameter로
 *orderItem[0], orderItem[1], orderItem[2]   
 *
 *setter 동작 
 * public void setOrderItem(List<OrderItem> orderItem){
 * 	this.orderItem = orderItem;
 * }
 * 
 * 할려면 ArrayList 필요 .....
 * 
 * 
 * 
 *
 * 생략된 코드
 * 
 * 1. OrderCommand 객체가 만들어짐
 *    >>  OrderCommand orderCommand = new OrderCommand
 * 2. 자동매핑 >> member field 자동 매핑되야함 >> private List<OrderItem> orderItem>> 자동주입해야함
 * 3. List<OrderItem> itemList = new ArrayList();  >> 내부적으로 itemList가 만들어짐
 * 		>> orderItem[0].itemid >> 1
 * 		>> orderItem[0].number >> 10
 * 		>> orderItem[0].remark >> 파손주의
 *    위 3개가 itemList에 들어감
 *    
 *    itemList.add(new OrderItem(1,10,"파손주의");
 * 4. 알아서 3번 동작
 * 
 * 		>> orderItem[1].itemid >> 2
 * 		>> orderItem[1].number >> 3
 * 		>> orderItem[1].remark >> 리모컨 별도
 * 
 *     itemList.add(new OrderItem(2,3,"리모컨 별도");
 *     
 *     >> orderItem[2].itemid >> 3
 * 		>> orderItem[2].number >> 5
 * 		>> orderItem[2].remark >> 리모컨 별도
 * 
 *     itemList.add(new OrderItem(3,5,"리모컨 별도");
 *		
 *	setter로 넘어오는 것들이 단 건식 넘어옴
 *
 * orderCommand.setOrderItem(itemList); 최종..
 * 
 * 
 * 5. view 전달
 *    forward ...
 *    
 *    submit(OrderCommand orderCommand)
 *    key >> OrderCommand >> orderCommand >> mv.addObject("orderCommand", 주소)
 *    value >> OrderCommand 객체 주소
 *
 * 
 */