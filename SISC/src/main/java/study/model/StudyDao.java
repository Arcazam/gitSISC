package study.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myStudy")
public class StudyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="study.";
	
}
