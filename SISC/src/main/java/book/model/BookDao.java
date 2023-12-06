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
	
}
