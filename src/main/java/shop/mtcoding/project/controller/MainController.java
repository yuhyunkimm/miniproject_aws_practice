package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.skill.RequiredSkillReq.RequiredSkillWriteReqDto;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.SkillRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;
import shop.mtcoding.project.util.DateUtil;

@Controller
public class MainController {

    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SkillRepository skillRepository;

    @GetMapping("/sample")
    public String sample() {

        return "main/sample";
    }

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
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
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

    @GetMapping("/help")
    public String help() {
        return "main/help";
    }
}

// ⬜ 메인 "/"
// ⬜ 고객센터 "/help"
