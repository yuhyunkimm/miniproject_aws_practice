package shop.mtcoding.project.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
public class User {
    private Integer userId;
    private String email;
    private String password;
    private String name;
    private String birth;
    private String tel;
    private String photo;
    private String Address;
    private Timestamp createdAt;
}
