package shop.mtcoding.project.dto.scrap;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class UserScrapResp {

    @Getter
    @Setter
    public static class UserScrapRespDto {
        private Integer userScrapId;
        private Integer jobsId;
        private String compName;
        private String title;
        private String position;
        private String career;
        private List<String> skillList;
        private Long leftTime;
        private Timestamp endDate;
    }

    @Getter
    @Setter
    public static class UserScrapIdRespDto{
        private Integer userScrapId;
    }
}
