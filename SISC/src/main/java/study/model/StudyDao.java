package study.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.BoardPaging;

@Component("myStudy")
public class StudyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="study.";
	
	public void insertStudy(StudyBean st) {
		sqlSessionTemplate.insert(namespace+"insertStudy", st);
	}

	public List<StudyBean> getAllStudy(BoardPaging pageInfo, Map<String, String> map) {
		List<StudyBean> list = new ArrayList<StudyBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
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

}