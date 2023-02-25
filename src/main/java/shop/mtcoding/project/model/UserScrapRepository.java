package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.userScrap.UserScrapReq.UserScrapReqDto;

@Mapper
public interface UserScrapRepository {
    public void findAll();
    public void findById(

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
