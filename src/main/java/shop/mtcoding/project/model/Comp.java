package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comp {
    private Integer compId;
    private String email;
    private String password;
    private String compName;
    private String compAddress;
    private String representativeName;
    private String businessNumber;
    private String tel;
    private String photo;
    private Integer employees;
    private String establishmentDate;
    private String homePage;
    private Timestamp createdAt;
}
