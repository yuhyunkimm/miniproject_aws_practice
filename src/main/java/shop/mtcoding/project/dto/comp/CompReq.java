package shop.mtcoding.project.dto.comp;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

public class CompReq {

    @Getter
    @Setter
    @AllArgsConstructor
    public static class CompJoinReqDto {
        private Integer compId;
        private String email;
        private String password;
        private String compName;
        private String representativeName;
        private String businessNumber;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class CompLoginReqDto {
        private Integer compId;
        private String email;
        private String password;
        private String rememberEmail;
    }

    @Getter
    @Setter
    public static class CompUpdateReqDto {
        private Integer compId;
        private String password;
        private String compName;
        private String representativeName;
        private String businessNumber;
    }
}
