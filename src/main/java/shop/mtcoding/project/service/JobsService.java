package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.CompRepository;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.RequiredSkillRepository;

@Transactional(readOnly = true)
@Service
public class JobsService {
    
    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private CompRepository compRepository;

    @Autowired
    private RequiredSkillRepository requiredSkillRepository;

    public void 공고검색(JobsSearchReqDto jDto) {
    }

    @Transactional
    public Integer 공고작성(JobsWriteReqDto jDto, Integer compId) {
        Integer jobsId = 0;
        if ( compId != jDto.getCompId()){
            throw new CustomApiException("정상적인 접근이 아닙니다.", HttpStatus.FORBIDDEN);
        }
        try {
            compRepository.updateById(jDto);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 오류가 발생했습니다11.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        try {
            jobsRepository.insert(jDto);
            jobsId = jDto.getJobsId();
            System.out.println("테스트 : "+ jobsId);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 오류가 발생했습니다22.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        try {
            requiredSkillRepository.insert(jDto);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 오류가 발생했습니다33.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return jobsId;
    }
    
}
