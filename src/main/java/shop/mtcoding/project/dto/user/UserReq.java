package shop.mtcoding.project.dto.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
        private String address;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    @ToString
    public static class UserLoginReqDto {
        private Integer userId;
        private String email;
        private String password;
        private String rememberEmail;
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
        private String address;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class UserUpdatePhotoReqDto {
        private Integer userId;
        private String email;
        private String password;
        private String name;
        private String birth;
        private String tel;
        private String photo;
        private String address;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class UserPasswordReqDto {
        private Integer userId;
        private String password;
    }
}
