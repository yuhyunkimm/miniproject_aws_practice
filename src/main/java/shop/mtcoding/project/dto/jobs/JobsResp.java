package shop.mtcoding.project.dto.jobs;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class JobsResp {
    
    @Getter
    @Setter
    public static class JobsSearchRespDto {
        private Integer jobsId;
        private String compName;
        private String photo;
        private String title;
        private String career;
        private String education;
        private String position;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private String address;
        private Timestamp endDate;
    }

    @Getter
    @Setter
    public static class JobsDetailRespDto {
        private Integer jobsId;
        private String photo;
        private String compName;
        private String title;
        private String content;
        private String career;
        private String education;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private String position;
        private String address;
        private String homePage;
        private Timestamp endDate;
        private String representativeName;
        private String tel;
    }

}
