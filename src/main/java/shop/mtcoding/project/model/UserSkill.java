package shop.mtcoding.project.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserSkill {
    private Integer userSkillId;
    private Integer userId;
    private List<String> skillList;
}
