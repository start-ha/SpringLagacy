package dao;

import java.sql.SQLException;
import java.util.List;

import vo.Notice;

//CRUD
public interface NoticeDao {
	//게시물 개수
	 int getCount(String field, String query) throws ClassNotFoundException, SQLException;
		
	//전체 게시물
	 List<Notice> getNotices(int page, String field, String query) throws ClassNotFoundException, SQLException;

	//게시물 삭제
	 int delete(String seq) throws ClassNotFoundException, SQLException;
	
	
	//게시물 수정
	 int update(Notice notice) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	 Notice getNotice(String seq) throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	 int insert(Notice n) throws ClassNotFoundException, SQLException; 

	 //트랜잭션 처리 함수
	 //update 구현
	 //admin 사용자가 게시판에 글을 쓰면 member 테이블에 있는 point 컬럼을 1씩 증가
	 int updateOfMemberPoint(String userid)throws ClassNotFoundException, SQLException;

	 //mapper로 감


}
