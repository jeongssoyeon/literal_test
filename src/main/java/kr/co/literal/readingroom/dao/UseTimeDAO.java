package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.UseTimeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class UseTimeDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "kr.co.literal.readingroom.ReadingRoomMapper";

    public List<UseTimeDTO> getAllUseTimes() {
        return sqlSession.selectList(NAMESPACE + ".getAllUseTimes");
    }

    public UseTimeDTO getUseTimeByCode(String time_code) {
        return sqlSession.selectOne(NAMESPACE + ".getUseTimeByCode", time_code);
    }

    public void insertUseTime(UseTimeDTO useTime) {
        sqlSession.insert(NAMESPACE + ".insertUseTime", useTime);
    }

    public void updateUseTime(UseTimeDTO useTime) {
        sqlSession.update(NAMESPACE + ".updateUseTime", useTime);
    }

    public void deleteUseTime(String time_code) {
        sqlSession.delete(NAMESPACE + ".deleteUseTime", time_code);
    }
}
