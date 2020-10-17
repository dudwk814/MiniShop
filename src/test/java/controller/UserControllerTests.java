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
import service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/dispatcher-servlet.xml"})
@Log4j
public class UserControllerTests {

    @Setter(onMethod_ = {@Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    // 회원 가입 테스트
    @Test
    public void testRegister() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/join")
                .param("user_id", "qwer")
                .param("user_name", "손인욱")
                .param("user_pw", "1234")
                .param("user_pw2", "1234")
                .param("address", "김해")).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    // 단일 회원 조회 테스트
    @Test
    public void TestGetUser() throws Exception {

        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/login")
            .param("user_id", "admin").param("user_pw", "admin")).andReturn().getModelAndView().getViewName();
    }




}
