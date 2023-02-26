package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.ResumeRepository;

@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Transactional
    public void 글쓰기(ResumeWriteReqDto resumeWriteReqDto, Integer userId) {

        int result = resumeRepository.insert(resumeWriteReqDto);
        if (result != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
