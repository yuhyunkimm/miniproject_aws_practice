package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRecommendRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.skill.RequiredSkillReq.RequiredSkillWriteReqDto;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.SkillRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.util.DateUtil;

@Controller
public class MainController {

    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private SkillRepository skillRepository;

    // @GetMapping("/sample")
    // public String sample() {
    // return "main/sample";
    // }

    @GetMapping("/jusoPopup")
    public String jusoPopup1() {
        return "main/jusoPopup";
    }

    @PostMapping("/jusoPopup")
    public String jusoPopup() {
        return "main/jusoPopup";
    }

    @GetMapping("/")
    public String main(Model model) {
        // 임시 세션
        // MockSession.mockUser(session);
        // session.setAttribute("compSession", null);

        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            List<JobsMainRecommendRespDto> rDtos = jobsRepository.findAlltoMainRecommend(principal.getUserId());
            for (JobsMainRecommendRespDto jDto : rDtos) {
                long dDay = DateUtil.dDay(jDto.getEndDate());
                jDto.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto.setSkillList(insertList);
            }
            List<JobsMainRecommendRespDto> rDtos2 = jobsRepository.findAlltoMainRecommendRandom(principal.getUserId());
            for (JobsMainRecommendRespDto jDto : rDtos2) {
                long dDay = DateUtil.dDay(jDto.getEndDate());
                jDto.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto.setSkillList(insertList);
                rDtos.add(jDto);
            }
            model.addAttribute("rDtos", rDtos);

            List<JobsMainRespDto> jDtos = jobsRepository.findAlltoMain(principal.getUserId());
            for (JobsMainRespDto jDto : jDtos) {
                long dDay = DateUtil.dDay(jDto.getEndDate());
                jDto.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto.setSkillList(insertList);
            }
            model.addAttribute("jDtos", jDtos);
        } else {
            List<JobsMainRespDto> jDtost = jobsRepository.findAlltoMain(null);
            for (JobsMainRespDto jDto : jDtost) {
                long dDay = DateUtil.dDay(jDto.getEndDate());
                jDto.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto.setSkillList(insertList);
            }
            // 랜덤으로 공고에서 몇개만 추려서 상단에 뿌려도 괜찮을듯 ??
            model.addAttribute("rDtos", jDtost);

            List<JobsMainRespDto> jDtosb = jobsRepository.findAlltoMain(null);
            for (JobsMainRespDto jDto : jDtosb) {
                long dDay = DateUtil.dDay(jDto.getEndDate());
                jDto.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto.setSkillList(insertList);
            }
            model.addAttribute("jDtos", jDtosb);
        }
        return "main/main";
    }
}

// ⬜ 메인 "/"
// ⬜ 고객센터 "/help"
