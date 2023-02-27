package shop.mtcoding.project.repositoryTest;

import java.util.ArrayList;
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
        JobsWriteReqDto rDto = new JobsWriteReqDto();
        List<String> list = new ArrayList<>();
        list.add("23");
        list.add("23");
        list.add("23");
        rDto.setSkill(list);
        rDto.setJobsId(1);
    
        // when
        System.out.println("테스트 : "+ RequiredSkillRepository.insert(rDto)); 
    
        // then
    
    }

    @Test
    @Transactional
    public void updateById_test() throws Exception {
        // given
        JobsUpdateReqDto rDto = new JobsUpdateReqDto();
        List<String> list = new ArrayList<>();
        list.add("23");
        list.add("23");
        list.add("23");
        rDto.setSkill(list);
        rDto.setJobsId(1);

        // when
        System.out.println("테스트 : "+ RequiredSkillRepository.updateById(rDto)); 
    
        // then
    
    }
}
