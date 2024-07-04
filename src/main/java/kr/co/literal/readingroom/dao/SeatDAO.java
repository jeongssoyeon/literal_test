package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.SeatMapper;
import kr.co.literal.readingroom.dto.SeatDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SeatDAO {

    @Autowired
    private SeatMapper seatMapper;

    public List<SeatDTO> selectSeatsByBranchCode(String branch_code) {
        return seatMapper.selectSeatsByBranchCode(branch_code);
    }
}
