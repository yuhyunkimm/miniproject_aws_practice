package shop.mtcoding.project.controllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.transaction.annotation.Transactional;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class UserControllerTest {

    @Autowired
    private MockMvc mvc;

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

    // private Integer userId; // X
    // private String email;
    // private String password;
    // private String name;
    // private String birth;
    // private String tel;
    // private String Address; // Form에 없다
    // private Timestamp createdAt; // X
}
