package shop.mtcoding.project.controller;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.project.dto.jobs.JobsResp.JobsRequiredSkill;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeRecommendRespDto;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.User;

@Controller
public class CompController {

    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsrRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    private void mockCompSession() {
        Comp mockcomp = new Comp(
                1,
                "kakao@kakao.com",
                "1234",
                "카카오(주)",
                "제주 제주시 첨단로",
                "홍은택",
                "120-81-47521",
                "1577-3321",
                "/images/kakao.png",
                3600,
                "1995-02-16",
                "http://www.kakaocorp.com",
                new Timestamp(System.currentTimeMillis()));
        session.setAttribute("principal", mockcomp);
    }

    @GetMapping("/comp/join")
    public String joinComp() {
        return "comp/joinForm";
    }

    @GetMapping("/comp/login")
    public String loginComp() {
        return "comp/loginForm";
    }

    @GetMapping("/comp/myhome")
    public String compMyhome() {
        // mockCompSession();
        return "comp/myhome";
    }

    @GetMapping("/comp/update")
    public String updateComp() {
        return "comp/updateForm";
    }

    @GetMapping("/comp/apply")
    public String apply() {
        return "comp/apply";
    }

    // 공개이력서 열람
    @GetMapping("/comp/resume/read")
    public String readResume() {
        return "comp/readResume";
    }

    @GetMapping("/comp/resume/scrap")
    public String scrapResume() {
        return "comp/scrap";
    }

    @GetMapping("/comp/talent")
    public String talent() {
        mockCompSession();
        User principal = (User) session.getAttribute("principal");
        if ( principal != null ){
            JobsRequiredSkill rSkill = jobsrRepository.findByJobsRequiredSkill(principal.getUserId());
            List<String> rSkillList = Arrays.asList(rSkill.getSkillName1(), rSkill.getSkillName2(), rSkill.getSkillName3());
            List<ResumeRecommendRespDto> recommendList = resumeRepository.findAllResumebyPublic();
        }

        return "comp/talent";
    }

}

// ⬜ 기업회원가입 "/comp/join"
// ⬜ 기업로그인 "/comp/login

// 🟦 🔐 기업권한필요 🔐 🟦
// 🟦 기업홈 "/comp/myhome"
// 🟦 기업수정 "/comp/update"
// 🟦 지원자현황 "/comp/apply"
// 🟦 이력서 열람 "/comp/resume/read"
// 🟦 이력서 스크랩 "/comp/resume/scrap"
// 🟦 인재추천 "/comp/talent"