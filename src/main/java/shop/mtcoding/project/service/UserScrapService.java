package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.userScrap.UserScrapReq.UserScrapReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.model.Jobs;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.UserScrapRepository;

@Transactional(readOnly = true)
@Service
public class UserScrapService {
    
    @Autowired
    private UserScrapRepository userScrapRepository;

    @Autowired
    private JobsRepository jobsRepository;

    @Transactional
    public Integer 스크랩(Integer userId, UserScrapReqDto sDto ){
        Integer userScrapId = 0;
        if ( userId != sDto.getUserId()){
            throw new CustomApiException("권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        Jobs jobs = jobsRepository.findById(sDto.getJobsId());
        if ( jobs == null ){
            throw new CustomApiException("존재하지 않는 공고 입니다.");
        }
        try {
            userScrapRepository.insert(userId, sDto);
            userScrapId = sDto.getUserScrapId();
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return userScrapId;
    }
}
