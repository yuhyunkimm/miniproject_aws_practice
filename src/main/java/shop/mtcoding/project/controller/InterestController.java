package shop.mtcoding.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.dto.interest.InterestReq.InterestChangeReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.service.InterestService;

@Controller
public class InterestController {
    
    @Autowired
    private InterestService InterestService;
    
    @Autowired
    private HttpSession session;
    
    @PutMapping("/user/interest/change")
    public ResponseEntity<?> changeInterest(@RequestBody InterestChangeReqDto iDto){
        // System.out.println("테스트 : "+ iDto);
        if(ObjectUtils.isEmpty(iDto.getUserId())){
            throw new CustomApiException("유저아이디가 필요합니다.");
        }
        User pricipal = (User)session.getAttribute("principal");
        InterestService.관심수정(iDto, pricipal.getUserId());
        return new ResponseEntity<>(new ResponseDto<>(1, "업데이트 완료", null), HttpStatus.CREATED);
    }
}
