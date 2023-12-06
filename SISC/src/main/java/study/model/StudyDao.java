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
	
	public void insertMemo(String editorTxt) {
		sqlSessionTemplate.insert(namespace+".insertMemo", editorTxt);
	}

	public List<StudyBean> getAllMemo() {
		List<StudyBean> list = new ArrayList<StudyBean>();
		
		list = sqlSessionTemplate.selectList(namespace+".getAllMemo"); 
		return list;
	}
	
}
