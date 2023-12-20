package quiz.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.QuizPaging;


@Component("myQuiz")
public class QuizDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="quiz.";

	public List<QuizBean> getJavaQuiz() {
		List<QuizBean> list = new ArrayList<QuizBean>();
		
		
		list = sqlSessionTemplate.selectList(namespace+"getJavaQuiz"); 
		return list;
	}
	
}