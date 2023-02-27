package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;

@Mapper
public interface UserSkillRepository {
    public void findAll();

    public void findById(

    );

    public int insert(@Param("rDto") ResumeWriteReqDto rDto);

    public int updateById();

    public int deleteById();
}
