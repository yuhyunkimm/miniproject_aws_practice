package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;

@Mapper
public interface RequiredSkillRepository {
    public void findAll();
    public void findById(

    );
    public int insert(
        @Param("rDto") JobsWriteReqDto rDto
    );
    public int updateById(
        @Param("rDto") JobsUpdateReqDto rDto
    );
    public int deleteById(

    );
}
