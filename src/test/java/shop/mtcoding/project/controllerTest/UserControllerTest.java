package shop.mtcoding.project.controllerTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.user.UserReq.UserUpdateReqDto;
import shop.mtcoding.project.model.User;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class UserControllerTest {

    @Autowired
    private MockMvc mvc;

    private MockHttpSession mockSession;

    @Autowired
    private ObjectMapper om;

    @BeforeEach
    private void mockUserSession() {
        User mockUser = new User(
                1,
                "ssar@nate.com",
                "1234",
                "ssar",
                "2000-01-01",
                "010-1234-1234",
                "/images/default_profile.png",
                "부산시 부산진구",
                new Timestamp(System.currentTimeMillis()));
        mockSession = new MockHttpSession();
        mockSession.setAttribute("principal", mockUser);
    }

    @Test
    @Transactional
    public void update_test() throws Exception {
        // given

        UserUpdateReqDto userUpdateReqDto = new UserUpdateReqDto();
        userUpdateReqDto.setUserId(1);
        userUpdateReqDto.setName("dddd");
        userUpdateReqDto.setPassword("1111");
        userUpdateReqDto.setBirth("22222-1111");
        userUpdateReqDto.setTel("010-1111");
        userUpdateReqDto.setAddress("dfsfsdf");
        String requestBody = om.writeValueAsString(userUpdateReqDto);

        UserUpdateReqDto uDto = new UserUpdateReqDto();
        uDto.setPassword("1234");
        uDto.setName("ssar");
        uDto.setBirth("2000-01-01");
        uDto.setTel("010-1234-1234");
        uDto.setAddress("부산시 부산진구");

        // when
        ResultActions resultActions = mvc.perform(
                put("/user/update")
                        .content(requestBody)
                        .contentType(MediaType.APPLICATION_JSON_VALUE)
                        .session(mockSession));
        String responseBody = resultActions.andReturn().getResponse().getContentAsString();
        System.out.println("테스트 : " + responseBody);

        // then
        resultActions.andExpect(status().isOk());
        resultActions.andExpect(jsonPath("$.code").value(1));
    }

    @Test
    @Transactional
    public void join_test() throws Exception {
        // given
        String requestBody = "email=love@nate.com&password=1234&name=쌀&birth=11111&tel=11111&Address=busan";

        // when
        ResultActions resultActions = mvc.perform(post("/user/join").content(requestBody)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));

        // then
        resultActions.andExpect(status().is3xxRedirection());
    }

    @Test
    @Transactional
    public void login_test() throws Exception {
        // given
        String requestBody = "email=ssar@nate.com&password=1234";

        // when
        ResultActions resultActions = mvc.perform(post("/user/login").content(requestBody)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));

        HttpSession session = resultActions.andReturn().getRequest().getSession();
        User principal = (User) session.getAttribute("principal");

        // then
        assertThat(principal.getEmail()).isEqualTo("ssar@nate.com");
        resultActions.andExpect(status().is3xxRedirection());
    }

}
