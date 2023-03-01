package shop.mtcoding.project.controllerTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.dto.resume.ResumeResp;
import shop.mtcoding.project.model.User;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class ResumeControllerTest {

    @Autowired
    private ObjectMapper om;

    @Autowired
    private MockMvc mvc;

    private MockHttpSession mockSession;
    
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

    public void manageResume_test() throws Exception {
        // given

        // when
        ResultActions resultActions = mvc.perform(
                get("/user/resume"));
        Map<String, Object> map = resultActions.andReturn().getModelAndView().getModel();
        List<ResumeResp.ResumeManageRespDto> rDtos = (List<ResumeResp.ResumeManageRespDto>) map.get("rDtos");
        String model = om.writeValueAsString(rDtos);
        System.out.println("main_test : " + model);

        // then
        resultActions.andExpect(status().isOk());
        // assertThat(rDtos.size()).isEqualTo(1);
        assertThat(rDtos.get(0).getTitle()).isEqualTo("벡엔드 이력서");
        assertThat(rDtos.get(0).getEducation()).isEqualTo("고졸");
        assertThat(rDtos.get(0).getCareer()).isEqualTo("신입");

    }

    @Test
    @Transactional
    public void writeResume_test() throws Exception {
        // given
        ResumeWriteReqDto resumeWriteReqDto = new ResumeWriteReqDto();
        resumeWriteReqDto.setUserId(1);
        resumeWriteReqDto.setTitle("벡엔드 이력서");
        resumeWriteReqDto.setContent("백엔드 이력서의 내용입니다.");
        resumeWriteReqDto.setEducation("고졸");
        resumeWriteReqDto.setCareer("신입");
        List<String> skillList = new ArrayList<>();
        skillList.add( "자바");
        skillList.add( "자바1");
        skillList.add( "자바2");
        skillList.add( "자바3");
        skillList.add( "자바4");
        resumeWriteReqDto.setSkillList(skillList);
        resumeWriteReqDto.setLink("블로그 주소");
        resumeWriteReqDto.setState(1);
        String requestBody = om.writeValueAsString(resumeWriteReqDto);
        System.out.println("테스트 : "+ requestBody);
        // when
        ResultActions resultActions = mvc.perform(post("/user/resume/write")
                .content(requestBody).contentType(MediaType.APPLICATION_JSON_VALUE)
                .session(mockSession));

        // then
        resultActions.andExpect(status().isOk());
    }

    @Test
    @Transactional
    public void saveTempResume_test() throws Exception {
        ObjectMapper om = new ObjectMapper();
        // given
        ResumeWriteReqDto resumeWriteReqDto = new ResumeWriteReqDto();
        resumeWriteReqDto.setResumeId(1);
        resumeWriteReqDto.setTitle("벡엔드 이력서");
        resumeWriteReqDto.setContent("백엔드 이력서의 내용입니다.");
        resumeWriteReqDto.setEducation("고졸");
        resumeWriteReqDto.setCareer("신입");
        List<String> skillList = new ArrayList<>();
        skillList.add( "자바");
        skillList.add( "자바1");
        skillList.add( "자바2");
        skillList.add( "자바3");
        skillList.add( "자바4");
        resumeWriteReqDto.setSkillList(skillList);
        resumeWriteReqDto.setLink("블로그 주소");
        resumeWriteReqDto.setState(1);
        String requestBody = om.writeValueAsString(resumeWriteReqDto);

        // when
        ResultActions resultActions = mvc.perform(put("/user/resume/update")
                .content(requestBody).contentType(MediaType.APPLICATION_JSON_VALUE)
                .session(mockSession));

        // then
        resultActions.andExpect(status().isOk());
    }

}
