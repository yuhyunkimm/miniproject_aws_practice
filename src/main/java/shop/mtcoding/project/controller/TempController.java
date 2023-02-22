package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TempController {
    
    @GetMapping("/")
    public String main(){
        return "main/main";
    }
    @GetMapping("/help")
    public String help(){
        return "main/help";
    }






}

// ⬜ 메인    "/"
// ⬜ 고객센터    "/help"
// 🟨 공개하면 기업이 접근 가능 🟨
// 🟨 이력서번호    "/resume/이력서번호"
// 🟨 자기소개서    "/intro/자기소개서번호" 