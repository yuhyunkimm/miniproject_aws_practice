package shop.mtcoding.project.repositoryTest;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.interest.InterestReq.InterestChangeReqDto;
import shop.mtcoding.project.dto.interest.InterestResp.InterestChangeRespDto;
import shop.mtcoding.project.model.InterestRepository;

@MybatisTest
public class InterestRepositoryTest {
    
    @Autowired
    private InterestRepository interestRepository;

    @Test
    @Transactional
    public void insert_test() throws Exception {
        // given
        List<String> inter = new ArrayList<>();
        inter.add("박ㅇ");
        inter.add("서버");
        inter.add("개발자");
        InterestChangeReqDto iDto = new InterestChangeReqDto();
        iDto.setUserId(1);
        iDto.setInterestList(inter);
        interestRepository.insert(iDto);
    
        // when
    
        // then
        List<InterestChangeRespDto> interest =  interestRepository.findById(1);
        for (InterestChangeRespDto interestChangeRespDto : interest) {
            System.out.println("테스트 : "+ interestChangeRespDto);
        }
        // assertThat(interest.get(5).getInterestCt()).isEqualTo("서버");
    }

    @Test
    @Transactional
    public void delete_test() throws Exception {
        // given
        
        // when
        interestRepository.deleteById(1);
    
        // then
        assertThat(interestRepository.findById(1).size()).isEqualTo(0); 
    }
}
