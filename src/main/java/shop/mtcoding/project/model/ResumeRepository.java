package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeUpdateReqDto;
import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeDetailRespDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeManageRespDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeRecommendRespDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeSaveRespDto;

@Mapper
public interface ResumeRepository {
        public void findAll();

        public ResumeSaveRespDto findById(Integer resumeId);

        public Resume findByResumeId(Integer resumeId);

        public List<ResumeManageRespDto> findAllByUserId();

        public List<ResumeManageRespDto> findAllWithUserById(Integer userId);

        public List<ResumeRecommendRespDto> findAllResumebyPublic();
        public ResumeDetailRespDto findDetailPublicResumebyById(Integer resumeId);

        public int insert(
                @Param("rDto") ResumeWriteReqDto rDto);

        public int updateById(
                @Param("rDto") ResumeUpdateReqDto rDto);

        public int deleteById();
}
