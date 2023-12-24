package study.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

import board.model.BoardBean;
import book.model.BookBean;
import utility.BoardPaging;
import utility.BookPaging;
import utility.StudyPaging;

@Component("myStudy")
public class StudyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="study.";
	
	public void insertStudy(StudyBean st) {
		sqlSessionTemplate.insert(namespace+"insertStudy", st);
	}
	
	public List<StudyBean> getAllStudy(StudyPaging pageInfo, Map<String, String> map, String id) {
		List<StudyBean> list = new ArrayList<StudyBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		map.put("id", id);
		
		list = sqlSessionTemplate.selectList(namespace+"getAllStudy", map,rowbounds); 
		return list;
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+"getTotalCount", map);
		return cnt;
	}
	
	public StudyBean getDetailStudy(int s_num) {
		StudyBean sb = sqlSessionTemplate.selectOne(namespace+"getDetailStudy", s_num); 
		
		return sb;
	}

	public void deleteStudy(int s_num) {
		sqlSessionTemplate.delete(namespace+"deleteStudy", s_num); 
	}

	public int updateStudy(StudyBean sb) {
		int cnt = sqlSessionTemplate.update(namespace+"updateStudy", sb);
		return cnt;
	}
	public int getTotalCountForSpecificMember(Map<String, String> map, String id) {
        map.put("id", id);
        int cnt = sqlSessionTemplate.selectOne(namespace + "getTotalCountForSpecificMember", map);
        return cnt;
    }

	public List<BoardBean> getMyBoard(BoardPaging pageInfo, Map<String, String> map, String writer) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		map.put("writer", writer);
		
		list = sqlSessionTemplate.selectList(namespace+"getMyBoard", map,rowbounds); 
		return list;
	}
	
	public List<BoardBean> getMyComment(BoardPaging pageInfo, Map<String, String> map, String writer) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		map.put("writer", writer);
		
		list = sqlSessionTemplate.selectList(namespace+"getMyComment", map,rowbounds); 
		return list;
	}

	public int getTotalCountComment(Map<String, String> map, String id) {
		map.put("writer", id);
        int cnt = sqlSessionTemplate.selectOne(namespace + "getTotalCountComment", map);
        System.out.println("cnt:" + cnt);
        return cnt;
	}

	public List<BookBean> getMyBook(BookPaging pageInfo, Map<String, String> map, String writer) {
		List<BookBean> list = new ArrayList<BookBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		map.put("writer", writer);
		
		list = sqlSessionTemplate.selectList(namespace+"getMyBook", map,rowbounds); 
		return list;
	}
	
	public int getTotalCountBook(Map<String, String> map, String id) {
		map.put("writer", id);
        int cnt = sqlSessionTemplate.selectOne(namespace + "getTotalCountBook", map);
        System.out.println("cnt:" + cnt);
        return cnt;
	}
}