package shop.mtcoding.project.repositoryTest;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.model.SkillRepository;

@MybatisTest
public class SkillRepositoryTest {
    
    @Autowired
    private SkillRepository skillRepository;
    
    @Test
    @Transactional
    public void insertRequiredSkill_test() throws Exception {
        // given
        List<String> sList = new ArrayList<>();
        sList.add( "java");
        sList.add( "java");
        sList.add( "java");
        Integer test = 2;
    
        // when
        System.out.println("테스트 : "+ skillRepository.insertRequiredSkill(sList,test)); 
    
        // then
        
    }
    @Test
    @Transactional
    public void insertResumeSkill_test() throws Exception {
        // given
        List<String> sList = new ArrayList<>();
        sList.add( "java");
        sList.add( "java2");
        sList.add( "jav3a");
        Integer test = 2;
    
        // when
        System.out.println("테스트 : "+ skillRepository.insertResumeSkill(sList,test)); 
    
        // then
        
    }
    // @Test
    @Transactional
    public void updateRequiredSkillById_test() throws Exception {
        // given
        // List<String> skillList = new ArrayList<>();
        // skillList.add("Java");
        // skillList.add("Spring");
        // rDto.setJobsId(1);

        // when
        // System.out.println("테스트 : "+ skillRepository.updateRequiredSkillById(skillList)); 
    
        // then
    
    }

    // @Test
    @Transactional
    public void updateResumeSkillById_test() throws Exception {
        // given
        // List<ResumeUpdateSkillDto> skillList = new ArrayList<>();
        // skillList.add(new ResumeUpdateSkillDto(2,"Java"));
        // skillList.add(new ResumeUpdateSkillDto(3,"Java"));
        // skillList.add(new ResumeUpdateSkillDto(5, "Java"));

        // rDto.setJobsId(1);

        // when
        // System.out.println("테스트 : "+ skillRepository.updateResumeSkillById(skillList)); 
    
        // then
    
    }
}
