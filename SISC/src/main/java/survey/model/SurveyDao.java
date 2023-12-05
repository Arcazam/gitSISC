package survey.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mySurvey")
public class SurveyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="survey.";
	
}
