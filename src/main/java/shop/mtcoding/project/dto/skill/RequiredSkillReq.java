package shop.mtcoding.project.dto.skill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class RequiredSkillReq {
    
    @Getter
    @Setter
    public static class RequiredSkillWriteReqDto{
        // private Integer jobsId;
        private List<String> skillList;
    }
}
