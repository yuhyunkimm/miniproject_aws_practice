package shop.mtcoding.project.dto.apply;

import lombok.Getter;
import lombok.Setter;

public class ApplyResp {
    
    @Getter
    @Setter
    public static class ApllyStatusCompRespDto{
        private Integer applyId;
        private Integer resumeId;
        private Integer jobsId;
        private String title;
        private String position;
        private String career;
        private String education;
        private String name;
        private String birth;
        // private List<String> skillList;
    }

    @Getter
    @Setter
    public static class ApllyStatusUserRespDto{
        private Integer applyId;
        private Integer resumeId;
        private Integer jobsId;
        private Integer state;
        private String jobsTitle;
        private String resumeTitle;
        private String position;
        // private List<String> skillList;
    }


}
