package book.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.BookPaging;

@Component("myBook")
public class BookDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="book.";

	// å ���ڵ� 5�����
	public List<BookBean> selectAllToMainBook() {
		List<BookBean> book_list = sqlSessionTemplate.selectList(namespace+"selectAllToMainBook");
		return book_list;
	}

	// å ���ڵ� �������
	public int getCountBook() {
		int bookCount = sqlSessionTemplate.selectOne(namespace+"getCountBook");
		return bookCount;
	}

	public List<BookBean> getBookList(BookPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BookBean> book_list = sqlSessionTemplate.selectList(namespace+"getBookList",map,rowBounds);
		return book_list;
	}
	
}
