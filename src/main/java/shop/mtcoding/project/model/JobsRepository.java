package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsDetailRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsRequiredSkill;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSkillRespDto;

@Mapper
public interface JobsRepository {
    public void findAll();
    public void findById(

    );
    public List<JobsSkillRespDto> findAllByJobsAndSkill();
    
    public int insert(

    );
    public int updateById(

    );
    public int deleteById(

    );
    public JobsRequiredSkill findByJobsRequiredSkill(
        @Param("id") Integer id
    ); 
    public List<JobsMainRespDto> findAlltoMain();

    public List<JobsSearchRespDto> findBySearch(
        @Param("jDto") JobsSearchReqDto jDto
        );
    public List<JobsSearchRespDto> findByCheckBox(
        @Param("jDto") JobsCheckBoxReqDto jDto
        );
    public JobsDetailRespDto findByJobsDetail(
        @Param("jobsId") Integer jobsId
    );
}
