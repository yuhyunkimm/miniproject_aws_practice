package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.ApplyRepository;
import shop.mtcoding.project.model.Jobs;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.Resume;
import shop.mtcoding.project.model.ResumeRepository;

@Transactional(readOnly = true)
@Service
public class ApplyService {
    
    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private JobsRepository jobsRepository;

    @Transactional
    public void 지원하기(ApplyReqDto aDto, Integer userId){
        if ( userId != aDto.getUserId()){
            throw new CustomApiException("정상적인 접근이 아닙니다." , HttpStatus.FORBIDDEN);
        }
        Resume resumePS = resumeRepository.findByResumeId(aDto.getResumeId());
        if ( resumePS == null){
            throw new CustomApiException("존재하지 않는 이력서 입니다.");
        }
        Jobs jobsPS = jobsRepository.findById(aDto.getJobsId());
        if ( jobsPS == null ){
            throw new CustomApiException("존재하지 않는 공고 입니다.");
        }
        try {
            applyRepository.insert(aDto);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
