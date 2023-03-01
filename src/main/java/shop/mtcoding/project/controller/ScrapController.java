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
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;
import shop.mtcoding.project.exception.CustomApiException;
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
    public ResponseEntity<?> insertScrap(@RequestBody UserInsertScrapReqDto sDto) {
        System.out.println("테스트 : "+ sDto.toString());
        MockSession.mockUser(session);
        if (sDto.getJobsId() == null) {
            throw new CustomApiException("공고 번호가 필요합니다.");
        }
        User principal = (User) session.getAttribute("principal");
        Integer result = scrapService.유저스크랩(principal.getUserId(), sDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 완료", result), HttpStatus.OK);
    }

    @DeleteMapping("/user/scrap/{id}/delete")
    public ResponseEntity<?> deleteScrap(@PathVariable Integer id) {
        MockSession.mockUser(session);
        if (id == null) {
            throw new CustomApiException("스크랩 번호가 필요합니다.");
        }
        User principal = (User) session.getAttribute("principal");
        scrapService.유저스크랩삭제(principal.getUserId(), id);
        return new ResponseEntity<>(new ResponseDto<>(1, "스크랩 삭제 완료", 0), HttpStatus.OK);
    }
}
