package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;

@Mapper
public interface ScrapRepository {
    public void findAll();
    public UserScrap findByUserId(
        @Param("userId") Integer userId
    );
    public int insertbyUser(
        @Param("userId") Integer userId,
        @Param("sDto") UserInsertScrapReqDto sDto
    );
    public int updateById(

    );
    public int deleteByUserScrapId(
        @Param("userScrapId")  Integer userScrapId
    );
}
