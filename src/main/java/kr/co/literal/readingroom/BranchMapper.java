package kr.co.literal.readingroom;

import kr.co.literal.readingroom.dto.BranchDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BranchMapper {
    List<BranchDTO> selectAllBranches();
    BranchDTO selectBranchByCode(String branch_code);
    void insertBranch(BranchDTO branch);
}
