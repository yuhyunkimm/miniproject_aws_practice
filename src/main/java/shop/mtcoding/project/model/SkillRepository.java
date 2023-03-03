package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.skill.RequiredSkillReq.RequiredSkillWriteReqDto;
import shop.mtcoding.project.dto.skill.ResumeSkillResp.ResumeSkillRespDto;

@Mapper
public interface SkillRepository {
    public void findAll();

    public List<ResumeSkill> findByResumeId(Integer resumeId);

    public List<RequiredSkillWriteReqDto> findByJobsSkill(Integer jobsId);

    public List<ResumeSkillRespDto> findByResumeSkill(Integer resumeId);

        public List<RequiredSkillWriteReqDto> findByJobsSkill(Integer jobsId);

        public int insertRequiredSkill(
                        @Param("skillList") List<String> skillList,
                        @Param("jobsId") Integer jobsId);

        public int insertResumeSkill(
                        @Param("skillList") List<String> skillList,
                        @Param("resumeId") Integer resumeId);

        public int updateRequiredSkillById(
                        @Param("skillList") List<String> skillList);

        public int updateResumeSkillById(
                        @Param("skillList") List<String> skillList);

        public int deleteByResumeId(Integer resumeId);

        public int deleteByJobsId(Integer jobsId);

}
