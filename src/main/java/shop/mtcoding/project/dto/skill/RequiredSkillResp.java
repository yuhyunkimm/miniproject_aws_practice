package shop.mtcoding.project.dto.skill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class RequiredSkillResp {
    
    @Getter
    @Setter
    public static class RequiredSkillByCompRespDto {
        private List<String> skillList;
    }
}
