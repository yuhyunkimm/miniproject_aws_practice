package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsWriteRespDto;
import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;

@Mapper
public interface CompRepository {
    public List<Comp> findAll();
    
    public Comp findByCompEmail(@Param("email") String email);
    
    public JobsWriteRespDto findById(Integer CompId);

    public int insert(
            @Param("uDto") CompJoinReqDto uDto);

    public int updateById(
        @Param("cDto")  JobsUpdateReqDto cDto
    );

    public int deleteById(

    );  
}
