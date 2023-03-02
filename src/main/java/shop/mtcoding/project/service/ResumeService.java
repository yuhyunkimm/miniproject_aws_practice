package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeUpdateReqDto;
import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.Resume;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.SkillRepository;

@Service
public class ResumeService {

    @Autowired
    private SkillRepository skillRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Transactional
    public Integer 이력서쓰기(ResumeWriteReqDto rDto, Integer userId) {
        Integer resumeId = 0;
        if (rDto.getUserId() != userId) {
            throw new CustomApiException("이력서를 작성할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        try {
            resumeRepository.insert(rDto);
            resumeId = rDto.getResumeId();
        } catch (Exception e) {
            throw new CustomApiException("이력서 작성 실패1111", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        try {
            skillRepository.insertResumeSkill(rDto.getSkillList(), resumeId);
        } catch (Exception e) {
            throw new CustomApiException("이력서 작성 실패222", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return resumeId;
    }

    // @Transactional
    // public Integer 이력서임시저장(ResumeWriteReqDto rDto, Integer userId) {
    // Integer resumeId = 0;
    // if (rDto.getUserId() != userId) {
    // throw new CustomApiException("이력서를 작성할 권한이 없습니다.", HttpStatus.FORBIDDEN);
    // }

    // try {
    // resumeRepository.insert(rDto);
    // resumeId = rDto.getResumeId();
    // } catch (Exception e) {
    // throw new CustomApiException("이력서 임시저장 실패",
    // HttpStatus.INTERNAL_SERVER_ERROR);
    // }

    // try {
    // skillRepository.insertResumeSkill(rDto.getSkillList(), resumeId);
    // } catch (Exception e) {
    // throw new CustomApiException("이력서 임시저장 실패",
    // HttpStatus.INTERNAL_SERVER_ERROR);
    // }
    // return resumeId;
    // }

    @Transactional
    public void 이력서수정(ResumeUpdateReqDto rDto, Integer userId) {
        Resume resumePS = resumeRepository.findByResumeId(rDto.getResumeId());
        if (resumePS == null) {
            throw new CustomApiException("해당 이력서를 찾을 수 없습니다.");
        }

        if (resumePS.getUserId() != userId) {
            throw new CustomApiException("이력서를 수정할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        try {
            resumeRepository.updateById(rDto);
        } catch (Exception e) {
            throw new CustomApiException("이력서 수정에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        try {
            skillRepository.deleteByResumeId(rDto.getResumeId());
        } catch (Exception e) {
            throw new CustomApiException("이력서 수정에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        if (!ObjectUtils.isEmpty(rDto.getSkillList())) {
            try {
                skillRepository.insertResumeSkill(rDto.getSkillList(), rDto.getResumeId());
                // skillRepository.updateResumeSkillById(rDto.getSkillList());
            } catch (Exception e) {
                throw new CustomApiException("이력서 수정에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
    }

}
