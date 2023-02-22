package shop.mtcoding.project.dto.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class UserResp {
    
    @Getter
    @Setter
    public static class UserDataRespDto {
        private Integer userId;
        private String email;
        private String password;
        private String name;
        private String birth;
        private String tel;
        private String photo;
        private String userAddress;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class UserUpdateRespDto {
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
    public static class UserDeleteRespDto {
        private Integer userId;
    }
}
