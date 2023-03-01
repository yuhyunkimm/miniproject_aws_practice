package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.Jobs;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.Resume;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.SuggestRepository;

@Transactional(readOnly = true)
@Service
public class SuggestService {
    
    @Autowired
    private SuggestRepository suggestRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private JobsRepository jobsRepository;

    @Transactional
    public void 제안하기(SuggestReqDto sDto, Integer compId){
        if ( compId != sDto.getCompId()){
            throw new CustomApiException("정상적인 접근이 아닙니다." , HttpStatus.FORBIDDEN);
        }
        Resume resumePS = resumeRepository.findByResumeId(sDto.getResumeId());
        if ( resumePS == null){
            throw new CustomApiException("존재하지 않는 이력서 입니다.");
        }
        Jobs jobsPS = jobsRepository.findById(sDto.getJobsId());
        if ( jobsPS == null ){
            throw new CustomApiException("존재하지 않는 공고 입니다.");
        }
        try {
            suggestRepository.insert(sDto);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}