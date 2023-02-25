package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;

@Mapper
public interface ResumeRepository {
        public void findAll();

        public void findById(

        );

        public int insertTemp(
                        @Param("rDto") ResumeWriteReqDto rDto);

        public int insert(
                        @Param("rDto") ResumeWriteReqDto rDto);

        public int updateById(
                        @Param("rDto") ResumeWriteReqDto rDto);

        public int deleteById(

        );
}
