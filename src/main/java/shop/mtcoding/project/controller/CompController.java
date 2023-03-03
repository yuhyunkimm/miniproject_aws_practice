package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.project.dto.apply.ApplyResp.ApllyStatusCompRespDto;
import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.dto.comp.CompReq.CompLoginReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsManageJobsRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsRequiredSkill;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeRecommendRespDto;
import shop.mtcoding.project.dto.scrap.CompScrapResp.CompScrapResumeRespDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.ApplyRepository;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.CompRepository;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.ScrapRepository;
import shop.mtcoding.project.service.CompService;

@Controller
public class CompController {

    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsrRepository;

    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ScrapRepository scrapRepository;

    @Autowired
    private CompService compService;

    @Autowired
    private CompRepository compRepository;

    @PostMapping("/comp/join")
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
        compService.회원가입(compJoinReqDto);

        return "redirect:/comp/login";
    }

    @GetMapping("/comp/emailCheck")
    public @ResponseBody ResponseEntity<?> sameEmailCheck(String email) {
        Comp compPS = compRepository.findByCompEmail(email);
        if (compPS != null) {
            throw new CustomApiException("동일한 email이 존재합니다.");
        }
        return new ResponseEntity<>(new ResponseDto<>(1, "해당 email은 사용 가능합니다.", null), HttpStatus.OK);
    }

    @GetMapping("/comp/join")
    public String joinComp() {
        return "comp/joinForm";
    }

    @PostMapping("/comp/login")
    public String login(CompLoginReqDto compLoginReqDto, HttpServletResponse httpServletResponse) {
        if (compLoginReqDto.getEmail() == null || compLoginReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (compLoginReqDto.getPassword() == null || compLoginReqDto.getPassword().isEmpty()) {
            throw new CustomException("password 작성해주세요");
        }

        Comp principal = compService.로그인(compLoginReqDto);

        if (principal == null) {
            return "redirect:/loginForm";
        } else {
            if (compLoginReqDto.getRememberEmail() == null) {
                compLoginReqDto.setRememberEmail("");
            }
            if (compLoginReqDto.getRememberEmail().equals("on")) {
                Cookie cookie = new Cookie("rememberEmail", compLoginReqDto.getEmail());
                httpServletResponse.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("remember", "");
                cookie.setMaxAge(0);
                httpServletResponse.addCookie(cookie);
            }
            session.setAttribute("compSession", principal);
            return "redirect:/";
        }
    }

    @GetMapping("/comp/login")
    public String loginComp() {
        return "comp/loginForm";
    }

    @GetMapping("/comp/comphome")
    public String compMyhome(Model model) {
        // MockSession.mockComp(session);
        Comp compSession = (Comp)session.getAttribute("compSession");
        if ( compSession == null ){
            return "redirect:/comp/login";
        }
        List<JobsManageJobsRespDto> jDtos = jobsrRepository.findByIdtoManageJobs(compSession.getCompId());
        model.addAttribute("jDtos", jDtos);
        return "comp/comphome";
    }

    @GetMapping("/comp/update")
    public String updateComp() {
        return "comp/updateForm";
    }

    @GetMapping("/comp/apply")
    public String apply(Model model) {
        Comp compSession = (Comp)session.getAttribute("compSession");
        List<ApllyStatusCompRespDto> aList = applyRepository.findAllByCompIdtoApply(compSession.getCompId());
        model.addAttribute("aDtos", aList);
        return "comp/apply";
    }

    @GetMapping("/comp/jobs")
    public String manageJobs(Model model) {
        Comp compSession = (Comp)session.getAttribute("compSession");
        List<JobsManageJobsRespDto> jDtos = jobsrRepository.findByIdtoManageJobs(compSession.getCompId());
        model.addAttribute("jDtos", jDtos);

        return "comp/manageJobs";
    }

    // 공개이력서 열람
    @GetMapping("/comp/resume/read")
    public String readResume() {
        return "comp/readResume";
    }

    @GetMapping("/comp/resume/scrap")
    public String scrapResume(Model model) {
        Comp compSession = (Comp)session.getAttribute("compSession");
        List<CompScrapResumeRespDto> sList = scrapRepository.findAllScrapByCompId(compSession.getCompId());
        model.addAttribute("sDtos", sList);
        return "comp/scrap";
    }

    @GetMapping("/comp/talent")
    public String talent(Model model) {
        // MockSession.mockComp(session);

        // Comp principal = (Comp) session.getAttribute("compSession");
        // List<JobsRequiredSkill> rSkill = jobsrRepository.findByJobsRequiredSkill(principal.getCompId());
        // Set<String> set = new HashSet<>();
        // for (JobsRequiredSkill skills : rSkill) {
            
        // }
        // model.addAttribute("compSkillDto", set);
        // List<ResumeRecommendRespDto> recommendResumeList = resumeRepository.findAllResumebyPublic();
        // List<ResumeRecommendRespDto> threeMatchDto = new ArrayList<>();
        // List<ResumeRecommendRespDto> twoMatchDto = new ArrayList<>();
        // List<ResumeRecommendRespDto> oneMatchDto = new ArrayList<>();
        // List<ResumeRecommendRespDto> recommendList = new ArrayList<>();
        // for (ResumeRecommendRespDto rcPS : recommendResumeList) {
        //     if (set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
        //             && set.contains(rcPS.getSkillName3())) {
        //         threeMatchDto.add(rcPS);
        //         continue;
        //     }
        //     if ((set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
        //             && !set.contains(rcPS.getSkillName3())) ||
        //             (set.contains(rcPS.getSkillName1()) && !set.contains(rcPS.getSkillName2())
        //                     && set.contains(rcPS.getSkillName3()))
        //             ||
        //             (!set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
        //                     && set.contains(rcPS.getSkillName3()))) {
        //         twoMatchDto.add(rcPS);
        //         continue;
        //     }
        //     if ((set.contains(rcPS.getSkillName1()) && !set.contains(rcPS.getSkillName2())
        //             && !set.contains(rcPS.getSkillName3())) ||
        //             (!set.contains(rcPS.getSkillName1()) && set.contains(rcPS.getSkillName2())
        //                     && !set.contains(rcPS.getSkillName3()))
        //             ||
        //             (!set.contains(rcPS.getSkillName1()) && !set.contains(rcPS.getSkillName2())
        //                     && set.contains(rcPS.getSkillName3()))) {
        //         oneMatchDto.add(rcPS);
        //         continue;
        //     }
        // }
        // recommendList.addAll(threeMatchDto);
        // recommendList.addAll(twoMatchDto);
        // recommendList.addAll(oneMatchDto);
        // model.addAttribute("rDtos", recommendList);

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