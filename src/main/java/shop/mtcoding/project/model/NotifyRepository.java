package shop.mtcoding.project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.project.dto.notify.NotifyRespDto.NotifyRespStateDto;

@Mapper
public interface NotifyRepository {
    public NotifyRespStateDto findByApplyId(Integer id);

    public int insert(
        @Param("applyId") Integer applyId,
        @Param("suggestId") Integer suggestId
    );

    public int update(
        @Param("applyId") Integer applyId,
        @Param("suggestId") Integer suggestId
    );
}
