package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeController {
   
    @GetMapping("/user/resume")
    public String resume() {
        return "resume/resume";
    }

    @GetMapping("/user/resume/write")
    public String writeResume() {
        return "resume/writeResumeForm";
    }

    @GetMapping("/user/resume/{id}/update")
    public String updateResume() {
        return "resume/updateResumeForm";
    }

    @GetMapping("/resume/{id}")
    public String resumeDetail(){
        return"/resume/resumeDetail";
    }
}

// 🟨 공개하면 기업이 접근 가능 🟨
// 🟨 이력서번호    "/resume/이력서번호"

// 🟩 🔐 유저권한필요 🔐 🟩
// 🟩 이력서관리    "/user/resume"
// 🟩 이력서작성    "/user/resume/write"
// 🟩 이력서수정    "/user/resume/이력서번호/update"