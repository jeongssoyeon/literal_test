package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.SeatDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface SeatDAO {
    List<SeatDTO> getAllSeats();
    SeatDTO getSeatById(String seatCode);
    void insertSeat(SeatDTO seat);
    void updateSeat(SeatDTO seat);
    void deleteSeat(String seatCode);
}
