package shop.mtcoding.project.repositoryTest;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.model.ScrapRepository;

@MybatisTest
public class ScrapRepositoryTest {
    
    @Autowired
    private ScrapRepository scrapRepository;

    @Test
    public void deleteByUserScrapId_test() throws Exception {
        //given
        Integer userScrapId = 1;
        //when
        System.out.println("테스트 : "+scrapRepository.deleteByUserScrapId(userScrapId)); 

        //then
    }

    
}
