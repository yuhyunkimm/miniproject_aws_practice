package shop.mtcoding.project.dto.skill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class ResumeSkillResp {
    
    @Getter
    @Setter
    public static class ResumeSkillRespDto {
        private String skill;
    }

    @Getter
    @Setter
    public static class ResumeSkillByUserRespDto {
        private List<String> skillList;
    }
}
