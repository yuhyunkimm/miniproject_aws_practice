package shop.mtcoding.project.dto.scrap;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class CompScrapResp {

    @Getter
    @Setter
    public static class CompScrapResumeRespDto{
        private Integer compscrapId;
        private Integer resumeId;
        private String name;
        private String birth;
        private String title;
        private String career;
        private String education;
        private List<String> skillList;
        private String address;
    }
}
