package controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/dispatcher-servlet.xml"})
@Log4j
public class BoardControllerTests {

    @Setter(onMethod_ = {@Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    // 전체 게시글 조회 테스트
    @Test
    public void testBoardList() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
            .andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    // 단일 게시물 조회 테스트b
    @Test
    public void testBoard() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/board/read")
                        .param("bno", "10")).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    // 게시글 작성 테스트
    @Test
    public void testRegister() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
                .param("title", "test")
                .param("content", "test")
                .param("writer", "tester")).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    // 게시글 수정 테스트
    @Test
    public void testModify() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
            .param("bno", "13")
            .param("title", "testTitle")
            .param("content", "testContent")).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    // 게시글 삭제 테스트
    @Test
    public void testRemove() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
            .param("bno", "13")).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }
}
