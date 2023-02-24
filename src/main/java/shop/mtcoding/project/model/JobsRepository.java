package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsDetailRespDto;

@Mapper
public interface JobsRepository {
    public void findAll();
    public void findById(

    );
    public int insert(

    );
    public int updateById(

    );
    public int deleteById(

    );
    public List<JobsSearchReqDto> findByAddressAndCareerAndSkillAndDuty(
        @Param("jDto") JobsSearchReqDto jDto
        );
    public JobsDetailRespDto findByJobsDetail(
        @Param("jobsId") Integer jobsId
    );
}
