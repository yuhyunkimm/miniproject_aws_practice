package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.CompRepository;

@Service
public class CompService {

    @Autowired
    private CompRepository compRepository;

    @Transactional
    public void 회원가입(CompJoinReqDto compJoinReqDto) {
        Comp compPS = compRepository.findByCompEmail(compJoinReqDto.getEmail());
        if (compPS != null)
            throw new CustomException("존재하는 회원입니다.");
        try {
            compRepository.insert(compJoinReqDto);
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
