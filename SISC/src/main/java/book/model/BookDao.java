package book.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import utility.BookPaging;

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
}