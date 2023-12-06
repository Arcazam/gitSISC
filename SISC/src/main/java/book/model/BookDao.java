package book.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
	
}
