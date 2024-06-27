package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.ReadingRoomDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ReadingRoomDAO {
    List<ReadingRoomDTO> getAllReadingRooms();
    ReadingRoomDTO getReadingRoomById(String roomCode);
    void insertReadingRoom(ReadingRoomDTO readingRoom);
    void updateReadingRoom(ReadingRoomDTO readingRoom);
    void deleteReadingRoom(String roomCode);
}
