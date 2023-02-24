package shop.mtcoding.project.dto.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class UserReq {

    @Getter
    @Setter
    public static class UserJoinReqDto {
        private Integer userId;
        private String email;
        private String password;
        private String name;
        private String birth;
        private String tel;
        private String userAddress;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class UserUpdateReqDto {
        private Integer userId;
        private String email;
        private String password;
        private String name;
        private String birth;
        private String tel;
        private String userAddress;
        private Timestamp createdAt;
    }
}
