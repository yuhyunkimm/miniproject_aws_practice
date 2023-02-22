package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompController {
    
    @GetMapping("/comp/join")
    public String joinComp(){
    return "comp/joinForm";
    }

    @GetMapping("/comp/login")
    public String loginComp(){
    return "comp/loginForm";
    }

    @GetMapping("/comp/myhome")
    public String compMyhome(){
    return "comp/myhome";
    }

    @GetMapping("/comp/update")
    public String updateComp(){
    return "comp/updateForm";
    }

    @GetMapping("/comp/apply")
    public String apply(){
    return "comp/apply";
    }
    
    // 공개이력서 열람
    @GetMapping("/comp/resume/read")
    public String readResume(){
    return "comp/readResume";
    }

    @GetMapping("/comp/resume/scrap")
    public String scrapResume(){
    return "comp/scrap";
    }

    @GetMapping("/comp/talent")
    public String talent(){
    return "comp/talent";
    }

}

// ⬜ 기업회원가입    "/comp/join"
// ⬜ 기업로그인    "/comp/login
// 🟦 🔐 기업권한필요 🔐 🟦
// 🟦 기업홈    "/comp/myhome"
// 🟦 기업수정    "/comp/update"
// 🟦 공고등록    "/comp/jobs/write
// 🟦 공고수정    "/comp/jobs/공고번호/update"
// 🟦 지원자현황   "/comp/apply"
// 🟦 이력서 열람   "/comp/resume/read"
// 🟦 이력서 스크랩   "/comp/resume/scrap"
// 🟦 인재추천    "/comp/talent"