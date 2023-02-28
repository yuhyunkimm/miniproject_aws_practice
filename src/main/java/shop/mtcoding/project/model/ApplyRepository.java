package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;

@Mapper
public interface ApplyRepository {
    public void findAll();
    public void findById(

    );
    public int insert(
        @Param("aDto")  ApplyReqDto aDto
    );
    public int updateById(

    );
    public int deleteById(

    );
}
