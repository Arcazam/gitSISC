package board.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myBoard")
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="board.";
	
}
