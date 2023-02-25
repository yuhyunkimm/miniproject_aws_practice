package shop.mtcoding.project.controller;

import java.sql.Timestamp;
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

import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserSkillRespDto;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;

@Controller
public class MainController {
    
    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private UserRepository userRepository;

    private void mockUserSession() {
        User mockUser = new User(
            1,
            "ssar@nate.com",
            "1234",
            "ssar",
            "2000-01-01",
            "010-1234-1234",
            "/images/default_profile.png",
            "부산시 부산진구",
            new Timestamp(System.currentTimeMillis())
            );
        session.setAttribute("principal", mockUser);
    }

    @GetMapping("/")
    public String main(Model model){
        mockUserSession();
        User principal = (User) session.getAttribute("principal");
        if ( principal != null) {
            UserSkillRespDto userSkillPS = userRepository.findByUserSkill(principal.getUserId());
            List<String> skillList = Arrays.asList(userSkillPS.getSkillName1(), userSkillPS.getSkillName2(), userSkillPS.getSkillName3());
            Set<String> set = new HashSet<>(skillList);

            List<JobsMainRespDto> JobsList = jobsRepository.findAlltoMain();
            List<JobsMainRespDto> threeMatchRecommend = new ArrayList<>();
            List<JobsMainRespDto> twoMatchRecommend = new ArrayList<>();
            List<JobsMainRespDto> oneMatchRecommend = new ArrayList<>();
            List<JobsMainRespDto> recommendListDto = new ArrayList<>();
            for (JobsMainRespDto jsPS : JobsList) {
                if( set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3()) ){
                    threeMatchRecommend.add(jsPS);
                    continue;
                }
                if( (set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) ||
                ( set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) ||
                ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) ){
                    twoMatchRecommend.add(jsPS);
                    continue;
                }
                if( (set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) ||
                ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) ||
                ( !set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) ){
                    oneMatchRecommend.add(jsPS);
                    continue;
                } 
            }
            recommendListDto.addAll(threeMatchRecommend);
            recommendListDto.addAll(twoMatchRecommend);
            recommendListDto.addAll(oneMatchRecommend);
            // recommendListDto.addAll(JobsList);
            model.addAttribute("rDtos", recommendListDto);
        } else {
            List<JobsMainRespDto> jDtos = jobsRepository.findAlltoMain();
            model.addAttribute("rDtos", jDtos);
        }
        List<JobsMainRespDto> jDtos = jobsRepository.findAlltoMain();
        model.addAttribute("jDtos", jDtos);
        return "main/main";
    }
    

    @GetMapping("/help")
    public String help(){
        return "main/help";
    }






}

// ⬜ 메인    "/"
// ⬜ 고객센터    "/help"
