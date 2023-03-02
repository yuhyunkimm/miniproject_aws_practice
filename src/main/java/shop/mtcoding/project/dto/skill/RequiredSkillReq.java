package shop.mtcoding.project.dto.skill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class RequiredSkillReq {
    
    @Getter
    @Setter
    @ToString
    public static class RequiredSkillWriteReqDto{
        // private Integer jobsId;
        private String skill;
    }
}
