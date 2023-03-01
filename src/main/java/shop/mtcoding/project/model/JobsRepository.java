package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsDetailRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsManageJobsRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsRequiredSkill;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSkillRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSuggestRespDto;

@Mapper
public interface JobsRepository {
    public List<Jobs> findAll();
    public Jobs findById(Integer jobsId);
    public List<JobsSkillRespDto> findAllByJobsAndSkill(Integer userId);

    public  List<JobsManageJobsRespDto> findByIdtoManageJobs(Integer compId);

    public List<JobsSuggestRespDto> findAllToReqSuggest(Integer compId);

    
    public int insert(
        @Param("jDto") JobsWriteReqDto jDto
    );
    public int updateById(
        @Param("jDto") JobsUpdateReqDto jDto
    );
    public int deleteById(

    );
    public List<JobsRequiredSkill> findByJobsRequiredSkill(
        @Param("id") Integer id
    ); 
    public List<JobsMainRespDto> findAlltoMain(Integer userId);

    public List<JobsSearchRespDto> findBySearch(
        @Param("jDto") JobsSearchReqDto jDto,
        @Param("userId") Integer userId
        );
    public List<JobsSearchRespDto> findByCheckBox(
        @Param("jDto") JobsCheckBoxReqDto jDto
        );
    public JobsDetailRespDto findByJobsDetail(
        @Param("jobsId") Integer jobsId,
        @Param("userId") Integer userId
    );
}
