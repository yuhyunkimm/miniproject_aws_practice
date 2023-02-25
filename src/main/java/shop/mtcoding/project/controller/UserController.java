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
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.project.dto.jobs.JobsResp.JobsSkillRespDto;
import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.dto.user.UserResp.UserSkillAndInterestDto;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;
import shop.mtcoding.project.service.UserService;

@Controller
public class UserController {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JobsRepository jobsRepository;

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
                new Timestamp(System.currentTimeMillis()));
        session.setAttribute("principal", mockUser);
    }

    @PostMapping("/user/join")
    public String join(UserJoinReqDto userJoinReqDto) {

        if (userJoinReqDto.getEmail() == null || userJoinReqDto.getEmail().isEmpty()) {
            throw new CustomException("이메일을 작성해주세요");
        }
        if (userJoinReqDto.getName() == null || userJoinReqDto.getName().isEmpty()) {
            throw new CustomException("이름을 작성해주세요");
        }
        if (userJoinReqDto.getPassword() == null ||
                userJoinReqDto.getPassword().isEmpty()) {
            throw new CustomException("패스워드를 작성해주세요");
        }
        if (userJoinReqDto.getPassword() == null ||
                userJoinReqDto.getPassword().isEmpty()) {
            throw new CustomException("동일한 패스워드를 작성해주세요");
        }
        if (userJoinReqDto.getBirth() == null || userJoinReqDto.getBirth().isEmpty()) {
            throw new CustomException("생년월일을 작성해주세요");
        }
        if (userJoinReqDto.getTel() == null || userJoinReqDto.getTel().isEmpty()) {
            throw new CustomException("휴대폰번호을 작성해주세요");
        }
        userService.회원가입(userJoinReqDto);

        return "redirect:/user/login";
    }

    @GetMapping("/user/join")
    public String joinForm() {
        return "user/joinForm";
    }

    @GetMapping("/user/login")
    public String loginForm() {
        return "user/loginForm";
    }

    @GetMapping("/user/myhome")
    public String myhome() {
        mockUserSession();
        return "user/myhome";
    }

    @GetMapping("/user/interest")
    public String interest(Model model) {
        mockUserSession();
        User principal = (User) session.getAttribute("principal");
        UserSkillAndInterestDto usi = userRepository.findByUserSkillAndInterest(principal.getUserId());
        List<String> insertList = Arrays.asList(usi.getSkillName1(),usi.getSkillName2(),usi.getSkillName3(),usi.getInterestCt1(),usi.getInterestCt2(),usi.getInterestCt3()); 
        Set<String> set = new HashSet<>(insertList);
        List<String> matchingList = new ArrayList<>(set);
        model.addAttribute("uDto", matchingList);

        List<JobsSkillRespDto> jsList = jobsRepository.findAllByJobsAndSkill();
        List<JobsSkillRespDto> threeMatchDto = new ArrayList<>();
        List<JobsSkillRespDto> twoMatchDto = new ArrayList<>();
        List<JobsSkillRespDto> oneMatchDto = new ArrayList<>();
        for (JobsSkillRespDto jsPS : jsList) {
            if( set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3()) ){
                threeMatchDto.add(jsPS);
                continue;
            }
            if( (set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) ||
            ( set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) ||
            ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) ){
                twoMatchDto.add(jsPS);
                continue;
            }
            if( (set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) ||
            ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) ||
            ( !set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) ){
                oneMatchDto.add(jsPS);
                continue;
            } 
        }
        model.addAttribute("threeMatchDto", threeMatchDto);
        model.addAttribute("twoMatchDto", twoMatchDto);
        model.addAttribute("oneMatchDto", oneMatchDto); 
        return "user/interest";
    }

    @GetMapping("/user/update")
    public String update() {
        return "user/updateForm";
    }

    @GetMapping("/user/scrap")
    public String scarp() {
        return "user/scrap";
    }

    @GetMapping("/user/offer")
    public String offer() {
        return "user/offer";
    }
}

// ⬜ 회원가입 "/user/join"
// ⬜ 로그인 "/user/login"
// ⬜ 관심기업 "/user/interest"

// 🟩 🔐 유저권한필요 🔐 🟩
// 🟩 유저홈 "/user/myhome"
// 🟩 회원수정 "/user/update"
// 🟩 스크랩 "/user/scrap"
// 🟩 지원 및 받은제안 "/user/offer"