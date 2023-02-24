package shop.mtcoding.project.dto.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class ResumeReq {

    @Getter
    @Setter
    public static class ResumeWriteReqDto {
        private Integer resumeId;
        private Integer userId;
        private String title;
        private String content;
        private String education;
        private String career;
        private String skillName1;
        private String link;
        private Integer state;
        private Timestamp createdAt;

    }

    @Getter
    @Setter
    public static class ResumeUpdateReqDto {
        private Integer resumeId;
        private Integer userId;
        private String title;
        private String content;
        private String education;
        private String career;
        private Integer userSkillId;
        private String link;
        private Integer state;
        private Timestamp createdAt;

    }
}
