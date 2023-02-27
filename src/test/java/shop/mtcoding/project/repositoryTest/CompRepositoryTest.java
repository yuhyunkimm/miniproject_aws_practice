package shop.mtcoding.project.repositoryTest;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.model.CompRepository;

@MybatisTest
public class CompRepositoryTest {
    
    @Autowired
    private CompRepository compRepository;

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







// private String compName;
// private String representativeName;
// private String establishmentDate;
// private Integer employees;
// private String tel;