package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;

@Mapper
public interface CompRepository {
    public void findAll();
    public void findById(

    );
    public int insert(
        @Param("cDto")  JobsWriteReqDto cDto
    );
    public int updateById(
        @Param("cDto")  JobsUpdateReqDto cDto
    );
    public int deleteById(

    );
}
