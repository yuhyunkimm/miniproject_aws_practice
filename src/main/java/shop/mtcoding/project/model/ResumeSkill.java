package shop.mtcoding.project.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResumeSkill {
    private Integer resumeSkillId;
    private Integer resumeId;
    private List<String> skillList;
}
