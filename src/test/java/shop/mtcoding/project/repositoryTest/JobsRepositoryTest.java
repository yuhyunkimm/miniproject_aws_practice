package shop.mtcoding.project.repositoryTest;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.model.JobsRepository;

@MybatisTest
public class JobsRepositoryTest {
    
    @Autowired
    private JobsRepository jobsRepository;

    @Test
    public void findByCheckBox_test() throws Exception {
        JobsCheckBoxReqDto j = new JobsCheckBoxReqDto();
        j.setCareer("");
        List<String> skill = Arrays.asList("React");
        // List<String> position = Arrays.asList("서울");

        System.out.println("테스트 : "+skill);
        // System.out.println("테스트 : "+position);
        j.setAddress(skill);
        // j.setAddress(position);
        List<JobsSearchRespDto> t = jobsRepository.findByCheckBox(j);
        System.out.println("테스트 : "+ t.size());
    }
}
        // private List<String> address;
        // private List<String> skill;
        // private List<String> position;
        // private String career;