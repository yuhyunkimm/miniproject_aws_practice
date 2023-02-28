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
        private String Address;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class UserLoginReqDto {
        private Integer userId;
        private String email;
        private String password;
        private Timestamp createdAt;
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
        private String Address;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class UserSkillReqDto {
        private Integer userId;
        private String skillName1;
        private String skillName2;
        private String skillName3;
    }
}
