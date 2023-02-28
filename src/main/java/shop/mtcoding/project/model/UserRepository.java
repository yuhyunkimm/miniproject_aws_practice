package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserUpdateReqDto;
import shop.mtcoding.project.dto.user.UserResp.UserDataRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserDeleteRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserSkillAndInterestDto;
import shop.mtcoding.project.dto.user.UserResp.UserSkillRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserUpdateRespDto;

@Mapper
public interface UserRepository {
        public List<User> findAll();

        public User findByUserEmail(@Param("email") String email);

        public UserDataRespDto findById(
                        @Param("uDto") UserUpdateRespDto userUpdateRespDto);

        public UserSkillAndInterestDto findByUserSkillAndInterest(
                        @Param("id") Integer id);

        public UserSkillRespDto findByUserSkill(
                        @Param("id") Integer id);

        public int insert(
                        @Param("uDto") UserJoinReqDto uDto);

        public int updateById(
                        @Param("uDto") UserUpdateReqDto uDto);

        public int deleteById(
                        @Param("uDto") UserDeleteRespDto uDto);

        public User findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
}
