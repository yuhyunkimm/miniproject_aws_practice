package shop.mtcoding.project.dto.suggest;

import lombok.Getter;
import lombok.Setter;

public class SuggestReq {
    
    @Getter
    @Setter
    public static class SuggestReqDto{
        private Integer resumeId;
        private Integer jobsId;
        private Integer userId;
    }
}
