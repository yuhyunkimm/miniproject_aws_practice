package shop.mtcoding.project.dto.jobs;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class JobsResp {
    
    @Getter
    @Setter
    public static class JobsMainRespDto {
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
        private Integer userScrapId;
        private Timestamp endDate;
    }
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
        private Integer userScrapId;
        private Timestamp endDate;
    }

    @Getter
    @Setter
    @ToString
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
        private String homepage;
        private Timestamp endDate;
        private String representativeName;
        private Integer userScrapId;
    }

    @Getter
    @Setter
    public static class JobsSkillRespDto {
        private Integer jobsId;
        private String photo;
        private String compName;
        private String title;
        private String career;
        private String education;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private String position;
        private String address;
        private Timestamp endDate;
    }

    @Getter
    @Setter
    public static class JobsRequiredSkill {
        private String skillName1;
        private String skillName2;
        private String skillName3;
    }

    @Getter
    @Setter
    public static class JobsUpdateRespDto {
        private Integer jobsId;
        private String photo;
        private String compName;
        private String representativeName;
        private String establishmentDate;
        private Integer employees;
        private String homepage;
        private String title;
        private String content;
        private String education;
        private String career;
        private String position;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private String address;
        private Timestamp endDate;
        private String receipt;
        private Integer userScrapId;
    }

    @Getter
    @Setter
    public static class JobsWriteRespDto{
        private String compName;
        private String representativeName;
        private String photo;
        private String homepage;
    }

    @Getter
    @Setter
    public static class JobsManageJobsRespDto{
        private Integer num;
        private Integer jobsId;
        private String title;
        private String position;
        private String career;
    }

}
