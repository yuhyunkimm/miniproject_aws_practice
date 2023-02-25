package shop.mtcoding.project.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;

@Transactional(readOnly = true)
@Service
public class JobsService {

    public void 공고검색(JobsSearchReqDto jDto) {
    }
    
}
