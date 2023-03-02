package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.scrap.CompScrapReq.CompInsertScrapReqDto;
import shop.mtcoding.project.dto.scrap.CompScrapResp.CompScrapResumeRespDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;

@Mapper
public interface ScrapRepository {
    public void findAll();
    public UserScrap findByUserId(
        @Param("userScrapId") Integer userScrapId
    );

    public List<CompScrapResumeRespDto> findAllScrapByCompId(Integer compId);
    
    public CompScrap findByCompId(
        @Param("compScrapId") Integer compScrapId
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
