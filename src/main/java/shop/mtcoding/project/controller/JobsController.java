package shop.mtcoding.project.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.project.model.Comp;

@Controller
public class JobsController {
    
    @Autowired
    private HttpSession session;

    private void mockUserSession() {
        Comp mockcomp = new Comp(
                1,
                "kakao@kakao.com",
                "1234",
                "카카오(주)",
                "제주 제주시 첨단로",
                "홍은택",
                "120-81-47521",
                "1577-3321",
                "/images/default_profile.png",
                3600,
                "1995-02-16",
                "http://www.kakaocorp.com",
                new Timestamp(System.currentTimeMillis())
                );
        session.setAttribute("principal", mockcomp);
    }
    
    @GetMapping("/jobs/info")
    public String info(){
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