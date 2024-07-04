package kr.co.literal.readingroom;

import kr.co.literal.readingroom.dto.SeatDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SeatMapper {
    @Select("SELECT seat_code, branch_code, row, column, visible FROM seat WHERE branch_code = #{branch_code}")
    List<SeatDTO> selectSeatsByBranchCode(String branch_code);
}
