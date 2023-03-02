package shop.mtcoding.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.UserRepository;
import shop.mtcoding.project.util.MockSession;

@Controller
public class MainController {

    @Autowired
    private HttpSession session;

    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/sample")
    public String sample() {

        return "main/sample";
    }

    // 주소입력을 누르면 매핑에 연결된 jsp 사용
    // @PostMapping("/juso")
    // public String juso(HttpServletRequest request){

    // System.out.println("테스트 : "+roadFullAddr); // 부산광역시 연제구 고분로13번길 25,
    // 2405호(연산동, 연산동 쌍용아파트)
    // System.out.println("테스트 : "+siNm); // 부산광역시
    // System.out.println("테스트 : "+sggNm); // 연제구
    // System.out.println("테스트 : "+emdNm); // 연산동

    // return "";
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
        MockSession.mockUser(session);
        // User principal = (User) session.getAttribute("principal");
        // if (principal != null) {
        // // 유저 아이디로 이력서 존재 확인 -> 이력서 아이디중에서 랜덤으로 ?
        // // 이력서 아이디로 해당 이력서의 스킬리스트를 꺼낸다
        // // 공고중에서
        // UserSkillRespDto userSkillPS =
        // userRepository.findByUserSkill(principal.getUserId());
        // List<String> skillList = Arrays.asList(userSkillPS.getSkillName1(),
        // userSkillPS.getSkillName2(),
        // userSkillPS.getSkillName3());
        // Set<String> set = new HashSet<>(skillList);

        // // 스크랩아이디 때문에 유저 아이디를 넣음
        // // 결과를 리스트에 저장
        // // 스킬은 따로 빼서 저장
        // // 이력서 스킬 = 공고의 스킬이 많이 매칭되는 순으로 추천공고
        // List<JobsMainRespDto> JobsList =
        // jobsRepository.findAlltoMain(principal.getUserId());
        // List<JobsMainRespDto> threeMatchRecommend = new ArrayList<>();
        // List<JobsMainRespDto> twoMatchRecommend = new ArrayList<>();
        // List<JobsMainRespDto> oneMatchRecommend = new ArrayList<>();
        // List<JobsMainRespDto> recommendListDto = new ArrayList<>();
        // for (JobsMainRespDto jsPS : JobsList) {
        // if (set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2())
        // && set.contains(jsPS.getSkillName3())) {
        // threeMatchRecommend.add(jsPS);
        // continue;
        // }
        // if ((set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2())
        // && !set.contains(jsPS.getSkillName3())) ||
        // (set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2())
        // && set.contains(jsPS.getSkillName3()))
        // ||
        // (!set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2())
        // && set.contains(jsPS.getSkillName3()))) {
        // twoMatchRecommend.add(jsPS);
        // continue;
        // }
        // if ((set.contains(jsPS.getSkillName1()) &&
        // !set.contains(jsPS.getSkillName2())
        // && !set.contains(jsPS.getSkillName3())) ||
        // (!set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2())
        // && !set.contains(jsPS.getSkillName3()))
        // ||
        // (!set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2())
        // && set.contains(jsPS.getSkillName3()))) {
        // oneMatchRecommend.add(jsPS);
        // continue;
        // }
        // }
        // recommendListDto.addAll(threeMatchRecommend);
        // recommendListDto.addAll(twoMatchRecommend);
        // recommendListDto.addAll(oneMatchRecommend);
        // // recommendListDto.addAll(JobsList);
        // model.addAttribute("rDtos", recommendListDto);
        // List<JobsMainRespDto> jDtos =
        // jobsRepository.findAlltoMain(principal.getUserId());
        // model.addAttribute("jDtos", jDtos);
        // } else {
        // List<JobsMainRespDto> jDtost = jobsRepository.findAlltoMain(null);
        // model.addAttribute("rDtos", jDtost);
        // List<JobsMainRespDto> jDtosb = jobsRepository.findAlltoMain(null);
        // model.addAttribute("jDtos", jDtosb);
        // }

        return "main/main";
    }

    @GetMapping("/help")
    public String help() {
        return "main/help";
    }
}

// ⬜ 메인 "/"
// ⬜ 고객센터 "/help"
