package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobsController {
    
    @GetMapping("/jobs/info")
    public String intro(){
        return "jobs/info";
    }

    @GetMapping("/jobs/{id}")
    public String viewJobs(){
        return "jobs/jobsDetail";
    }

    @GetMapping("/comp/jobs/write")
    public String writeJobs(){
    return "comp/writeJobsForm";
    }

    @GetMapping("/comp/jobs/{id}/update")
    public String updateJobs(){
    return "comp/updateJobsForm";
    }
}
// ⬜ 채용정보    "/jobs/info"
// ⬜ 공고    "/jobs/1"

// 🟦 공고등록    "/comp/jobs/write
// 🟦 공고수정    "/comp/jobs/공고번호/update"