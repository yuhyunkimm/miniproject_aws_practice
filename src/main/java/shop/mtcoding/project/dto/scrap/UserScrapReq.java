package shop.mtcoding.project.dto.scrap;

import lombok.Getter;
import lombok.Setter;

public class UserScrapReq {
    
    @Getter
    @Setter
    public static class UserInsertScrapReqDto {
        private Integer userScrapId;
        private Integer userId;
        private Integer jobsId;
    }

    @Getter
    @Setter
    public static class UserDeleteScrapReqDto {
        private Integer userScrapId;
        private Integer userId;
    }
}
