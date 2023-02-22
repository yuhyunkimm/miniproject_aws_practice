package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeController {
   
    @GetMapping("/user/resume")
    public String resume(){
    return "resume/resume";
    }

    @GetMapping("/user/resume/write")
    public String writeResume(){
    return "resume/writeResumeForm";
    }

    @GetMapping("/user/resume/{id}/update")
    public String updateResume(){
    return "resume/updateResumeForm";
    }
    
    @GetMapping("/resume/{id}")
    public String resumeDetail(){
        return"/resume/resumeDetail";
    }
}
