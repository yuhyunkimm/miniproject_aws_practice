package shop.mtcoding.project.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeSaveTempReqDto;
import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserSkillReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.UserSkillRepository;

@Service
public class ResumeService {

    @Autowired
    private UserSkillRepository userSkillRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Transactional
    public void 이력서쓰기(ResumeWriteReqDto resumeWriteReqDto, Integer userId) {

        if (resumeWriteReqDto.getUserId() != userId) {
            throw new CustomApiException("이력서를 작성할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        int result = resumeRepository.insert(resumeWriteReqDto);
        if (result != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        int result2 = userSkillRepository.insert(resumeWriteReqDto);
        if (result2 != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 이력서임시저장(ResumeWriteReqDto resumeWriteReqDto, Integer userId) {

        if (resumeWriteReqDto.getUserId() != userId) {
            throw new CustomApiException("이력서를 작성할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        int result = resumeRepository.insert(resumeWriteReqDto);
        if (result != 1) {
            throw new CustomApiException("이력서 임시저장 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        int result2 = userSkillRepository.insert(resumeWriteReqDto);
        if (result2 != 1) {
            throw new CustomApiException("이력서 임시저장 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
}
