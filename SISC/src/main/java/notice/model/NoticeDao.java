package notice.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("myNotice")
public class NoticeDao {

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   
   private String namespace="notice.";
   
   public int insertNotice(NoticeBean nb) {
		int cnt = sqlSessionTemplate.insert(namespace+"insertNotice", nb);
		return cnt;
	}
}