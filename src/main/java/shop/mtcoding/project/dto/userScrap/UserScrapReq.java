package shop.mtcoding.project.dto.userScrap;

import lombok.Getter;
import lombok.Setter;

public class UserScrapReq {
    
    @Getter
    @Setter
    public static class UserScrapReqDto {
        private Integer userScrapId;
        private Integer userId;
        private Integer jobsId;
    }
}
