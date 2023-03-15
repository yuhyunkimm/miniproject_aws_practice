package shop.mtcoding.project.repositoryTest;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.model.NotifyRepository;

@MybatisTest
public class NotifyRepositoryTest {
    
    @Autowired
    private NotifyRepository notifyRepository;

    @Test
    public void insert_test() throws Exception {
        // given
        notifyRepository.insert(8,null);
    
        // when
    
    
        // then
    
    }
}
