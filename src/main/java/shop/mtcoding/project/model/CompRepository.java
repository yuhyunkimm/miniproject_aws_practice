package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsWriteRespDto;

@Mapper
public interface CompRepository {
    public void findAll();
    public JobsWriteRespDto findById(Integer CompId);
    public int insert(
        
    );
    public int updateById(
        @Param("cDto")  JobsUpdateReqDto cDto
    );
    public int deleteById(

    );
}
