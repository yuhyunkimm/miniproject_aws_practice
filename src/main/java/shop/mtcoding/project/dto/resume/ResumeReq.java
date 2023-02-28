package shop.mtcoding.project.dto.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class ResumeReq {

    @Getter
    @Setter
    @ToString
    public static class ResumeWriteReqDto {
        private Integer resumeId; // 리턴용
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

    @Getter
    @Setter
    @ToString
    public static class ResumeUpdateReqDto {
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

    @Getter
    @Setter
    public static class ResumeSaveTempReqDto {
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
