package shop.mtcoding.project.dto.requiredSkill;

import lombok.Getter;
import lombok.Setter;

public class RequiredSkillReq {
    
    @Getter
    @Setter
    public static class RequiredSkillWriteReqDto{
        private Integer jobsId;
        private String skillName1;
        private String skillName2;
        private String skillName3;
    }
}
