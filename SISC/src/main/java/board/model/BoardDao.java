package board.model;

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
import utility.ManagerPaging;

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

   // 자유게시판 페이징처리 검색
	public List<BoardBean> selectFreeDetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectFreeDetailCate",map,rowBounds);
		return board_cateList;	
	}
	
	// 지식게시판 페이징처리 검색
	public List<BoardBean> selectKnowDetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectKnowDetailCate",map,rowBounds);
		return board_cateList;	
	}
	
	// QnA게시판 페이징처리 검색
	public List<BoardBean> selectQnADetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectQnADetailCate",map,rowBounds);
		return board_cateList;	
	}
	
	// 수료생게시판 페이징처리 검색
	public List<BoardBean> selectGradDetailCate(BoardPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectGradDetailCate",map,rowBounds);
		return board_cateList;	
	}
	
		// 자유게시판 페이징처리 검색
		public List<BoardBean> selectFreeDetailCate(ManagerPaging pageInfo, Map<String, String> map) {
			RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
			List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectFreeDetailCate",map,rowBounds);
			return board_cateList;	
		}
		
		// 지식게시판 페이징처리 검색
		public List<BoardBean> selectKnowDetailCate(ManagerPaging pageInfo, Map<String, String> map) {
			RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
			List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectKnowDetailCate",map,rowBounds);
			return board_cateList;	
		}
		
		// QnA게시판 페이징처리 검색
		public List<BoardBean> selectQnADetailCate(ManagerPaging pageInfo, Map<String, String> map) {
			RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
			List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectQnADetailCate",map,rowBounds);
			return board_cateList;	
		}
		
		// 수료생게시판 페이징처리 검색
		public List<BoardBean> selectGradDetailCate(ManagerPaging pageInfo, Map<String, String> map) {
			RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
			List<BoardBean> board_cateList = sqlSessionTemplate.selectList(namespace+"selectGradDetailCate",map,rowBounds);
			return board_cateList;	
		}

	// 게시판 삽입 작업
	public int insertBoardContent(BoardBean bb) {
		int cnt = 0;
		try {
			sqlSessionTemplate.insert(namespace+"insertBoardContent",bb);			
		} catch(UncategorizedSQLException e) {
			cnt = 1;
		}
		return cnt;
	}

	// 게시판 글쓴이 정보 가져오기
	public BoardBean getBoardInfoWriter(MemberBean mb) {
		BoardBean bb = sqlSessionTemplate.selectOne(namespace+"getBoardInfoWriter",mb);
		return bb;
	}

	// 게시판 수정 작업
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

	// 원글 밑에달릴 댓글 리스트들
	public List<BoardBean> getAllCommentsLists(BoardCommentsPaging pageInfo, BoardBean bb) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("ref", bb.getRef());
		List<BoardBean> numCommentsList = sqlSessionTemplate.selectList(namespace+"getAllCommentsLists",map,rowBounds);
		return numCommentsList;
	}
	
	// 원글 밑에달릴 댓글 수
	public int getCommentsCount(BoardBean bb) {
		int boardCommentsCount = sqlSessionTemplate.selectOne(namespace+"getCommentsCount",bb);
		return boardCommentsCount;
	}

	// 댓글 달기
	public int insertCommentsProc(BoardBean bb) {

		int cnt = 0;
		
		try {
			
			sqlSessionTemplate.update(namespace+"findStep",bb);
			
			bb.setSubject("comments");
			bb.setRe_step(bb.getRe_step()+1);
			bb.setRe_level(bb.getRe_level()+1);
			
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

	public void deleteCommentsProc(BoardBean bb) {
		sqlSessionTemplate.delete(namespace+"deleteCommentsProc",bb);
	}

}