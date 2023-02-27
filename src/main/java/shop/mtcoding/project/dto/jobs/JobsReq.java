package shop.mtcoding.project.dto.jobs;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class JobsReq {
    
    @Getter
    @Setter
    @ToString
    public static class JobsCheckBoxReqDto{
        private List<String> address;
        private List<String> skill;
        private List<String> position;
        private String career;
    }

    @Getter
    @Setter
    @ToString
    public static class JobsSearchReqDto{
        private String address;
        private String skill;
        private String position;
        private String career;
    }

    @Getter
    @Setter
    @ToString
    public static class JobsWriteReqDto{
        private Integer jobsId; // 임시저장에 필요
        private Integer compId;
        private String compName;
        private String representativeName;
        private String homepage;
        private String photo;
        private String title;
        private String content;
        private String education;
        private String career;
        private String position;
        private String address;
        private Timestamp endDate;
        private String receipt;
        private String skillName1;
        private String skillName2;
        private String skillName3;
    }

    @Getter
    @Setter
    @ToString
    public static class JobsUpdateReqDto{
        private Integer jobsId; // 임시저장에 필요
        private Integer compId;
        private String compName;
        private String representativeName;
        private String homepage;
        private String photo;
        private String title;
        private String content;
        private String education;
        private String career;
        private String position;
        private String address;
        private Timestamp endDate;
        private String receipt;
        private String skillName1;
        private String skillName2;
        private String skillName3;
    }
}
