package kr.co.literal.readingroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.co.literal.readingroom.dto.BranchDTO;

@Mapper
public interface BranchDAO {

    @Insert("INSERT INTO branch (branch_code, branch_name, branch_email, branch_pw, branch_detail, branch_address, latitude, longitude) " +
            "VALUES (#{branchCode}, #{branchName}, #{branchEmail}, #{branchPw}, #{branchDetail}, #{branchAddress}, #{latitude}, #{longitude})")
    void insertBranch(BranchDTO branch);

    @Select("SELECT * FROM branch WHERE branch_code = #{branchCode}")
    BranchDTO selectBranchByCode(String branchCode);

    @Select("SELECT * FROM branch")
    List<BranchDTO> selectAllBranches();
}
