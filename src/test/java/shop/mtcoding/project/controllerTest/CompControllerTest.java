package shop.mtcoding.project.controllerTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.model.Comp;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class CompControllerTest {

    @Autowired
    private MockMvc mvc;

    @Test
    @Transactional
    public void join_test() throws Exception {
        // given
        String requestBody = "email=2kakao@nate.com&password=1234&compName=카카오(주)&representativeName=홍은택&businessNumber=120-81-47521";

        // when
        ResultActions resultActions = mvc.perform(post("/comp/join").content(requestBody)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));

        // then
        resultActions.andExpect(status().is3xxRedirection());
    }

    @Test
    public void login_test() throws Exception {
        // given
        String requestBody = "email=kakao@nate.com&password=1234";

        // when
        ResultActions resultActions = mvc.perform(post("/comp/login").content(requestBody)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));

        HttpSession session = resultActions.andReturn().getRequest().getSession();
        Comp principal = (Comp) session.getAttribute("compSession");

        // then
        assertThat(principal.getEmail()).isEqualTo("kakao@nate.com");
        assertThat(principal.getPassword()).isEqualTo("1234");
        resultActions.andExpect(status().is3xxRedirection());
    }

}
