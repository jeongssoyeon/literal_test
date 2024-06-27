package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.MyCouponDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MyCouponDAO {
    List<MyCouponDTO> getAllMyCoupons();
    MyCouponDTO getMyCouponById(String myCouponNumber);
    void insertMyCoupon(MyCouponDTO myCoupon);
    void updateMyCoupon(MyCouponDTO myCoupon);
    void deleteMyCoupon(String myCouponNumber);
}
