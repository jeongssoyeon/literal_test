package kr.co.literal.readingroom.dao;

import kr.co.literal.readingroom.dto.MyCouponDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class MyCouponDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "kr.co.literal.readingroom.ReadingRoomMapper";

    public List<MyCouponDTO> getAllMyCoupons() {
        return sqlSession.selectList(NAMESPACE + ".getAllMyCoupons");
    }

    public MyCouponDTO getMyCouponById(String mycoupon_number) {
        return sqlSession.selectOne(NAMESPACE + ".getMyCouponByNumber", mycoupon_number);
    }

    public void insertMyCoupon(MyCouponDTO myCoupon) {
        sqlSession.insert(NAMESPACE + ".insertMyCoupon", myCoupon);
    }

    public void updateMyCoupon(MyCouponDTO myCoupon) {
        sqlSession.update(NAMESPACE + ".updateMyCoupon", myCoupon);
    }

    public void deleteMyCoupon(String mycoupon_number) {
        sqlSession.delete(NAMESPACE + ".deleteMyCoupon", mycoupon_number);
    }
}