package shop.mtcoding.project.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.User;

@Controller
public class MainController {
    
    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsRepository;

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
            new Timestamp(System.currentTimeMillis())
            );
        session.setAttribute("principal", mockUser);
    }

    @GetMapping("/")
    public String main(Model model){
        // mockUserSession();
        List<JobsMainRespDto> jDtos = jobsRepository.findAlltoMain();
        model.addAttribute("jDtos", jDtos);    
        return "main/main";
    }
    @GetMapping("/help")
    public String help(){
        return "main/help";
    }






}

// ⬜ 메인    "/"
// ⬜ 고객센터    "/help"
