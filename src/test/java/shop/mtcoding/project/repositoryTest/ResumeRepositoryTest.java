package shop.mtcoding.project.repositoryTest;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.dto.resume.ResumeReq.ResumeWriteReqDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeRecommendRespDto;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.UserSkillRepository;

@MybatisTest
public class ResumeRepositoryTest {

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private UserSkillRepository userSkillRepository;

    @Test
    public void insert_test() throws Exception {
        // given
        ResumeWriteReqDto resumeWriteReqDto = new ResumeWriteReqDto();
        resumeWriteReqDto.setUserId(1);
        resumeWriteReqDto.setTitle("벡엔드 이력서");
        resumeWriteReqDto.setContent("백엔드 이력서의 내용입니다.");
        resumeWriteReqDto.setEducation("고졸");
        resumeWriteReqDto.setCareer("신입");
        resumeWriteReqDto.setLink("블로그 주소");
        resumeWriteReqDto.setState(1);

        // when
        System.out.println("테스트 : " + resumeRepository.insert(resumeWriteReqDto));

        // then

    }

    @Test
    public void insert2_test() throws Exception {
        // given
        ResumeWriteReqDto resumeWriteReqDto = new ResumeWriteReqDto();
        resumeWriteReqDto.setSkillName1("sdfdf");
        resumeWriteReqDto.setSkillName2("sdfdf");
        resumeWriteReqDto.setSkillName3("sdfdf");
        resumeWriteReqDto.setUserId(1);

        // when
        int result2 = userSkillRepository.insert(resumeWriteReqDto);

        // then
        System.out.println(result2);
    }
    @Test
    public void findAllResumebyPublic_test() throws Exception {
        // given
        
    
        // when
        List<ResumeRecommendRespDto> rList = resumeRepository.findAllResumebyPublic();

        // then
        rList.forEach((s)->{System.out.println("테스트 : "+ s.toString());});
    }   
}
