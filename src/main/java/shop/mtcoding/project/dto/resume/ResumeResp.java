package shop.mtcoding.project.dto.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class ResumeResp {

    @Getter
    @Setter
    @ToString
    public static class ResumeRecommendRespDto {
        private Integer resumeId;
        private String photo;
        private String name;
        private String title;
        private String birth;
        private String education;
        private String career;
        // private List<String> skillList;
        private String address;
    }

    @Getter
    @Setter
    @ToString
    public static class ResumeDetailRespDto {
        private Integer resumeId;
        private String photo;
        private String name;
        private String title;
        private String birth;
        private String education;
        private String career;
        // private List<String> skillList;
        private String compScrapId;
        private String address;
        private String content;
        private String link;
    }

    @Getter
    @Setter
    @ToString
    public static class ResumeManageRespDto {
        private Integer resumeId;
        private String title;
        private String education;
        private String career;
        // private List<String> skillList;
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
        // private List<String> skillList;
        private Timestamp createdAt;
    }

}
