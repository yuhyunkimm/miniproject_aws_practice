package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Integer userId;
    private String email;
    private String password;
    private String name;
    private String birth;
    private String tel;
    private String photo;
    private String userAddress;
    private Timestamp createdAt;
}
