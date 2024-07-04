package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.ReadingRoomDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ReadingRoomDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "kr.co.literal.readingroom.ReadingRoomMapper";

    public List<ReadingRoomDTO> getAllReadingRooms() {
        return sqlSession.selectList(NAMESPACE + ".getAllReadingRooms");
    }

    public ReadingRoomDTO getReadingRoomById(String room_code) {
        return sqlSession.selectOne(NAMESPACE + ".getReadingRoomByCode", room_code);
    }

    public void insertReadingRoom(ReadingRoomDTO readingRoom) {
        sqlSession.insert(NAMESPACE + ".insertReadingRoom", readingRoom);
    }

    public void updateReadingRoom(ReadingRoomDTO readingRoom) {
        sqlSession.update(NAMESPACE + ".updateReadingRoom", readingRoom);
    }

    public void deleteReadingRoom(String room_code) {
        sqlSession.delete(NAMESPACE + ".deleteReadingRoom", room_code);
    }
}
