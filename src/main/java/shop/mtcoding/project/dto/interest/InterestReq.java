package shop.mtcoding.project.dto.interest;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class InterestReq {
    
    @Getter
    @Setter
    public static class InterestChangeReqDto{
        private Integer userId;
        private List<String> interestList;
        //         @Param("userId") Integer userId,
        // @Param("interestList") List<String> interestList
    }

}
