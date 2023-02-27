package shop.mtcoding.project.dto.comp;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class CompReq {

    @Getter
    @Setter
    public static class CompJoinReqDto {
        private Integer compId;
        private String email;
        private String password;
        private String compName;
        private String businessNumber;
        private String tel;
        private String compAddress;
        private String homePage;
        private Timestamp createdAt;
    }
}
