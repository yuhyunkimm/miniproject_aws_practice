package shop.mtcoding.project.repositoryTest;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.model.RequiredSkillRepository;

@MybatisTest
public class RequiredSkillRepositoryTest {
    
    @Autowired
    private RequiredSkillRepository RequiredSkillRepository;
    
    @Test
    @Transactional
    public void insert_test() throws Exception {
        // given
        JobsWriteReqDto jDto = new JobsWriteReqDto();   
        jDto.setJobsId(1);
        jDto.setSkill(List.of("123", "123", "123"));
    
        // when
        System.out.println("테스트 : "+ RequiredSkillRepository.insert(jDto)); 
    
        // then
    
    }

    @Test
    @Transactional
    public void updateById_test() throws Exception {
        // given
        JobsUpdateReqDto jDto = new JobsUpdateReqDto();   
        jDto.setJobsId(1);
        // jDto.setSkill(List.of("123", "123", "123"));
    
        // when
        System.out.println("테스트 : "+ RequiredSkillRepository.updateById(jDto)); 
    
        // then
    
    }
}
