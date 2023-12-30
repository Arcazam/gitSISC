package book.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Component;

import utility.BookPaging;
import utility.ManagerPaging;

@Component("myBook")
public class BookDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="book.";

	// 책 레코드 5개출력
	public List<BookBean> selectAllToMainBook() {
		List<BookBean> book_list = sqlSessionTemplate.selectList(namespace+"selectAllToMainBook");
		return book_list;
	}

	// 책 레코드 숫자출력
	public int getCountBook() {
		int bookCount = sqlSessionTemplate.selectOne(namespace+"getCountBook");
		return bookCount;
	}

	public List<BookBean> getBookList(BookPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BookBean> book_list = sqlSessionTemplate.selectList(namespace+"getBookList",map,rowBounds);
		return book_list;
	}
	
	// 관리자 리스트 갯수 출력
	public int bookMagCount(Map<String, String> map) {
		int bookMagCount = sqlSessionTemplate.selectOne(namespace+"bookMagCount",map);
		return bookMagCount;
	}
	
	// 관리자 전체리스트 출력
	public List<BookBean> getMagBookList(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BookBean> book_list = sqlSessionTemplate.selectList(namespace+"getMagBookList",map,rowBounds);
		return book_list;
	}

	public int insertBookMarket(BookBean bb) {
		int cnt = 0;
		
		try {
			sqlSessionTemplate.insert(namespace+"insertBookMarket",bb);
		} catch(UncategorizedSQLException e) {
			e.printStackTrace();
			cnt = 1;
		}
		return cnt;
	}

	public BookBean getWriterNumDetail(BookBean bb) {
		bb = sqlSessionTemplate.selectOne(namespace+"getWriterNumDetail",bb);
		
		return bb;
	}
	
	public void deleteBook(int bk_num) {
		sqlSessionTemplate.delete(namespace+"deleteBook", bk_num);
		
	}
	
	public int updateBook(BookBean bb) {
		int cnt = sqlSessionTemplate.update(namespace+"updateBook",bb);
		      
		return cnt;
	}
	public int SaleComple(int bk_num) {
		
		int cnt = sqlSessionTemplate.update(namespace+"SaleComple",bk_num);
		
		return cnt;
	}
	
	public BookBean getWriterNumDetail2(String bk_num) {
		BookBean  bb = sqlSessionTemplate.selectOne(namespace+"getWriterNumDetail",bk_num);
		return bb;
	}

	public int selectAndDelteBook(BookBean bb) {
		int checkDelete = sqlSessionTemplate.delete(namespace+"deleteBook", bb.getBk_num());
		return checkDelete;
	}

	
}