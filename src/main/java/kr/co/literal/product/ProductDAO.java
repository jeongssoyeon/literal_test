package kr.co.literal.product;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	public ProductDAO()
	{
		System.out.println("----- ProductDAO() 객체 생성");
	} // public ProductDAO() end
	
	@Autowired
	SqlSession sqlSession;

	public void insert(Map<String, Object> map)
	{
		sqlSession.insert("kr.co.literal.product.ProductMapper.insert", map);
	} // public void insert end

    public int generateBookCode(String genreCode) {
        return sqlSession.selectOne("kr.co.literal.product.ProductMapper.generateBookCode", genreCode);
    } // public int generateBookCode() end

    public int getNextBookNumber(String genreCode, String bookCode) {
        return sqlSession.selectOne("kr.co.literal.product.ProductMapper.getNextBookNumber", Map.of("genreCode", genreCode, "bookCode", bookCode));
    }
	
} // public class ProductDAO end
