package board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myBoard")
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="board.";

	// (메인화면)자유게시판
	public List<BoardBean> getAllFreeBoard() {
		List<BoardBean> free_board_list = sqlSessionTemplate.selectList(namespace+"getAllFreeBoard");
		return free_board_list;
	}

	// (메인화면)qna게시판
	public List<BoardBean> getAllKnowBoard() {
		List<BoardBean> know_board_list = sqlSessionTemplate.selectList(namespace+"getAllKnowBoard");
		return know_board_list;
	}

	// 지식게시판 레코드 숫자
	public int getCountKnow() {
		int knowBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountKnow");
		return knowBoardCount;
	}
	
	// (메인화면)수료생게시판
	public int getCountGrad() {
		int gradBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountGrad");
		return gradBoardCount;
	}
}
