package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Apply {
    private Integer applyId;
    private Integer resumeId;
    private Integer jobsId;
    private String state;
    private Timestamp createdAt;
}
