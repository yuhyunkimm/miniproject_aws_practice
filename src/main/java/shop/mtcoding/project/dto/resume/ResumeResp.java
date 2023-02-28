package shop.mtcoding.project.dto.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class ResumeResp {

    @Getter
    @Setter
    public static class ResumeRecommendRespDto {
        private Integer resumeId;
        private String photo;
        private String name;
        private String title;
        private String birth;
        private String education;
        private String career;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private String address;
    }

    @Getter
    @Setter
    @ToString
    public static class ResumeManageRespDto {
        private Integer resumeId;
        private String title;
        private String education;
        private String career;
        private String skillName1;
        private String skillName2;
        private String skillName3;
    }

    @Getter
    @Setter
    public static class ResumeSaveRespDto {
        private Integer resumeId;
        private Integer userId;
        private String title;
        private String content;
        private String education;
        private String career;
        private String link;
        private Integer state;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private Timestamp createdAt;
    }

}
