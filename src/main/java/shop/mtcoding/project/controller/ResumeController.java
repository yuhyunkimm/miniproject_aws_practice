package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.dto.resume.ResumeReq.ResumeUpdateReqDto;
import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeDetailRespDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeManageRespDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeSaveRespDto;
import shop.mtcoding.project.dto.skill.ResumeSkillResp.ResumeSkillRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserDataRespDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.SkillRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;
import shop.mtcoding.project.service.ResumeService;

@Controller
public class ResumeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private SkillRepository skillRepository;

    @Autowired
    private HttpSession session;

    @DeleteMapping("/resume/{id}")
    public ResponseEntity<?> deleteResume(@PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        resumeService.이력서삭제(id, principal.getUserId());
        return new ResponseEntity<>(new ResponseDto<>(1, "삭제성공", null), HttpStatus.OK);
    }

    @GetMapping("/user/resume") // 이력서관리
    public String manageResume(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
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

        // rList.forEach((s)->{System.out.println("테스트 : "+ s.toString());});

        return "resume/manageResume";
    }

    @GetMapping("/user/request/resume") // 공고에 지원할 이력서 불러오기
    public ResponseEntity<?> requestResume(Model model) {
        User principal = (User) session.getAttribute("principal");
        List<ResumeManageRespDto> rDtos = resumeRepository.findAllByUserId(principal.getUserId());
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 불러오기 성공", rDtos), HttpStatus.OK);
    }

    @PostMapping("/user/resume/write")
    public ResponseEntity<?> writeResume(@RequestBody ResumeWriteReqDto resumeWriteReqDto) {
        // System.out.println("테스트 : "+ resumeWriteReqDto.toString());
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (resumeWriteReqDto.getEducation() == null || resumeWriteReqDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력을 입력해주세요");
        }
        if (resumeWriteReqDto.getCareer() == null || resumeWriteReqDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력을 입력해주세요");
        }
        if (resumeWriteReqDto.getTitle() == null || resumeWriteReqDto.getTitle().isEmpty()) {
            throw new CustomApiException("제목을 입력해주세요");
        }
        if (!(resumeWriteReqDto.getState() == 0 || resumeWriteReqDto.getState() == 1)) {
            throw new CustomApiException("공개여부를 선택해주세요");
        }
        if (ObjectUtils.isEmpty(resumeWriteReqDto.getSkillList())) {
            throw new CustomApiException("기술을 선택해주세요");
        }

        Integer resumeId = resumeService.이력서쓰기(resumeWriteReqDto, principal.getUserId());

        return new ResponseEntity<>(new ResponseDto<>(1, "저장 완료!", resumeId), HttpStatus.CREATED);
    }

    @PutMapping("/user/resume/update")
    public ResponseEntity<?> saveTempResume(@RequestBody ResumeUpdateReqDto resumeWriteReqDto) {

        // System.out.println("테스트 : "+ resumeWriteReqDto.toString());

        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (resumeWriteReqDto.getEducation() == null || resumeWriteReqDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력을 입력해주세요");
        }
        if (resumeWriteReqDto.getCareer() == null || resumeWriteReqDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력을 입력해주세요");
        }
        if (resumeWriteReqDto.getTitle() == null || resumeWriteReqDto.getTitle().isEmpty()) {
            throw new CustomApiException("제목을 입력해주세요");
        }
        if (!(resumeWriteReqDto.getState() == 0 || resumeWriteReqDto.getState() == 1)) {
            throw new CustomApiException("공개여부를 선택해주세요");
        }
        if (ObjectUtils.isEmpty(resumeWriteReqDto.getSkillList())) {
            throw new CustomApiException("기술을 선택해주세요");
        }

        resumeService.이력서수정(resumeWriteReqDto, principal.getUserId());

        return new ResponseEntity<>(new ResponseDto<>(1, "저장 완료!", null), HttpStatus.CREATED);
    }

    @GetMapping("/user/resume/write")
    public String writeResumeForm(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        UserDataRespDto userPS = userRepository.findByUserId(principal.getUserId());
        model.addAttribute("rDto", userPS);
        return "resume/writeResumeForm";
    }

    @GetMapping("/user/resume/{id}/update")
    public String updateResumeForm(@PathVariable Integer id, Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        ResumeSaveRespDto rDto = resumeRepository.findById(id);
        List<String> insertList = new ArrayList<>();
        for (ResumeSkillRespDto skill : skillRepository.findByResumeSkill(rDto.getResumeId())) {
            insertList.add(skill.getSkill());
            rDto.setSkillList(insertList);
        }
        model.addAttribute("rDto", rDto);

        return "resume/updateResumeForm";
    }

    // 공개 이력서
    @GetMapping("/resume/{id}")
    public String resumeDetail(@PathVariable Integer id, Model model) {
        ResumeDetailRespDto rDto = resumeRepository.findDetailPublicResumebyById(id);
        List<String> insertList = new ArrayList<>();
        for (ResumeSkillRespDto skill : skillRepository.findByResumeSkill(rDto.getResumeId())) {
            insertList.add(skill.getSkill());
            rDto.setSkillList(insertList);
        }

        model.addAttribute("rDto", rDto);
        return "/resume/resumeDetail";
    }

}

// 🟨 공개하면 기업이 접근 가능 🟨
// 🟨 이력서번호 "/resume/이력서번호"

// 🟩 🔐 유저권한필요 🔐 🟩
// 🟩 이력서관리 "/user/resume"
// 🟩 이력서작성 "/user/resume/write"
// 🟩 이력서수정 "/user/resume/이력서번호/update"