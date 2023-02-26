package shop.mtcoding.project.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.ResponseDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserDeleteScrapReqDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.service.ScrapService;

@Controller
public class ScrapController {
    

    @Autowired
    private ScrapService scrapService;

    @Autowired
    private HttpSession session;

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
    
    @PutMapping("/user/scrap/insert")
    public ResponseEntity<?> insertScrap(@RequestBody UserInsertScrapReqDto sDto){
        mockUserSession();
        System.out.println("테스트 : 스크랩추가요청 "+ sDto.getUserScrapId());
        if( sDto.getJobsId() == null ){
            throw new CustomApiException("공고 번호가 필요합니다.");
        }
        User principal = (User)session.getAttribute("principal");
        Integer result = scrapService.유저스크랩(principal.getUserId(), sDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 완료", result), HttpStatus.OK);
    }

    @DeleteMapping("/user/scrap/delete")
    public ResponseEntity<?> deleteScrap(@RequestBody UserDeleteScrapReqDto sDto){
        mockUserSession();
        System.out.println("테스트 : 스크랩삭제요청"+ sDto.getUserScrapId());
        User principal = (User)session.getAttribute("principal");
        scrapService.유저스크랩삭제(principal.getUserId(), sDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 삭제 완료", 0), HttpStatus.OK);
    }
}
