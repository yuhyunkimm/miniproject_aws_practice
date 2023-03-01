package shop.mtcoding.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;
import shop.mtcoding.project.dto.user.ResponseDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.service.ApplyService;

@Controller
public class ApplyController {
    
    @Autowired
    private ApplyService applyService;

    @Autowired
    private HttpSession session;

    @PostMapping("/apply/resume")
    public ResponseEntity<?> applyResume(@RequestBody ApplyReqDto aDto){
        if ( ObjectUtils.isEmpty(aDto.getJobsId())){
            throw new CustomApiException("공고 아이디가 없습니다.") ;
        }
        if ( ObjectUtils.isEmpty(aDto.getResumeId())){
            throw new CustomApiException("이력서 아이디가 없습니다.");
        }
        if ( ObjectUtils.isEmpty(aDto.getUserId())){
            throw new CustomApiException("유저 아이디가 없습니다");
        }
        User principal = (User) session.getAttribute("principal");
        applyService.지원하기(aDto, principal.getUserId());
        
        return new ResponseEntity<>(new ResponseDto<>(1, "지원 성공", null), HttpStatus.CREATED);
    }
    
}
