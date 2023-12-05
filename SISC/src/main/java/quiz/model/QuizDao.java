package quiz.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myQuiz")
public class QuizDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="quiz.";
	
}
