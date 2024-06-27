package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.UseTimeDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface UseTimeDAO {
    List<UseTimeDTO> getAllUseTimes();
    UseTimeDTO getUseTimeById(String timeCode);
    void insertUseTime(UseTimeDTO useTime);
    void updateUseTime(UseTimeDTO useTime);
    void deleteUseTime(String timeCode);
}
