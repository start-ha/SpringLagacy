package com.service;

import com.model.NewArticleCommand;

/*

@Service
public class ArticleService

자동화
@Service 붙어있는 클래스는 componentScan 자동으로 Bean  객체 생성
<context:component-scan base-package="com.service"> 가 web.xml에 있어야 함
위에 태그를 읽고 자동으로 bean 생성
 
 */

public class ArticleService {
	public ArticleService() {
		System.out.println("ArticleService 서비스 생성자 호출");
	}
	
	public void writeArticle(NewArticleCommand command) {
		//DAO 있다고 가정
		//Dao dao = new Dao(); dao.insert(command)
		System.out.println("글쓰기 작업 완료: " + command.toString());
	}
	

}
