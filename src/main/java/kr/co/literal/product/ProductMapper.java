package kr.co.literal.product;

import org.apache.ibatis.annotations.Mapper;
import java.util.Map;

@Mapper
public interface ProductMapper {
    void insert(Map<String, Object> map);
    int generateBookCode(String genreCode);
    int getNextBookNumber(Map<String, String> params);
}
