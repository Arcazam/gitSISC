package survey.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.ManagerPaging;

@Component("mySurvey")
public class SurveyDao {

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   
   private String namespace="survey.";

   public void insertSurvey(SurveyBean su) {
      sqlSessionTemplate.insert(namespace+"insertStudy", su);
   }

   public void getAllSurvey() {
      sqlSessionTemplate.selectList(namespace+"getAllSurvey");
   }

	public int getMagSurveyCount(Map<String, String> map) {
		int surveyMagCateCount = sqlSessionTemplate.selectOne(namespace+"getMagSurveyCount",map);
		return surveyMagCateCount;
	}

	public List<SurveyBean> getAllMagSurvey(ManagerPaging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<SurveyBean> slist = sqlSessionTemplate.selectList(namespace+"getAllMagSurvey",map,rowBounds);
		return slist;
	}
   
}