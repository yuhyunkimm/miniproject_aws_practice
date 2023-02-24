package shop.mtcoding.project.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.project.model.User;

@Controller
public class MainController {
    
    @Autowired
    private HttpSession session;

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
    public String main(){
        // mockUserSession();
        return "main/main";
    }
    @GetMapping("/help")
    public String help(){
        return "main/help";
    }






}

// ⬜ 메인    "/"
// ⬜ 고객센터    "/help"
