package shop.mtcoding.project.dto.scrap;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class CompScrapReq {
    
    @Getter
    @Setter
    @ToString
    public static class CompInsertScrapReqDto {
        private Integer compScrapId;
        private Integer compId;
        private Integer resumeId;
    }

    @Getter
    @Setter
    public static class CompDeleteScrapReqDto {
        private Integer compScrapId;
        private Integer compId;
    }
}
