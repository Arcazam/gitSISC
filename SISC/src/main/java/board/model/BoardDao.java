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

	// (����ȭ��)�����Խ���
	public List<BoardBean> getAllFreeBoard() {
		List<BoardBean> free_board_list = sqlSessionTemplate.selectList(namespace+"getAllFreeBoard");
		return free_board_list;
	}

	// (����ȭ��)qna�Խ���
	public List<BoardBean> getAllKnowBoard() {
		List<BoardBean> know_board_list = sqlSessionTemplate.selectList(namespace+"getAllKnowBoard");
		return know_board_list;
	}

	// (����ȭ��)qna�Խ���
	public List<BoardBean> getAllQnABoard() {
		List<BoardBean> qna_board_list = sqlSessionTemplate.selectList(namespace+"getAllQnABoard");
		return qna_board_list;
	}

	// (����ȭ��)������Խ���
	public List<BoardBean> getAllGradBoard() {
		List<BoardBean> grad_board_list = sqlSessionTemplate.selectList(namespace+"getAllGradBoard");
		return grad_board_list;
	}

	// �����Խ��� ���ڵ� ����
	public int getCountFree() {
		int freeBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountFree");
		return freeBoardCount;
	}

	// ���İԽ��� ���ڵ� ����
	public int getCountKnow() {
		int knowBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountKnow");
		return knowBoardCount;
	}

	// QnA�Խ��� ���ڵ� ����
	public int getCountQnA() {
		int qnaBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountQnA");
		return qnaBoardCount;
	}

	// (����ȭ��)������Խ���
	public int getCountGrad() {
		int gradBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountGrad");
		return gradBoardCount;
	}
}
