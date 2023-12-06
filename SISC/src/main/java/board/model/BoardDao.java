package board.model;

import java.util.ArrayList;
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

	// (메인화면)qna게시판
	public List<BoardBean> getAllQnABoard() {
		List<BoardBean> qna_board_list = sqlSessionTemplate.selectList(namespace+"getAllQnABoard");
		return qna_board_list;
	}

	// (메인화면)수료생게시판
	public List<BoardBean> getAllGradBoard() {
		List<BoardBean> grad_board_list = sqlSessionTemplate.selectList(namespace+"getAllGradBoard");
		return grad_board_list;
	}

	// 자유게시판 레코드 숫자
	public int getCountFree() {
		int freeBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountFree");
		return freeBoardCount;
	}

	// 지식게시판 레코드 숫자
	public int getCountKnow() {
		int knowBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountKnow");
		return knowBoardCount;
	}

	// QnA게시판 레코드 숫자
	public int getCountQnA() {
		int qnaBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountQnA");
		return qnaBoardCount;
	}

	// (메인화면)수료생게시판
	public int getCountGrad() {
		int gradBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountGrad");
		return gradBoardCount;
	}
}
