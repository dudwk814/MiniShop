package service;

import domain.Criteria;
import domain.ReviewPageDTO;
import domain.ReviewVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class ReviewServiceTests {

    @Setter(onMethod_ = @Autowired)
    private ReviewService reviewService;

    /**
     * 리뷰 목록 조회 테스트
     */
    @Test
    public void reviewListTest() {


        ReviewPageDTO list = reviewService.getList(new Criteria(), 6);

        List<ReviewVO> list1 = list.getList();

        Assert.assertEquals("list의 사이즈는 : ", list1.size(), 3);

    }

    /**
     * 리뷰 조회 테스트
     */
    @Test
    public void reviewReadTest() {
        ReviewVO reviewVO = reviewService.get(114);

        for (int i = 0; i < reviewVO.getAttachList().size(); i++) {
            System.out.println("getAttach = " + reviewVO.getAttachList().get(i));
        }
    }
}
