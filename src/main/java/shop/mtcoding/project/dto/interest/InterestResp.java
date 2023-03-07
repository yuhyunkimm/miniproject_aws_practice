package shop.mtcoding.project.dto.interest;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class InterestResp {
    
    @Getter
    @Setter
    @ToString
    public static class InterestChangeRespDto{
        // private Integer userId;
        private String interestCt;
    }
}
