package shop.mtcoding.project.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Interest {
    private Integer interestId;
    private Integer userId;
    private List<String> interestCt;
}
