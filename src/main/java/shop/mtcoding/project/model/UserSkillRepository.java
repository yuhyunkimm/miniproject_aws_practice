package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.user.UserReq.UserSkillReqDto;

@Mapper
public interface UserSkillRepository {
    public void findAll();

    public void findById(

    );

    public int insert(@Param("uDto") UserSkillReqDto uDto);

    public int updateById();

    public int deleteById();
}
