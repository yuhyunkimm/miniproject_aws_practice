package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompScrap {
    private Integer compScrapId;
    private Integer compId;
    private Integer resumeId;
    private Timestamp createdAt;
}
