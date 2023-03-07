package shop.mtcoding.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;
import shop.mtcoding.project.dto.apply.ApplyReq.ApplyUpdateReqDto;
import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.service.ApplyService;

@Controller
public class ApplyController {

    @Autowired
    private ApplyService applyService;

    @Autowired
    private HttpSession session;

    @PostMapping("/user/apply/resume")
    public ResponseEntity<?> applyResume(@RequestBody ApplyReqDto aDto) {
        if (ObjectUtils.isEmpty(aDto.getJobsId())) {
            throw new CustomApiException("공고 아이디가 없습니다.");
        }
        if (ObjectUtils.isEmpty(aDto.getResumeId())) {
            throw new CustomApiException("이력서 아이디가 없습니다.");
        }
        if (ObjectUtils.isEmpty(aDto.getUserId())) {
            throw new CustomApiException("유저 아이디가 없습니다");
        }
        User principal = (User) session.getAttribute("principal");
        applyService.지원하기(aDto, principal.getUserId());

        return new ResponseEntity<>(new ResponseDto<>(1, "지원 성공", null), HttpStatus.CREATED);
    }

    @PutMapping("/comp/apply/update")
    public ResponseEntity<?> updateApply(@RequestBody ApplyUpdateReqDto aDto) {
        if (ObjectUtils.isEmpty(aDto.getCompId())) {
            throw new CustomApiException("기업아이디가 필요합니다.");
        }
        if (ObjectUtils.isEmpty(aDto.getApplyId())) {
            throw new CustomApiException("지원아이디가 필요합니다.");
        }
        if (ObjectUtils.isEmpty(aDto.getState())) {
            throw new CustomApiException("상태정보가 필요합니다.");
        }
        if (!(aDto.getState() == 1 || aDto.getState() == -1)) {
            throw new CustomApiException("상태정보가 다릅니다.");
        }
        Comp compSession = (Comp) session.getAttribute("compSession");
        Integer result = 0;
        if (aDto.getState() == 1) {
            applyService.합격(aDto, compSession.getCompId());
            result = 1;
        }
        if (aDto.getState() == -1) {
            applyService.불합격(aDto, compSession.getCompId());
            result = -1;
        }
        return new ResponseEntity<>(new ResponseDto<>(1, "지원자에게 답변했습니다.", result), HttpStatus.OK);
    }
}
