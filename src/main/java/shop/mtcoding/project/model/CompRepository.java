package shop.mtcoding.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;

@Mapper
public interface CompRepository {
    public List<Comp> findAll();

    public void findById(

    );

    public int insert(
            @Param("uDto") CompJoinReqDto uDto);

    public int updateById(

    );

    public int deleteById(

    );

    public Comp findByCompEmail();
}
