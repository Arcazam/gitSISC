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

	// ���İԽ��� ���ڵ� ����
	public int getCountKnow() {
		int knowBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountKnow");
		return knowBoardCount;
	}
	
	// (����ȭ��)������Խ���
	public int getCountGrad() {
		int gradBoardCount = sqlSessionTemplate.selectOne(namespace+"getCountGrad");
		return gradBoardCount;
	}
}
