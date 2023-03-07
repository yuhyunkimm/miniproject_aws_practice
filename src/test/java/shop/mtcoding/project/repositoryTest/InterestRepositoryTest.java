package shop.mtcoding.project.repositoryTest;

import java.util.ArrayList;
import java.util.List;

import org.assertj.core.util.Arrays;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import shop.mtcoding.project.dto.interest.InterestReq.InterestChangeReqDto;
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
    
    }
}
