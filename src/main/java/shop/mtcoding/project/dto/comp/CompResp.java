package shop.mtcoding.project.dto.comp;

import lombok.Getter;
import lombok.Setter;

public class CompResp {
   
    @Getter
    @Setter
    public static class CompWriteJobsRespDto {
        private String compName;
        private String representativeName;
        private String photo;
        private String homepage;
    }
}
