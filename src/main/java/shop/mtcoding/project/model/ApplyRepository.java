package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;
import shop.mtcoding.project.dto.apply.ApplyResp.ApllyStatusRespDto;

@Mapper
public interface ApplyRepository {
    public void findAll();

    public void findById( );

    public List<ApllyStatusRespDto> findAllByCompIdtoApply(Integer compId);

    public int insert(
        @Param("aDto")  ApplyReqDto aDto
    );
    public int updateById(

    );
    public int deleteById(

    );
}
