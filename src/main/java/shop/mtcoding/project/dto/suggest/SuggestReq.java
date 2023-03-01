package shop.mtcoding.project.dto.suggest;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class SuggestReq {
    
    @Getter
    @Setter
    @ToString
    public static class SuggestReqDto{
        private Integer resumeId;
        private Integer jobsId;
        private Integer compId;
        private Integer compScrapId;
    }
}
