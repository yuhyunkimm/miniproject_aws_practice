package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class Comp {
    private Integer compId;
    private String email;
    private String password;
    private String compName;
    private String representativeName;
    private String businessNumber;
    private String photo;
    private String homepage;
    private Timestamp createdAt;
}
