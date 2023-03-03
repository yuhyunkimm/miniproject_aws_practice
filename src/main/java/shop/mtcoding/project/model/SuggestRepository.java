package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestReqDto;
import shop.mtcoding.project.dto.suggest.SuggestResp.SuggestToUserRespDto;

@Mapper
public interface SuggestRepository {
    public void findAll();
    public void findById();

    public List<SuggestToUserRespDto> findAllGetOfferByUserId(Integer userId);
    
    public int insert(
        @Param("sDto") SuggestReqDto sDto
    );
    public int updateById(

    );
    public int deleteById(

    );
}
