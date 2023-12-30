package quiz.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import utility.ManagerPaging;

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

	// 관리자
	public int getMagQuizCount(QuizBean qb, Map<String, String> map) {
		int quizMagCateCount = sqlSessionTemplate.selectOne(namespace+"get"+qb.getQue_cate()+"QuizCount",map);
		return quizMagCateCount;
	}

	public List<QuizBean> getAllMagQuizList(QuizBean qb, ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<QuizBean> qlist = sqlSessionTemplate.selectList(namespace+"get"+qb.getQue_cate()+"QuizList",map,rowBounds);
		return qlist;
	}

	public QuizBean getDetailQuiz(QuizBean qb) {
		QuizBean modelAttBor = sqlSessionTemplate.selectOne(namespace+"getDetailQuiz",qb);
		return modelAttBor;
	}

	public void deleteQuiz(QuizBean qb) {
		sqlSessionTemplate.delete(namespace+"deleteQuiz",qb);
	}

	public int selectAndDelteQuiz(QuizBean qb) {
		int checkDelete = sqlSessionTemplate.delete(namespace+"deleteQuiz",qb);
		return checkDelete;
	}

	public int insertQuiz(QuizBean qb) {
		int cnt = sqlSessionTemplate.insert(namespace+"insertQuiz",qb);
		return cnt;
	}

	public int updateQuiz(QuizBean qb) {
		int cnt = sqlSessionTemplate.update(namespace+"updateQuiz",qb);
		return cnt;
	}
	
}