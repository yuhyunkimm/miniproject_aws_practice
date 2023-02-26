package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;

import shop.mtcoding.project.dto.resume.ResumeResp.ResumeRecommendRespDto;

@Mapper
public interface ResumeRepository {
        public void findAll();

        public void findById( );
        public List<ResumeRecommendRespDto> findAllResumebyPublic();

        public int insertTemp(
            @Param("rDto") ResumeWriteReqDto rDto
        );

        public int insert(
            @Param("rDto") ResumeWriteReqDto rDto
        );

        public int updateById(
            @Param("rDto") ResumeWriteReqDto rDto);

        public int deleteById(

        );
}
