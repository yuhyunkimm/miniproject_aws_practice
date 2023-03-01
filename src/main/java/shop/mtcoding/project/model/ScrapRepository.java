package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.scrap.CompScrapReq.CompInsertScrapReqDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;

@Mapper
public interface ScrapRepository {
    public void findAll();
    public UserScrap findByUserId(
        @Param("userScrapId") Integer userScrapId
    );
    public int insertbyUser(
        @Param("userId") Integer userId,
        @Param("sDto") UserInsertScrapReqDto sDto
    );

    public int insertbyComp(
        @Param("compId") Integer compId,
        @Param("sDto") CompInsertScrapReqDto sDto
    );

    public int updateById(

    );
    public int deleteByUserScrapId(
        @Param("userScrapId")  Integer userScrapId
    );

    public int deleteByCompScrapId(
        @Param("compScrapId")  Integer compScrapId
    );
}
