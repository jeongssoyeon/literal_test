package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.BranchMapper;
import kr.co.literal.readingroom.dto.BranchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BranchDAO {

    @Autowired
    private BranchMapper branchMapper;

    public List<BranchDTO> selectAllBranches() {
        return branchMapper.selectAllBranches();
    }

    public BranchDTO selectBranchByCode(String code) {
        return branchMapper.selectBranchByCode(code);
    }

    public void insertBranch(BranchDTO branch) {
        branchMapper.insertBranch(branch);
    }
}
