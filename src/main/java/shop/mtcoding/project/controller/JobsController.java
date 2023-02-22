package shop.mtcoding.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobsController {
    
    @GetMapping("/jobs/intro")
    public String intro(){
        return "jobs/intro";
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