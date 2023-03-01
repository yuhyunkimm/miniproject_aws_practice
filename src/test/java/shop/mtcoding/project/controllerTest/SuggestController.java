package shop.mtcoding.project.controllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.sql.Timestamp;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestReqDto;
import shop.mtcoding.project.model.Comp;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class SuggestController {
    
    @Autowired
    private MockMvc mvc;

    @Autowired
    private ObjectMapper om;

    private MockHttpSession mockSession;

    @BeforeEach
    private void mockUserSession() {
        Comp mockcomp = new Comp(
            1,
            "kakao@kakao.com",
            "1234",
            "카카오(주)",
            "홍은택",
            "120-81-47521",
            "/images/kakao.png",
            "http://www.kakaocorp.com",
            new Timestamp(System.currentTimeMillis()));
        mockSession = new MockHttpSession();
        mockSession.setAttribute("principal", mockcomp);
    }

    @Test
    public void suggestJobs_test() throws Exception {
        // given
        SuggestReqDto sDto = new SuggestReqDto();
        sDto.setJobsId(1);
        sDto.setResumeId(1);
        sDto.setUserId(1);
        String json = om.writeValueAsString(sDto);
    
        // when
        ResultActions rs = mvc.perform(post("/suggest/jobs")
                              .content(json).contentType(MediaType.APPLICATION_JSON_VALUE).session(mockSession));
    
        // then
        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString()); 
    
    }
}
