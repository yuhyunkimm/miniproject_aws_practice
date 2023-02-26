package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.userScrap.UserScrapReq.UserScrapReqDto;
import shop.mtcoding.project.dto.userScrap.UserScrapResp.UserScrapRespDto;

@Mapper
public interface UserScrapRepository {
    public void findAll();
    public List<UserScrapRespDto> findByUserId(
        @Param("userId") Integer userId
    );
    public int insert(
        @Param("userId") Integer userId,
        @Param("sDto") UserScrapReqDto sDto
    );
    public int updateById(

    );
    public int deleteByUserScrapId(
        @Param("userScrapId")  Integer userScrapId
    );
}
