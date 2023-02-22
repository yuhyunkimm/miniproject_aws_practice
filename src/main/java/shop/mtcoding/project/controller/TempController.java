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
