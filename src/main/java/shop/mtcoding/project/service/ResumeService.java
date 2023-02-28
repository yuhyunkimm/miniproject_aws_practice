package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeUpdateReqDto;
import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeSaveRespDto;
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

    @Transactional
    public void 이력서수정(ResumeUpdateReqDto resumeUpdateReqDto, Integer userId) {

        ResumeSaveRespDto resumePS = resumeRepository.findById(userId);
        if (resumePS == null) {
            throw new CustomApiException("해당 이력서를 찾을 수 없습니다.");
        }

        if (resumePS.getUserId() != userId) {
            throw new CustomApiException("이력서를 수정할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        try {
            int result = resumeRepository.updateById(resumeUpdateReqDto);
        } catch (Exception e) {
            throw new CustomApiException("이력서 수정에 실패하였습니다11111.", HttpStatus.INTERNAL_SERVER_ERROR);
            // TODO: handle exception
        }
        // if (result != 1) {
        // }
        try {
            int result2 = userSkillRepository.updateById(resumeUpdateReqDto);

        } catch (Exception e) {
            throw new CustomApiException("이력서 수정에 실패하였습니다2222222.", HttpStatus.INTERNAL_SERVER_ERROR);
            // TODO: handle exception
        }
        // if (result2 != 1) {
        // }

    }
}
