package board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myTag")
public class TagDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="tag.";

	public int findTag(TagBean tb) {
		int findtag = sqlSessionTemplate.selectOne(namespace+"findTag",tb);
		return findtag;
	}

	public void plusOneCntTagValues(TagBean tb) {
		sqlSessionTemplate.update(namespace+"plusOneCntTagValues",tb);
	} 
 
	public void plusTagValues(TagBean tb) {
		sqlSessionTemplate.insert(namespace+"plusTagValues",tb);
	}
	
	public List<TagBean> getRank() {
		List<TagBean> list = sqlSessionTemplate.selectList(namespace + "getRank");
		return list;
	}
	
}