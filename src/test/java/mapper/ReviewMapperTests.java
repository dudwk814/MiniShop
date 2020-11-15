package mapper;

import domain.Criteria;
import domain.ReviewVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class ReviewMapperTests {

    @Setter(onMethod_ = @Autowired)
    private ReviewMapper reviewMapper;

    // mapper 주입 테스트
    @Test
    public void testMapper() {

        log.info(reviewMapper);
    }

    // 리뷰 작성 테스트
    @Test
    public void testInsert() {

        ReviewVO vo = new ReviewVO();
        vo.setProduct_id(1);
        vo.setUserid("qwer");
        vo.setReview_content("리뷰 테스트 내용");
        vo.setReview_title("리뷰 테스트 제목");

        reviewMapper.insert(vo);
    }

    // 리뷰 조회 테스트
    @Test
    public void testRead() {

        int review_no = 2;

        log.info(reviewMapper.read(review_no));
    }

    // product_id에 해당하는 리뷰 리스트 조회 테스트
    @Test
    public void testGetListForProduct_id() {

        int product_id = 1;

        log.info(reviewMapper.getList(product_id));
    }

    // product_id에 해당하는 리뷰 리스트 조회 테스트(페이징 처리)
    @Test
    public void testGetListWithPaging() {
        Criteria cri = new Criteria();

        int product_id = 1;

        List<ReviewVO> listWithPaging = reviewMapper.getListWithPaging(cri, product_id);

        listWithPaging.forEach(vo -> log.info(vo));
    }

    // 리뷰 수정 테스트
    @Test
    public void testModify() {

        ReviewVO vo = reviewMapper.read(2);

        vo.setReview_title("리뷰 테스트 제목2");
        vo.setReview_content("리뷰 테스트 내용2");

        reviewMapper.modify(vo);
    }

    // 리뷰 삭제 테스트
    @Test
    public void testDelete() {

        int review_no = 2;

        reviewMapper.delete(review_no);
    }
}
