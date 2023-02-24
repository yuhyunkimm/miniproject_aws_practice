package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserUpdateReqDto;
import shop.mtcoding.project.dto.user.UserResp.UserDataRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserDeleteRespDto;

@Mapper
public interface UserRepository {
    public List<User> findAll();

    public UserDataRespDto findById(
            @Param("uDto") UserDataRespDto uDto);

    public int insert(
            @Param("uDto") UserJoinReqDto uDto);

    public int updateById(
            @Param("uDto") UserUpdateReqDto uDto);

    public int deleteById(
            @Param("uDto") UserDeleteRespDto uDto);
}
