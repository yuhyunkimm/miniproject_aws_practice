package shop.mtcoding.project.repositoryTest;

import java.sql.Timestamp;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.model.CompRepository;

@MybatisTest
public class CompRepositoryTest {

    @Autowired
    private CompRepository compRepository;

    @Test
    @Transactional
    public void insert_test() throws Exception {
        // given
        CompJoinReqDto uDto = new CompJoinReqDto(
                25,
                "ssar25@nate.com",
                "1234",
                "ssar",
                "2000-01-01",
                "부산시 부산진구",
                new Timestamp(System.currentTimeMillis()));

        // when
        System.out.println("테스트 : " + compRepository.insert(uDto));

        // then

    }

    @Test
    @Transactional
    public void updateById_test() throws Exception {
        // given
        JobsUpdateReqDto jDto = new JobsUpdateReqDto();
        jDto.setCompId(1);
        jDto.setCompName("1234");
        jDto.setRepresentativeName("1234");
        jDto.setPhoto("213");
        jDto.setHomepage("124");
        // when
        System.out.println("테스트 : "+ compRepository.updateById(jDto) ); 
    
        // then
    
    }
}

