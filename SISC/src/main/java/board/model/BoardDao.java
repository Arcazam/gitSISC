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

	// (메인화면)자유게시판
	   public List<BoardBean> getAllFreeBoard(Map<String, String> map) {
	      List<BoardBean> free_board_list = sqlSessionTemplate.selectList(namespace+"getAllFreeBoard", map);
	      return free_board_list;
	   }

	   // (메인화면)qna게시판
	   public List<BoardBean> getAllKnowBoard(Map<String, String> map) {
	      List<BoardBean> know_board_list = sqlSessionTemplate.selectList(namespace+"getAllKnowBoard", map);
	      return know_board_list;
	   }

	   // (메인화면)qna게시판
	   public List<BoardBean> getAllQnABoard(Map<String, String> map) {
	      List<BoardBean> qna_board_list = sqlSessionTemplate.selectList(namespace+"getAllQnABoard", map);
	      return qna_board_list;
	   }

	   // (메인화면)수료생게시판
	   public List<BoardBean> getAllGradBoard(Map<String, String> map) {
	      List<BoardBean> grad_board_list = sqlSessionTemplate.selectList(namespace+"getAllGradBoard", map);
	      return grad_board_list;
	   }

		// 자유게시판 게시글 수
		public int getCountFree(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace + "getCountFree", map);
			return cnt;
		}
		
		// 지식게시판 게시글 수
		public int getCountKnow(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace + "getCountKnow", map);
			return cnt;
		}
		
		// QnA게시판 게시글 수
		public int getCountQnA(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace + "getCountQnA", map);
			return cnt;
		}
	
	// 수료생자유게시판 게시글 수
	public int getCountGrad(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + "getCountGrad", map);
		return cnt;
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////

	
	
	// 게시글 등록
	public int insertBoardContent(BoardBean bb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.insert(namespace + "insertBoardContent", bb);
		} catch (UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}
	
	// 게시글 수정
	public int updateBoardContent(BoardBean updatebb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.update(namespace + "updateBoardContent", updatebb);
		} catch (UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}
	
	// 게시글 삭제
	public void deleteBoard(Map<String, Object> map) {
		sqlSessionTemplate.delete(namespace + "deleteBoard", map);
	}

	// 게시글 글쓴이 정보 가져오기
	public BoardBean getBoardInfoWriter(MemberBean mb) {
		BoardBean bb = sqlSessionTemplate.selectOne(namespace + "getBoardInfoWriter", mb);
		return bb;
	}
	
	//b_num으로 모든 정보 가져오기
	public BoardBean getBoardInfoBnum(BoardBean bb) {
		BoardBean modelAttBor = sqlSessionTemplate.selectOne(namespace + "getBoardInfoBnum", bb);
		return modelAttBor;
	}
	
	//조회수 +1
	public int readcountUpdate(BoardBean bb) {
		int cnt = sqlSessionTemplate.update(namespace + "readcountUpdate", bb);
		return cnt;
	}

	// 원글 밑에달릴 댓글 리스트들
	public List<BoardBean> getAllCommentsLists(BoardCommentsPaging pageInfo, Map<String, Integer> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BoardBean> numCommentsList = sqlSessionTemplate.selectList(namespace + "getAllCommentsLists", map, rowBounds);
		return numCommentsList;
	}

	// 원글 밑에달릴 댓글 수
	public int getCommentCount(int ref) {
		int boardCommentsCount = sqlSessionTemplate.selectOne(namespace + "getCommentCount", ref);
		return boardCommentsCount;
	}

	// 댓글 달기
	public void insertComments(BoardBean bb) {
		sqlSessionTemplate.insert(namespace + "insertComments", bb);
	}
	
	// 댓글/답글 수정
	public void updateComments(BoardBean bb) {
		sqlSessionTemplate.update(namespace + "updateComments", bb);
	}
	
	// 답글 달면 원글의 가장 아래로 가게 위한 수정 작업1
	public int getLastRef2_Re_step(BoardBean bb) {
		int cnt = sqlSessionTemplate.selectOne(namespace + "getLastRef2_Re_step", bb);
		return cnt;
	}

	// 답글 달면 원글의 가장 아래로 가게 위한 수정 작업2
	public void updateReply(BoardBean bb) {
		sqlSessionTemplate.update(namespace + "updateReply", bb);
	}

	// 답글 달기
	public void insertReply(BoardBean bb) {
		sqlSessionTemplate.insert(namespace + "insertReply", bb);
	}
	
	// 추천하기
	public void updateAdopt(String b_num2) {
		sqlSessionTemplate.update(namespace + "updateAdopt", b_num2);
	}
	
	// 댓글 삭제
	public void deleteComments(BoardBean bb) {
		sqlSessionTemplate.delete(namespace + "deleteComments", bb);
	}
	
	// 대댓글 삭제
	public void deleteReply(BoardBean bb) {
		sqlSessionTemplate.delete(namespace + "deleteReply", bb);
	}
	
	// 조회수 높은 게시글
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
	
	// (관리자)지식게시판 페이징처리 검색
	public List<BoardBean> selectMagAllKnow(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectMagAllKnow",map,rowBounds);
		return board_cateList;
	}
	
	// (관리자)QnA게시판 페이징처리 검색
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
	
	// (관리자)수료생게시판 페이징처리 검색
	public List<BoardBean> selectMagAllGrad(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectMagAllGrad",map,rowBounds);
		return board_cateList;
	}												

	// (관리자)자유게시판 페이징처리 갯수
	public int getMagCountFree(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountFree",map);
		return boardMagCateCount;
	}
	
	// (관리자)지식게시판 페이징처리 갯수
	public int getMagCountKnow(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountKnow",map);
		return boardMagCateCount;
	}
	
	// (관리자)QnA게시판 페이징처리 갯수
	public int getMagCountQnA(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountQnA",map);
		return boardMagCateCount;
	}
	
	// (관리자)수료생게시판 페이징처리 갯수
	public int getMagCountGrad(Map<String, String> map) {
		int boardMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagCountGrad",map);
		return boardMagCateCount;
	}

}
