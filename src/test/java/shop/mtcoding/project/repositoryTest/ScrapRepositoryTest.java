package shop.mtcoding.project.repositoryTest;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.scrap.CompScrapReq.CompInsertScrapReqDto;
import shop.mtcoding.project.dto.scrap.UserScrapReq.UserInsertScrapReqDto;
import shop.mtcoding.project.model.ScrapRepository;

@MybatisTest
public class ScrapRepositoryTest {
    
    @Autowired
    private ScrapRepository scrapRepository;

    @Test
    @Transactional
    public void deleteByUserScrapId_test() throws Exception {
        //given
        Integer userScrapId = 1;
        //when
        System.out.println("테스트 : "+scrapRepository.deleteByUserScrapId(userScrapId)); 

        //then
    }

    @Test
    @Transactional
    public void deleteByCompScrapId_test() throws Exception {
        //given
        Integer compScrapId = 1;
        //when
        System.out.println("테스트 : "+scrapRepository.deleteByCompScrapId(compScrapId)); 

        //then
    }

    @Test
    @Transactional
    public void insertbyUser_test() throws Exception {
        //given
        Integer id = 1;
        UserInsertScrapReqDto sDto = new UserInsertScrapReqDto();
        sDto.setUserId(1);
        sDto.setJobsId(3);
        //when
        System.out.println("테스트 : "+scrapRepository.insertbyUser(id, sDto)); 

        //then
    }

    @Test
    @Transactional
    public void insertbyComp_test() throws Exception {
        //given
        Integer id = 1;
        CompInsertScrapReqDto sDto = new CompInsertScrapReqDto();
        sDto.setCompId(1);
        sDto.setResumeId(2);
        //when
        System.out.println("테스트 : "+scrapRepository.insertbyComp(id,sDto)); 

        //then
    }

    
}
// insertbyComp