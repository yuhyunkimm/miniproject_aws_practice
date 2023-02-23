package shop.mtcoding.project.dto.jobs;

import lombok.Getter;
import lombok.Setter;

public class JobsReq {
    
    @Getter
    @Setter
    public static class JobsSearchReqDto{
        private String address;
        private String skill;
        private String position;
        private String career;
    }
}
