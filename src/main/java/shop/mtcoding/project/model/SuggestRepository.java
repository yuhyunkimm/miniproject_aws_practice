package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestReqDto;

@Mapper
public interface SuggestRepository {
    public void findAll();
    public void findById(

    );
    public int insert(
        @Param("sDto") SuggestReqDto sDto
    );
    public int updateById(

    );
    public int deleteById(

    );
}
