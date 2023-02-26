package shop.mtcoding.project.controllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

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
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.project.dto.scrap.UserScrapReq.UserDeleteScrapReqDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;
import shop.mtcoding.project.model.User;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class UserScrapControllerTest {
    
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
    public void insertScrap_test() throws Exception {
        ObjectMapper om = new ObjectMapper();

        UserInsertScrapReqDto sDto = new UserInsertScrapReqDto();
        sDto.setUserId(1);
        sDto.setJobsId(1);
        String jsonString = om.writeValueAsString(sDto);

        ResultActions rs = mvc.perform(put("/user/scrap/insert")
                              .content(jsonString).contentType(MediaType.APPLICATION_JSON_VALUE)
                              .session(mockSession));

        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString());
    }

    @Test
    @Transactional
    public void deleteScrap_test() throws Exception {
        ObjectMapper om = new ObjectMapper();
        //given
        UserDeleteScrapReqDto sDto = new UserDeleteScrapReqDto();
        sDto.setUserScrapId(1);
        String jsonString = om.writeValueAsString(sDto);

        //when
        ResultActions rs = mvc.perform(delete("/user/scrap/delete")
                              .content(jsonString).contentType(MediaType.APPLICATION_JSON_VALUE)
                              .session(mockSession));
        //then
        System.out.println("테스트 : "+ rs.andReturn().getResponse().getContentAsString());
    }
}
    
