package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Resume {
    private Integer resumeId;
    private Integer userId;
    private String title;
    private String content;
    private String education;
    private String career;
    private Integer userSkillId;
    private String link;
    private Integer state;
    private Timestamp createdAt;
}
