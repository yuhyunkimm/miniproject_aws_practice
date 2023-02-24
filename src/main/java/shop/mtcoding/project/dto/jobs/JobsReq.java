package shop.mtcoding.project.dto.jobs;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class JobsReq {
    
    @Getter
    @Setter
    @ToString
    public static class JobsCheckBoxReqDto{
        private List<String> address;
        private List<String> skill;
        private List<String> position;
        private String career;
    }

    @Getter
    @Setter
    @ToString
    public static class JobsSearchReqDto{
        private String address;
        private String skill;
        private String position;
        private String career;
    }
}
