package shop.mtcoding.project.repositoryTest;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestReqDto;
import shop.mtcoding.project.dto.suggest.SuggestReq.SuggestUpdateReqDto;
import shop.mtcoding.project.model.SuggestRepository;

@MybatisTest
public class SuggestRepositoryTest {
    
    @Autowired
    private SuggestRepository suggestRepository;

    @Test
    @Transactional
    public void insert_test() throws Exception {
        // given
        SuggestReqDto sDto = new SuggestReqDto();
        sDto.setJobsId(1);
        sDto.setResumeId(1);
    
        // when
        System.out.println("테스트 : "+ suggestRepository.insert(sDto)); 
    
        // then
        }

    @Test
    @Transactional
    public void updateBySuggestId_test() throws Exception {
        // given
        SuggestUpdateReqDto sDto = new SuggestUpdateReqDto();
        sDto.setState(1);
        sDto.setSuggestId(1);
        sDto.setUserId(1);
    
        // when
        System.out.println("테스트 : "+ suggestRepository.updateBySuggestId(sDto));
    
        // then
        
    }
}