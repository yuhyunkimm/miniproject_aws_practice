package shop.mtcoding.project.repositoryTest;

import java.sql.Timestamp;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.model.UserRepository;

@MybatisTest
public class UserRepositoryTest {
    
    @Autowired
    private UserRepository userRepository;

    @Test
    public void insert_test() throws Exception{
        //given
        UserJoinReqDto uDto = new UserJoinReqDto(
            25,
            "ssar25@nate.com",
            "1234",
            "ssar",
            "2000-01-01",
            "010-1234-1234",
            "부산시 부산진구",
            new Timestamp(System.currentTimeMillis())
        );

        //when
        System.out.println("테스트 : "+ userRepository.insert(uDto));

        //then

    }

}
        // insert into user_tb ( email, password, name, birth, tel, address, created_at)
        //     values ( #{uDto.email}, #{uDto.password}, #{uDto.name}, #{uDto.birth}, #{uDto.tel}, #{uDto.Address}, now());