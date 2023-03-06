package shop.mtcoding.project.controllerTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.project.dto.comp.CompReq.CompUpdateReqDto;
import shop.mtcoding.project.dto.resume.ResumeResp;
import shop.mtcoding.project.model.Comp;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class CompControllerTest {

    @Autowired
    private ObjectMapper om;

    @Autowired
    private MockMvc mvc;

    private MockHttpSession mockSession;

    @BeforeEach
    private void mockCompSession() {
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
    @Transactional
    public void update_test() throws Exception {
        // given

        CompUpdateReqDto compUpdateReqDto = new CompUpdateReqDto();
        compUpdateReqDto.setCompId(1);
        compUpdateReqDto.setPassword("1111");
        compUpdateReqDto.setCompName("dsf");
        compUpdateReqDto.setRepresentativeName("dddd");
        compUpdateReqDto.setBusinessNumber("ddss");
        String requestBody = om.writeValueAsString(compUpdateReqDto);

        CompUpdateReqDto cDto = new CompUpdateReqDto();
        cDto.setPassword("1234");
        cDto.setCompName("카카오");
        cDto.setRepresentativeName("ㄱㄱㄴ");
        cDto.setBusinessNumber("0123-5564");

        // when
        ResultActions resultActions = mvc.perform(
                put("/comp/update")
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
        String requestBody = "email=2kakao@nate.com&password=1234&compName=카카오(주)&representativeName=홍은택&businessNumber=120-81-47521";

        // when
        ResultActions resultActions = mvc.perform(post("/comp/join").content(requestBody)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));

        // then
        resultActions.andExpect(status().is3xxRedirection());
    }

    @Test
    @Transactional
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

    @Test
    @Transactional
    public void readResume_test() throws Exception {
        // given

        // when
        ResultActions resultActions = mvc.perform(
                get("/comp/resume/read"));
        Map<String, Object> map = resultActions.andReturn().getModelAndView().getModel();
        List<ResumeResp.ResumeReadRespDto> rDtos = (List<ResumeResp.ResumeReadRespDto>) map.get("rDtos");
        String model = om.writeValueAsString(rDtos);
        System.out.println("main_test : " + model);

        // then
        resultActions.andExpect(status().isOk());
        // assertThat(rDtos.size()).isEqualTo(10);
        assertThat(rDtos.get(0).getName()).isEqualTo("ssar");
        assertThat(rDtos.get(0).getCareer()).isEqualTo("신입");
        assertThat(rDtos.get(0).getAddress()).isEqualTo("서울");
        // assertThat(rDtos.get(0).getSkillList()).isEqualTo("자바");
        assertThat(rDtos.get(0).getState()).isEqualTo(1);

    }

}
