package shop.mtcoding.project.repositoryTest;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;
import shop.mtcoding.project.model.ApplyRepository;

@MybatisTest
public class ApplyRepositoryTest {
    
    @Autowired
    private ApplyRepository applyRepository;

    @Test
    public void insert_test() throws Exception {
        // given
        ApplyReqDto aDto = new ApplyReqDto();
        aDto.setJobsId(1);
        aDto.setResumeId(1);
    
        // when
        System.out.println("테스트 : "+ applyRepository.insert(aDto)); 
    
        // then
    }
}
