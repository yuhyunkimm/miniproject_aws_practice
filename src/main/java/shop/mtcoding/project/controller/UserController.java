package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import shop.mtcoding.project.dto.apply.ApplyResp.ApllyStatusUserRespDto;
import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeManageRespDto;
import shop.mtcoding.project.dto.scrap.UserScrapResp.UserScrapRespDto;
import shop.mtcoding.project.dto.skill.RequiredSkillReq.RequiredSkillWriteReqDto;
import shop.mtcoding.project.dto.skill.ResumeSkillResp.ResumeSkillRespDto;
import shop.mtcoding.project.dto.suggest.SuggestResp.SuggestToUserRespDto;
import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserLoginReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserPasswordReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserUpdateReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.ApplyRepository;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.ScrapRepository;
import shop.mtcoding.project.model.SkillRepository;
import shop.mtcoding.project.model.SuggestRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;
import shop.mtcoding.project.service.UserService;
import shop.mtcoding.project.util.DateUtil;
import shop.mtcoding.project.util.MockSession;
import shop.mtcoding.project.util.Sha256;


@Controller
public class UserController {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private SuggestRepository suggestRepository;

    @Autowired
    private ScrapRepository scrapRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private SkillRepository skillRepository;

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

    @GetMapping("/user/emailCheck")
    public @ResponseBody ResponseEntity<?> sameEmailCheck(String email) {
        User userPS = userRepository.findByUserEmail(email);
        if (userPS != null) {
            throw new CustomApiException("동일한 email이 존재합니다.");
        }
        return new ResponseEntity<>(new ResponseDto<>(1, "해당 email은 사용 가능합니다.", null), HttpStatus.OK);
    }

    @GetMapping("/user/join")
    public String joinForm() {
        return "user/joinForm";
    }

    @PostMapping("/user/login")
    public String login(UserLoginReqDto userloginReqDto, HttpServletResponse httpServletResponse) {
        if (userloginReqDto.getEmail() == null || userloginReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (userloginReqDto.getPassword() == null || userloginReqDto.getPassword().isEmpty()) {
            throw new CustomException("password 작성해주세요");
        }
        User principal = userService.로그인(userloginReqDto);
        if (principal == null) {
            return "redirect:/loginForm";
        } else {
            if (userloginReqDto.getRememberEmail() == null) {
                userloginReqDto.setRememberEmail("");
            }
            if (userloginReqDto.getRememberEmail().equals("on")) {
                Cookie cookie = new Cookie("rememberEmail", userloginReqDto.getEmail());
                httpServletResponse.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("remember", "");
                cookie.setMaxAge(0);
                httpServletResponse.addCookie(cookie);
            }
            session.setAttribute("compSession", null);
            session.setAttribute("principal", principal);
            return "redirect:/";
        }
    }

    @PostMapping("/user/login2")
    public ResponseEntity<?> login2(@RequestBody UserLoginReqDto userloginReqDto,
            HttpServletResponse httpServletResponse) {
        if (userloginReqDto.getEmail() == null || userloginReqDto.getEmail().isEmpty()) {
            throw new CustomApiException("email을 작성해주세요");
        }
        if (userloginReqDto.getPassword() == null || userloginReqDto.getPassword().isEmpty()) {
            throw new CustomApiException("password 작성해주세요");
        }
        User principal = userService.ajax로그인(userloginReqDto);
        if (principal != null) {
            if (userloginReqDto.getRememberEmail() == null) {
                userloginReqDto.setRememberEmail("");
            }
            if (userloginReqDto.getRememberEmail().equals("on")) {
                Cookie cookie = new Cookie("rememberEmail", userloginReqDto.getEmail());
                httpServletResponse.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("remember", "");
                cookie.setMaxAge(0);
                httpServletResponse.addCookie(cookie);
            }
            session.setAttribute("principal", principal);
        }
        return new ResponseEntity<>(new ResponseDto<>(1, "로그인 성공", null), HttpStatus.OK);
    }

    @GetMapping("/user/login")
    public String loginForm() {
        return "user/loginForm";
    }

    @PostMapping("/user/passwordCheck")
    public @ResponseBody ResponseEntity<?> samePasswordCheck(@RequestBody UserPasswordReqDto userPasswordReqDto) {
        userPasswordReqDto.setPassword(Sha256.encode(userPasswordReqDto.getPassword()));
        User userPS = userRepository.findByUseridAndPassword(
                userPasswordReqDto.getUserId(),
                userPasswordReqDto.getPassword());
        if (userPS == null) {
            throw new CustomApiException("비밀번호가 틀렸습니다.");
        }
        return new ResponseEntity<>(new ResponseDto<>(1, "인증에 성공하였습니다.",
                null), HttpStatus.OK);
    }

    @PutMapping("/user/update")
    public ResponseEntity<?> updateUser(@RequestBody UserUpdateReqDto userUpdateReqDto) {
        userUpdateReqDto.setPassword(Sha256.encode(userUpdateReqDto.getPassword()));
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (userUpdateReqDto.getPassword() == null || userUpdateReqDto.getPassword().isEmpty()) {
            throw new CustomApiException("비밀번호를 입력하세요");
        }
        if (userUpdateReqDto.getName() == null || userUpdateReqDto.getName().isEmpty()) {
            throw new CustomApiException("이름을 입력하세요");
        }
        if (userUpdateReqDto.getBirth() == null || userUpdateReqDto.getBirth().isEmpty()) {
            throw new CustomApiException("생년월일을 입력하세요");
        }
        if (userUpdateReqDto.getTel() == null || userUpdateReqDto.getTel().isEmpty()) {
            throw new CustomApiException("휴대전화를 입력하세요");
        }
        if (userUpdateReqDto.getAddress() == null || userUpdateReqDto.getAddress().isEmpty()) {
            throw new CustomApiException("주소를 입력하세요");
        }
        userService.개인정보수정(userUpdateReqDto, principal.getUserId());
        return new ResponseEntity<>(new ResponseDto<>(1, "수정완료", null), HttpStatus.OK);

    }

    @GetMapping("/user/update")
    public String updateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        User userPS = userRepository.findById(principal.getUserId());
        model.addAttribute("uDto", userPS);
        return "user/updateForm";
    }

    @GetMapping("/user/myhome")
    public String myhome(Model model) {
        // 임시 세션
        MockSession.mockUser(session);
        // session.setAttribute("compSession", null);

        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/login";
        }
        List<ResumeManageRespDto> rLists = resumeRepository.findAllByUserId(principal.getUserId());
        for (ResumeManageRespDto rList : rLists) {
            List<String> insertList = new ArrayList<>();
            for (ResumeSkillRespDto skill : skillRepository.findByResumeSkill(rList.getResumeId())) {
                insertList.add(skill.getSkill());
                rList.setSkillList(insertList);
            }
        }
        model.addAttribute("rDtos", rLists);
        User userPS = userRepository.findById(principal.getUserId());
        model.addAttribute("user", userPS);
        // System.out.println("테스트 : " + userPS.getPhoto());
        return "user/myhome";
    }

    // @GetMapping("/comp/resume/scrap")
    // public String scrapResume(Model model) {
    // Comp compSession = (Comp) session.getAttribute("compSession");
    // List<CompScrapResumeRespDto> sList =
    // scrapRepository.findAllScrapByCompId(compSession.getCompId());
    // model.addAttribute("sDtos", sList);
    // return "comp/scrap";
    // }

    // public String main(Model model) {
    // User principal = (User) session.getAttribute("principal");
    // if (principal != null) {
    // // 유저의 관심카테고리 - 백엔드 -> 공고들의 position에서 검색
    // // 매칭이 되는 공고를 추천공고에 띄워준다
    // List<JobsMainRecommendRespDto> rDtos =
    // jobsRepository.findAlltoMainRecommend(principal.getUserId());
    // for (JobsMainRecommendRespDto jDto : rDtos) {
    // long dDay = DateUtil.dDay(jDto.getEndDate());
    // jDto.setLeftTime(dDay);
    // List<String> insertList = new ArrayList<>();
    // for (RequiredSkillWriteReqDto skill :
    // skillRepository.findByJobsSkill(jDto.getJobsId())) {
    // insertList.add(skill.getSkill());
    // }
    // jDto.setSkillList(insertList);
    // }
    // model.addAttribute("rDtos", rDtos);

    @GetMapping("/user/scrap")
    public String scarp(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            List<UserScrapRespDto> usDtos = scrapRepository.findAllScrapByUserId(principal.getUserId());
            for (UserScrapRespDto usDto : usDtos) {
                long dDay = DateUtil.dDay(usDto.getEndDate());
                usDto.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(usDto.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                usDto.setSkillList(insertList);
            }
            model.addAttribute("usDtos", usDtos);
        }
        User userPS = userRepository.findById(principal.getUserId());
        model.addAttribute("user", userPS);
        return "user/scrap";
    }

    @GetMapping("/user/offer")
    public String offer(Model model) {
        User principal = (User) session.getAttribute("principal");
        List<ApllyStatusUserRespDto> aDtos = applyRepository.findAllByUserIdtoApply(principal.getUserId());
        model.addAttribute("aDtos", aDtos);
        List<SuggestToUserRespDto> sDtos = suggestRepository.findAllGetOfferByUserId(principal.getUserId());
        model.addAttribute("sDtos", sDtos);
        User userPS = userRepository.findById(principal.getUserId());
        model.addAttribute("user", userPS);
        return "user/offer";
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/user/profileUpdateForm")
    public String profileUpdateForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            return "redirect:/user/login";
        }

        User userPS = userRepository.findById(principal.getUserId());

        model.addAttribute("user", userPS);

        return "user/profileUpdateForm";
    }

    @PutMapping("/user/profileUpdate")
    public ResponseEntity<?> profileUpdate(MultipartFile photo) throws Exception {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("로그인이 필요한 페이지 입니다.", HttpStatus.UNAUTHORIZED);
        }
        // System.out.println(profile.getContentType());
        // System.out.println(profile.getOriginalFilename());
        if (photo.isEmpty()) {
            throw new CustomApiException("사진이 전송 되지 않았습니다.");
        }

        User userPS = userService.프로필사진수정(photo, principal.getUserId());
        session.setAttribute("principal", userPS);
        // System.out.println("테스트 : "+userPS.getProfile());
        return new ResponseEntity<>(new ResponseDto<>(1, "프로필 수정 성공", null), HttpStatus.OK);
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