package board.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import utility.BoardCommentsPaging;
import utility.BoardPaging;

@Component("myBoard")
public class BoardDao {

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   
   private String namespace="board.";

// (����ȭ��)�����Խ���
   public List<BoardBean> getAllFreeBoard(Map<String, String> map) {
      List<BoardBean> free_board_list = sqlSessionTemplate.selectList(namespace+"getAllFreeBoard", map);
      return free_board_list;
   }

   // (����ȭ��)qna�Խ���
   public List<BoardBean> getAllKnowBoard(Map<String, String> map) {
      List<BoardBean> know_board_list = sqlSessionTemplate.selectList(namespace+"getAllKnowBoard", map);
      return know_board_list;
   }

   // (����ȭ��)qna�Խ���
   public List<BoardBean> getAllQnABoard(Map<String, String> map) {
      List<BoardBean> qna_board_list = sqlSessionTemplate.selectList(namespace+"getAllQnABoard", map);
      return qna_board_list;
   }

   // (����ȭ��)������Խ���
   public List<BoardBean> getAllGradBoard(Map<String, String> map) {
      List<BoardBean> grad_board_list = sqlSessionTemplate.selectList(namespace+"getAllGradBoard", map);
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


   // �����Խ��� ����¡ó�� �˻�
	public List<BoardBean> selectFreeDetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectFreeDetailCate",map,rowBounds);
		return board_cateList;	
	}
	
	// ���İԽ��� ����¡ó�� �˻�
	public List<BoardBean> selectKnowDetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectKnowDetailCate",map,rowBounds);
		return board_cateList;	
	}
	
	// QnA�Խ��� ����¡ó�� �˻�
	public List<BoardBean> selectQnADetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectQnADetailCate",map,rowBounds);
		return board_cateList;	
	}
	
	// ������Խ��� ����¡ó�� �˻�
	public List<BoardBean> selectGradDetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectGradDetailCate",map,rowBounds);
		return board_cateList;	
	}

	// �Խ��� ���� �۾�
	public int insertBoardContent(BoardBean bb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.insert(namespace+"insertBoardContent",bb);			
		} catch(UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}

	// �Խ��� �۾��� ���� ��������
	public BoardBean getBoardInfoWriter(int b_num) {
		BoardBean bb = sqlSessionTemplate.selectOne(namespace+"getBoardInfoWriter",b_num);
		return bb;
	}

	// �Խ��� ���� �۾�
	public int updateBoardContent(BoardBean bb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.update(namespace+"updateBoardContent",bb);			
		} catch(UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}

	public BoardBean getBoardInfoBnum(BoardBean bb) {
		BoardBean modelAttBor = sqlSessionTemplate.selectOne(namespace+"getBoardInfoBnum",bb);
		return modelAttBor;
	}

	public void deleteBoardContent(BoardBean bb) {
		sqlSessionTemplate.delete(namespace+"deleteBoardContent",bb);
	}

	// ���� �ؿ��޸� ��� ����Ʈ��
	public List<BoardBean> getAllCommentsLists(BoardCommentsPaging pageInfo, BoardBean bb) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("ref", bb.getRef());
		List<BoardBean> numCommentsList = sqlSessionTemplate.selectList(namespace+"getAllCommentsLists",map,rowBounds);
		return numCommentsList;
	}
	
	// ���� �ؿ��޸� ��� ��
	public int getCommentsCount(BoardBean bb) {
		int boardCommentsCount = sqlSessionTemplate.selectOne(namespace+"getCommentsCount",bb);
		return boardCommentsCount;
	}

	// ��� �ޱ�
	public int insertCommentsProc(BoardBean bb) {

		int cnt = 0;
		
		try {
			bb.setSubject("comments");
			sqlSessionTemplate.insert(namespace+"insertComments",bb);
			
		} catch (UncategorizedSQLException e) {
			cnt = 1;
		}
		
		return cnt;
	}

	public int updateCommentsProc(BoardBean bb) {
		
		int cnt = 0;
		try {
			sqlSessionTemplate.update(namespace+"updateCommentsProc",bb);
			
		} catch (UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
		
	}

	public int deleteCommentsProc(BoardBean bb) {
		int cnt = sqlSessionTemplate.delete(namespace+"deleteCommentsProc",bb);
		return cnt;
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+"getTotalCount", map);
		return cnt;
	}
	
	public int readcountUpdate(BoardBean bb) {
		int cnt = sqlSessionTemplate.update(namespace+"readcountUpdate", bb);
		return cnt;
	}
}