package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Jobs {
    private int jobsId;
    private String title;
    private String content;
    private String position;
    private String career;
    private String education;
    private Integer scrapCount;
    private String requiredSkillId;
    private Timestamp endDate;
    private Integer compId;
    private String homepage;
    private Timestamp createdAt;
}
