package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Suggest {
    private Integer suggestId;
    private Integer jobsId;
    private Integer resumeId;
    private String state;
    private Timestamp createdAt;
}
