package shop.mtcoding.project.repositoryTest;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.apply.ApplyReq.ApplyReqDto;
import shop.mtcoding.project.dto.apply.ApplyReq.ApplyUpdateReqDto;
import shop.mtcoding.project.model.Apply;
import shop.mtcoding.project.model.ApplyRepository;

@MybatisTest
public class ApplyRepositoryTest {
    
    @Autowired
    private ApplyRepository applyRepository;

    @Test
    @Transactional
    public void insert_test() throws Exception {
        // given
        ApplyReqDto aDto = new ApplyReqDto();
        aDto.setJobsId(1);
        aDto.setResumeId(1);
    
        // when
        System.out.println("테스트 : "+ applyRepository.insert(aDto)); 
    
        // then
        Apply apply = applyRepository.findByApplyId(1);
        assertThat(apply.getState()).isEqualTo("0");
    }

    @Test
    @Transactional
    public void updateById_test() throws Exception {
        // given
        ApplyUpdateReqDto aDto = new ApplyUpdateReqDto();
        aDto.setApplyId(1);
        aDto.setState(1);
    
        // when
        System.out.println("테스트 : "+ applyRepository.updateByApplyId(aDto));
    
        // then
        Apply apply = applyRepository.findByApplyId(1);
        assertThat(apply.getState()).isEqualTo("1");
    }
}
