package shop.mtcoding.project.controllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.sql.Timestamp;
import java.util.List;

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

import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.model.Comp;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class JobsControllerTest {
  
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
            "1577-3321",
            "/images/kakao.png",
            3600,
            "1995-02-16",
            "http://www.kakaocorp.com",
            new Timestamp(System.currentTimeMillis()));
            mockSession = new MockHttpSession();
            mockSession.setAttribute("compSession", mockcomp);
    }
    
    @Test
    public void 공고작성_test() throws Exception {
        // given
        JobsWriteReqDto jDto = new JobsWriteReqDto();
        jDto.setJobsId(1);
        jDto.setSkill(List.of("123", "123", "123"));
        jDto.setAddress("123");
        jDto.setTitle("123");
        jDto.setContent("123");
        jDto.setPhoto("123");
        jDto.setPosition("123");
        jDto.setEducation("123");
        jDto.setEndDate(new Timestamp(System.currentTimeMillis()));
        jDto.setCareer("123");
        jDto.setCompId(1);
        jDto.setHomepage("123");
        jDto.setReceipt("123");
        jDto.setCompName("1234");
        jDto.setRepresentativeName("1234");
        String test = om.writeValueAsString(jDto);

        // when
        ResultActions rs = mvc.perform(post("/jobs/write")
        .content(test)
        .contentType(MediaType.APPLICATION_JSON_VALUE).session(mockSession));

        // then
        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString());
    
    }
    @Test
    public void 공고수정_test() throws Exception {
        // given
        JobsWriteReqDto jDto = new JobsWriteReqDto();
        jDto.setJobsId(1);
        jDto.setSkill(List.of("123", "123", "123"));
        jDto.setAddress("123");
        jDto.setTitle("123");
        jDto.setContent("123");
        jDto.setPhoto("123");
        jDto.setPosition("123");
        jDto.setEducation("123");
        jDto.setEndDate(new Timestamp(System.currentTimeMillis()));
        jDto.setCareer("123");
        jDto.setCompId(1);
        jDto.setHomepage("123");
        jDto.setReceipt("123");
        jDto.setCompName("1234");
        jDto.setRepresentativeName("1234");
        String test = om.writeValueAsString(jDto);

        // when
        ResultActions rs = mvc.perform(post("/jobs/write")
        .content(test)
        .contentType(MediaType.APPLICATION_JSON_VALUE).session(mockSession));

        // then
        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString());
    
    }
}
