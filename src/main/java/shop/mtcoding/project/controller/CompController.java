package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsRequiredSkill;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeRecommendRespDto;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.util.MockSession;

@Controller
public class CompController {

    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsrRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @PostMapping("/user/join")
    public String join(CompJoinReqDto compJoinReqDto) {
        if (compJoinReqDto.getEmail() == null || compJoinReqDto.getEmail().isEmpty()) {
            throw new CustomException("이메일을 작성해주세요");
        }
        if (compJoinReqDto.getPassword() == null || compJoinReqDto.getPassword().isEmpty()) {
            throw new CustomException("패스워드를 작성해주세요");
        }
        if (compJoinReqDto.getPassword() == null || compJoinReqDto.getPassword().isEmpty()) {
            throw new CustomException("동일한 패스워드를 작성해주세요");
        }
        if (compJoinReqDto.getCompName() == null || compJoinReqDto.getCompName().isEmpty()) {
            throw new CustomException("회사이름을 작성해주세요");
        }
        if (compJoinReqDto.getRepresentativeName() == null || compJoinReqDto.getRepresentativeName().isEmpty()) {
            throw new CustomException("대표자명을 작성해주세요");
        }
        if (compJoinReqDto.getBusinessNumber() == null || compJoinReqDto.getBusinessNumber().isEmpty()) {
            throw new CustomException("사업자번호를 작성해주세요");
        }
        // compService.회원가입();

        return "redirect:/comp/login";
    }

    @GetMapping("/comp/join")
    public String joinComp() {
        return "comp/joinForm";
    }

    @GetMapping("/comp/login")
    public String loginComp() {
        return "comp/loginForm";
    }

    @GetMapping("/comp/comphome")
    public String compMyhome() {
        MockSession.mockComp(session);
        return "comp/comphome";
    }

    @GetMapping("/comp/update")
    public String updateComp() {
        return "comp/updateForm";
    }

    @GetMapping("/comp/apply")
    public String apply() {
        return "comp/apply";
    }

    @GetMapping("/comp/jobs")
    public String manageJobs() {
        return "comp/manageJobs";
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
    public String talent(Model model) {
        // MockSession.mockComp(session);

        Comp principal = (Comp) session.getAttribute("compSession");
        List<JobsRequiredSkill> rSkill = jobsrRepository.findByJobsRequiredSkill(principal.getCompId());
        Set<String> set = new HashSet<>();
        for (JobsRequiredSkill skills : rSkill) {
            set.add(skills.getSkillName1());
            set.add(skills.getSkillName2());
            set.add(skills.getSkillName3());
        }
        model.addAttribute("compSkillDto", set);
        List<ResumeRecommendRespDto> recommendResumeList = resumeRepository.findAllResumebyPublic();
        List<ResumeRecommendRespDto> threeMatchDto = new ArrayList<>();
        List<ResumeRecommendRespDto> twoMatchDto = new ArrayList<>();
        List<ResumeRecommendRespDto> oneMatchDto = new ArrayList<>();
        List<ResumeRecommendRespDto> recommendList = new ArrayList<>();
        for (ResumeRecommendRespDto rcPS : recommendResumeList) {
            if (set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
                    && set.contains(rcPS.getSkillName3())) {
                threeMatchDto.add(rcPS);
                continue;
            }
            if ((set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
                    && !set.contains(rcPS.getSkillName3())) ||
                    (set.contains(rcPS.getSkillName1()) && !set.contains(rcPS.getSkillName2())
                            && set.contains(rcPS.getSkillName3()))
                    ||
                    (!set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
                            && set.contains(rcPS.getSkillName3()))) {
                twoMatchDto.add(rcPS);
                continue;
            }
            if ((set.contains(rcPS.getSkillName1()) && !set.contains(rcPS.getSkillName2())
                    && !set.contains(rcPS.getSkillName3())) ||
                    (!set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
                            && !set.contains(rcPS.getSkillName3()))
                    ||
                    (!set.contains(rcPS.getSkillName1()) && !set.contains(rcPS.getSkillName2())
                            && set.contains(rcPS.getSkillName3()))) {
                oneMatchDto.add(rcPS);
                continue;
            }
        }
        recommendList.addAll(threeMatchDto);
        recommendList.addAll(twoMatchDto);
        recommendList.addAll(oneMatchDto);
        model.addAttribute("rDtos", recommendList);

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