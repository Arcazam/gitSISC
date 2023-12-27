package quiz.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myQuiz")
public class QuizDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="quiz.";

	// 카테고리당 문제 제목 출력
	public List<QuizBean> getCateQuizList() {
		List<QuizBean> qlist = sqlSessionTemplate.selectList(namespace+"getCateQuizList");
		return qlist;
	}

	public QuizBean makeAQuestion(QuizBean qb) {
		QuizBean sendBean = sqlSessionTemplate.selectOne(namespace+"makeAQuestion",qb);
		return sendBean;
	}

	public int getStartPoint(QuizBean qb) {
		int start_num = sqlSessionTemplate.selectOne(namespace+"getStartPoint",qb);
		return start_num;
	}

	public int getEndPoint(QuizBean qb) {
		int end_num = sqlSessionTemplate.selectOne(namespace+"getEndPoint",qb);
		return end_num;
	}

	public int checkAnswer(QuizBean qb) {
		int checkAnswer = sqlSessionTemplate.selectOne(namespace+"checkAnswer",qb);
		return checkAnswer;
	}
	
}