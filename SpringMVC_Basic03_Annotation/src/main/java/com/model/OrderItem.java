package com.model;

import lombok.Data;

//DB 상품테이블
//Order > OrderItem(주문상세)

@Data
public class OrderItem {
	private int itemid;
	private int number; //수량
	private String remark; //주의사항
}
