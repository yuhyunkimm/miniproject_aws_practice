package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.interest.InterestReq.InterestChangeReqDto;

@Mapper
public interface InterestRepository {
    public void findAll();
    public void findById(

    );
    public int insert(
        @Param("iDto") InterestChangeReqDto iDto
    );
    public int updateById(

    );
    public int deleteById(

    );
}
