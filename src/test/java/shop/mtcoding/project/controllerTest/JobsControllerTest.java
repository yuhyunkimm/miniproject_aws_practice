package shop.mtcoding.project.controllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.sql.Timestamp;
import java.util.ArrayList;
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

import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
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
            "/images/kakao.png",
            "http://www.kakaocorp.com",
            new Timestamp(System.currentTimeMillis()));
            mockSession = new MockHttpSession();
            mockSession.setAttribute("compSession", mockcomp);
    }

    @Test
    public void searchCheckbox_test() throws Exception {
        // given
        String keyword = "address=서울,경기도";
        
        // when
        ResultActions rs = mvc.perform(get("/jobs/info/search?"+keyword));
    
        // then
        String result = rs.andReturn().getResponse().getContentAsString();
        System.out.println("테스트 : "+ result);
    
    }
    
    @Test
    public void writeJobs_test() throws Exception {
        // given
        JobsWriteReqDto jDto = new JobsWriteReqDto();
        jDto.setJobsId(1);
        jDto.setCompId(1);
        jDto.setCompName("1234");
        jDto.setRepresentativeName("1234");
        jDto.setHomepage("123");
        jDto.setPhoto("123");
        jDto.setTitle("123");
        jDto.setContent("123");
        jDto.setEducation("123");
        jDto.setPosition("123");
        jDto.setAddress("123");
        jDto.setEndDate(new Timestamp(System.currentTimeMillis()));
        jDto.setReceipt("123");
        jDto.setCareer("123");
        List<String> skillList = new ArrayList<>();
        skillList.add( "자바");
        skillList.add( "자바1");
        skillList.add( "자바2");
        skillList.add( "자바3");
        skillList.add( "자바4");
        jDto.setSkillList(skillList);

        String test = om.writeValueAsString(jDto);

        // when
        ResultActions rs = mvc.perform(post("/jobs/write")
        .content(test)
        .contentType(MediaType.APPLICATION_JSON_VALUE).session(mockSession));

        // then
        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString());
    
    }
    @Test
    public void updateJobs_test() throws Exception {
        // given
        JobsWriteReqDto jDto = new JobsWriteReqDto();
        jDto.setJobsId(1);
        jDto.setCompId(1);
        jDto.setCompName("1234");
        jDto.setRepresentativeName("1234");
        jDto.setHomepage("123");
        jDto.setPhoto("123");
        jDto.setTitle("123");
        jDto.setContent("123");
        jDto.setEducation("123");
        jDto.setPosition("123");
        jDto.setAddress("123");
        jDto.setEndDate(new Timestamp(System.currentTimeMillis()));
        jDto.setReceipt("123");
        jDto.setCareer("123");
        List<String> skillList = new ArrayList<>();
        skillList.add( "자바");
        skillList.add( "자바1");
        skillList.add( "자바2");
        skillList.add( "자바3");
        skillList.add( "자바4");
        jDto.setSkillList(skillList);

        String test = om.writeValueAsString(jDto);

        // when
        ResultActions rs = mvc.perform(put("/jobs/update")
        .content(test)
        .contentType(MediaType.APPLICATION_JSON_VALUE).session(mockSession));

        // then
        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString());
    
    }
}
