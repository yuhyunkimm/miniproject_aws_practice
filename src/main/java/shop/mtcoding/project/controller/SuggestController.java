package shop.mtcoding.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestReqDto;
import shop.mtcoding.project.dto.user.ResponseDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.service.SuggestService;

public class SuggestController {
    
    @Autowired
    private SuggestService suggestService;

    @Autowired
    private HttpSession session;

    @PostMapping("/suggest/jobs")
    public ResponseEntity<?> suggestJobs(@RequestBody SuggestReqDto sDto){
        if ( ObjectUtils.isEmpty(sDto.getJobsId())){
            throw new CustomApiException("공고 아이디가 없습니다.") ;
        }
        if ( ObjectUtils.isEmpty(sDto.getResumeId())){
            throw new CustomApiException("이력서 아이디가 없습니다.");
        }
        if ( ObjectUtils.isEmpty(sDto.getCompId())){
            throw new CustomApiException("회사 아이디가 없습니다");
        }
        Comp compSession = (Comp) session.getAttribute("principal");
        suggestService.제안하기(sDto, compSession.getCompId());
        
        return new ResponseEntity<>(new ResponseDto<>(1, "제안 성공", null), HttpStatus.CREATED);
    }
}
