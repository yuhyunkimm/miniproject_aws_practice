package shop.mtcoding.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.dto.scrap.CompScrapReq.CompInsertScrapReqDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.service.ScrapService;
import shop.mtcoding.project.util.MockSession;

@Controller
public class ScrapController {

    @Autowired
    private ScrapService scrapService;

    @Autowired
    private HttpSession session;

    @PostMapping("/user/scrap/insert")
    public ResponseEntity<?> insertJobsScrap(@RequestBody UserInsertScrapReqDto sDto) {
        // MockSession.mockUser(session);
        if (sDto.getJobsId() == null) {
            throw new CustomApiException("공고 번호가 필요합니다.");
        }
        User principal = (User) session.getAttribute("principal");
        Integer result = scrapService.공고스크랩(principal.getUserId(), sDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 완료", result), HttpStatus.OK);
    }

    @DeleteMapping("/user/scrap/{id}/delete")
    public ResponseEntity<?> deleteJobsScrap(@PathVariable Integer id) {
        // MockSession.mockUser(session);
        if (id == null) {
            throw new CustomApiException("스크랩 번호가 필요합니다.");
        }
        User principal = (User) session.getAttribute("principal");
        scrapService.공고스크랩삭제(principal.getUserId(), id);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 삭제 완료", 0), HttpStatus.OK);
    }

    @PostMapping("/comp/scrap/insert")
    public ResponseEntity<?> insertResumeScrap(@RequestBody CompInsertScrapReqDto sDto) {
        // MockSession.mockComp(session);
        if (sDto.getResumeId() == null) {
            throw new CustomApiException("이력서 번호가 필요합니다.");
        }
        Comp compSession = (Comp) session.getAttribute("compSession");
        Integer result = scrapService.이력서스크랩(compSession.getCompId(), sDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 완료", result), HttpStatus.OK);
    }

    @DeleteMapping("/comp/scrap/{id}/delete")
    public ResponseEntity<?> deleteResumeScrap(@PathVariable Integer id) {
        // MockSession.mockComp(session);
        System.out.println("테스트 : "+ id);
        if (id == null) {
            throw new CustomApiException("스크랩 번호가 필요합니다.");
        }
        Comp compSession = (Comp) session.getAttribute("compSession");
        scrapService.이력서스크랩삭제(compSession.getCompId(), id);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 삭제 완료", 0), HttpStatus.OK);
    }
}
