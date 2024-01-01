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
import utility.InquiryPaging;
import utility.ManagerPaging;

@Component("myBoard")
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace = "board.";

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

		// �����Խ��� �Խñ� ��
		public int getCountFree(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace + "getCountFree", map);
			return cnt;
		}
		
		// ���İԽ��� �Խñ� ��
		public int getCountKnow(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace + "getCountKnow", map);
			return cnt;
		}
		
		// QnA�Խ��� �Խñ� ��
		public int getCountQnA(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace + "getCountQnA", map);
			return cnt;
		}
	
	// ����������Խ��� �Խñ� ��
	public int getCountGrad(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + "getCountGrad", map);
		return cnt;
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////

	
	
	// �Խñ� ���
	public int insertBoardContent(BoardBean bb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.insert(namespace + "insertBoardContent", bb);
		} catch (UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}
	
	// �Խñ� ����
	public int updateBoardContent(BoardBean updatebb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.update(namespace + "updateBoardContent", updatebb);
		} catch (UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}
	
	// �Խñ� ����
	public void deleteBoard(Map<String, Object> map) {
		sqlSessionTemplate.delete(namespace + "deleteBoard", map);
	}

	// �Խñ� �۾��� ���� ��������
	public BoardBean getBoardInfoWriter(MemberBean mb) {
		BoardBean bb = sqlSessionTemplate.selectOne(namespace + "getBoardInfoWriter", mb);
		return bb;
	}
	
	//b_num���� ��� ���� ��������
	public BoardBean getBoardInfoBnum(BoardBean bb) {
		BoardBean modelAttBor = sqlSessionTemplate.selectOne(namespace + "getBoardInfoBnum", bb);
		return modelAttBor;
	}
	
	//��ȸ�� +1
	public int readcountUpdate(BoardBean bb) {
		int cnt = sqlSessionTemplate.update(namespace + "readcountUpdate", bb);
		return cnt;
	}

	// ���� �ؿ��޸� ��� ����Ʈ��
	public List<BoardBean> getAllCommentsLists(BoardCommentsPaging pageInfo, Map<String, Integer> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BoardBean> numCommentsList = sqlSessionTemplate.selectList(namespace + "getAllCommentsLists", map, rowBounds);
		return numCommentsList;
	}

	// ���� �ؿ��޸� ��� ��
	public int getCommentCount(int ref) {
		int boardCommentsCount = sqlSessionTemplate.selectOne(namespace + "getCommentCount", ref);
		return boardCommentsCount;
	}

	// ��� �ޱ�
	public void insertComments(BoardBean bb) {
		sqlSessionTemplate.insert(namespace + "insertComments", bb);
	}
	
	// ���/��� ����
	public void updateComments(BoardBean bb) {
		sqlSessionTemplate.update(namespace + "updateComments", bb);
	}
	
	// ��� �޸� ������ ���� �Ʒ��� ���� ���� ���� �۾�1
	public int getLastRef2_Re_step(BoardBean bb) {
		int cnt = sqlSessionTemplate.selectOne(namespace + "getLastRef2_Re_step", bb);
		return cnt;
	}

	// ��� �޸� ������ ���� �Ʒ��� ���� ���� ���� �۾�2
	public void updateReply(BoardBean bb) {
		sqlSessionTemplate.update(namespace + "updateReply", bb);
	}

	// ��� �ޱ�
	public void insertReply(BoardBean bb) {
		sqlSessionTemplate.insert(namespace + "insertReply", bb);
	}
	
	// ��õ�ϱ�
	public void updateAdopt(String b_num2) {
		sqlSessionTemplate.update(namespace + "updateAdopt", b_num2);
	}
	
	// ��� ����
	public void deleteComments(BoardBean bb) {
		sqlSessionTemplate.delete(namespace + "deleteComments", bb);
	}
	
	// ���� ����
	public void deleteReply(BoardBean bb) {
		sqlSessionTemplate.delete(namespace + "deleteReply", bb);
	}
	
	// ��ȸ�� ���� �Խñ�
	public List<BoardBean> getHotBoard() {
		List<BoardBean> list = sqlSessionTemplate.selectList(namespace + "getHotBoard");
		return list;
	}
	
	public int getInquiryCount(Map<String, String> map, String board) {
		map.put("board", board);
        int cnt = sqlSessionTemplate.selectOne(namespace + "getInquiryCount", map);
        
        return cnt;
	}
	
	public List<BoardBean> getAllInquiry(InquiryPaging pageInfo,Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> free_board_list = sqlSessionTemplate.selectList(namespace+"getAllInquiry", map,rowBounds);
		
	    return free_board_list;
	}

	public void insertInquiry(BoardBean bb) {
		
		sqlSessionTemplate.insert(namespace+"insertInquiry",bb);
	}

	public BoardBean getInquiryDetail(int b_num) {
		BoardBean bd = sqlSessionTemplate.selectOne(namespace+"getInquiryDetail",b_num);
		return bd;
	}

	public void deleteInquiry(int b_num) {
		sqlSessionTemplate.delete(namespace+"deleteInquiry",b_num);
	}

	public void updateInquiry(BoardBean bb) {
		sqlSessionTemplate.update(namespace+"updateInquiry",bb);
	}
	
	public int selectAndDelteBoard(BoardBean bb) {
		int checkDelete = sqlSessionTemplate.delete(namespace+"selectAndDelteBoard",bb);
		return checkDelete;
	}
	
	public void deleteBoardContent(BoardBean bb) {
		sqlSessionTemplate.delete(namespace+"deleteBoardContent",bb);
	}
	
	public List<BoardBean> selectMagAllFree(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectMagAllFree",map,rowBounds);
		return board_cateList;
	}
	
	// (������)���İԽ��� ����¡ó�� �˻�
	public List<BoardBean> selectMagAllKnow(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectMagAllKnow",map,rowBounds);
		return board_cateList;
	}
	
	// (������)QnA�Խ��� ����¡ó�� �˻�
	public List<BoardBean> selectMagAllQnA(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectMagAllQnA",map,rowBounds);
		return board_cateList;
	}
	
	public int getBoardCount(Map<String, String> map, String board) {
		map.put("board", board);
		System.out.println("board:"+board);
        int cnt = sqlSessionTemplate.selectOne(namespace + "getBoardCount", map);
        return cnt;
	}
	
	// (������)������Խ��� ����¡ó�� �˻�
	public List<BoardBean> selectMagAllGrad(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectMagAllGrad",map,rowBounds);
		return board_cateList;
	}												

	// (������)�����Խ��� ����¡ó�� ����
	public int getMagCountFree(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountFree",map);
		return boardMagCateCount;
	}
	
	// (������)���İԽ��� ����¡ó�� ����
	public int getMagCountKnow(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountKnow",map);
		return boardMagCateCount;
	}
	
	// (������)QnA�Խ��� ����¡ó�� ����
	public int getMagCountQnA(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountQnA",map);
		return boardMagCateCount;
	}
	
	// (������)������Խ��� ����¡ó�� ����
	public int getMagCountGrad(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountGrad",map);
		return boardMagCateCount;
	}

}
