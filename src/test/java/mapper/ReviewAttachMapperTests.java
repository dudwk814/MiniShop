package mapper;

import domain.ReviewAttachVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class ReviewAttachMapperTests {

    @Setter(onMethod_ = @Autowired)
    private ReviewAttachMapper reviewAttachMapper;

    /**
     * 리뷰 이미지 삭제 테스트
     */
    @Test
    public void reviewImageRemove() throws Exception {
        //given
        int review_no = 107;

        //when
        reviewAttachMapper.delete(review_no);

        List<ReviewAttachVO> result = reviewAttachMapper.findByReviewNo(review_no);

        //then

        Assert.assertEquals(result.size(), 0L);
    }

    /**
     * 데이터베이스에 없는 이미지 검색
     */
    @Test
    public void searchDBImage() throws Exception {

        log.info(reviewAttachMapper.getOldFiles());
    }

}
