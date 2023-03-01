package shop.mtcoding.project.repositoryTest;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSuggestRespDto;
import shop.mtcoding.project.model.JobsRepository;

@MybatisTest
public class JobsRepositoryTest {
    
    @Autowired
    private JobsRepository jobsRepository;

    @Test
    @Transactional
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

    @Test
    @Transactional
    public void findAlltoMain_test() throws Exception {
        //given
        Integer test = null ;

        //when
        List<JobsMainRespDto> t = jobsRepository.findAlltoMain(test);

        //then
        System.out.println("테스트 : "+ t.size());
    }

    @Test
    @Transactional
    public void findByJobsDetail_test() throws Exception {
        //given
        Integer test = null ;

        //when
        List<JobsMainRespDto> t = jobsRepository.findAlltoMain(test);

        //then
        System.out.println("테스트 : "+ t.size());
    }
    



    @Test
    @Transactional
    public void insert_test() throws Exception {
        // given
        JobsWriteReqDto jDto = new JobsWriteReqDto();   
        jDto.setAddress("123");
        jDto.setTitle("123");
        jDto.setContent("123");
        jDto.setPhoto("123");
        jDto.setPosition("123");
        jDto.setEducation("123");
        jDto.setEndDate(new Timestamp(System.currentTimeMillis()));
        jDto.setCareer("123");
        jDto.setCompId(123);
        // jDto.setHomepage("123");
        jDto.setReceipt("123");
       
        // when
        System.out.println("테스트 : "+jobsRepository.insert(jDto)); 
    
        // then
    
    }

    @Test
    @Transactional
    public void updateById_test() throws Exception {
        // given
        JobsUpdateReqDto jDto = new JobsUpdateReqDto();   
        jDto.setJobsId(1);
        jDto.setAddress("123");
        jDto.setTitle("123");
        jDto.setContent("123");
        jDto.setPhoto("123");
        jDto.setPosition("123");
        jDto.setEducation("123");
        jDto.setEndDate(new Timestamp(System.currentTimeMillis()));
        jDto.setCareer("123");
        jDto.setCompId(123);
        // jDto.setHomepage("123");
        jDto.setReceipt("123");
       
        // when
        System.out.println("테스트 : "+jobsRepository.updateById(jDto)); 
    
        // then
    
    }

    @Test
    @Transactional
    public void findAllToReqSuggest_test() throws Exception {
        // given
        Integer test = null;
        // when
        List<JobsSuggestRespDto> sList = jobsRepository.findAllToReqSuggest(test);

        // then
        sList.forEach((s)->{System.out.println("테스트 : "+ s.toString());});
        }
}
