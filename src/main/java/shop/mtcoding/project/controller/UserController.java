package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    
    @GetMapping("/user/join")
    public String joinForm(){
    return "user/joinForm";
    }

    @GetMapping("/user/login")
    public String loginForm(){
    return "user/loginForm";
    }

    @GetMapping("/user/interest")
    public String interest(){
    return "user/interest";
    }

    @GetMapping("/user/myhome")
    public String myhome(){
    return "user/myhome";
    }

    @GetMapping("/user/update")
    public String update(){
    return "user/updateForm";
    }
    
    @GetMapping("/user/scrap")
    public String scarp(){
    return "user/scrap";
    }

    @GetMapping("/user/offer")
    public String offer(){
    return "user/offer";
    }
}

// ⬜ 회원가입    "/user/join"
// ⬜ 로그인    "/user/login"
// ⬜ 관심기업    "/user/interest"

// 🟩 🔐 유저권한필요 🔐 🟩
// 🟩 유저홈    "/user/myhome"
// 🟩 회원수정    "/user/update"
// 🟩 스크랩    "/user/scrap"
// 🟩 지원 및 받은제안    "/user/offer"