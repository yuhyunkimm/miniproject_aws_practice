package shop.mtcoding.project.dto.skill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class ResumeSkillresp {
    
    @Getter
    @Setter
    public static class ResumeSkillRespDto {
        private List<String> skillList;
    }
}
