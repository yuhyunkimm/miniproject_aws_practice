package shop.mtcoding.project.dto.suggest;

import lombok.Getter;
import lombok.Setter;

public class SuggestResp {
    @Getter
    @Setter
    public static class SuggestToUserRespDto {
        private Integer suggestId;
        private Integer jobsId;
        private Integer resumeId;
        private String compName;
        private String title;
        private String position;
        private String name;
        private Integer state;
    }

    @Getter
    @Setter
    public static class SuggestToCompRespDto {
        private Integer suggestId;
        private Integer state;
    }
}
