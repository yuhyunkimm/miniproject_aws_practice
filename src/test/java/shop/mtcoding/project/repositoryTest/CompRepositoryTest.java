package shop.mtcoding.project.repositoryTest;

import java.sql.Timestamp;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.model.CompRepository;

@MybatisTest
public class CompRepositoryTest {

    @Autowired
    private CompRepository compRepository;

    @Test
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

}
// insert into user_tb ( email, password, name, birth, tel, address, created_at)
// values ( #{uDto.email}, #{uDto.password}, #{uDto.name}, #{uDto.birth},
// #{uDto.tel}, #{uDto.Address}, now());