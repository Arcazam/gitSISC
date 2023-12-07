package study.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myStudy")
public class StudyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="study.";
	
	public void insertStudy(StudyBean st) {
		sqlSessionTemplate.insert(namespace+"insertStudy", st);
	}

	public List<StudyBean> getAllStudy() {
		List<StudyBean> list = new ArrayList<StudyBean>();
		
		list = sqlSessionTemplate.selectList(namespace+"getAllStudy"); 
		return list;
	}

	public StudyBean getDetailStudy(int s_num) {
		StudyBean sb = sqlSessionTemplate.selectOne(namespace+"getDetailStudy", s_num); 
		
		return sb;
	}

	public void deleteStudy(int s_num) {
		sqlSessionTemplate.delete(namespace+"deleteStudy", s_num); 
	}
}