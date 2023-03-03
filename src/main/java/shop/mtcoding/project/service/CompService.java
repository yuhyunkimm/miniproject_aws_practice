package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.dto.comp.CompReq.CompLoginReqDto;
import shop.mtcoding.project.dto.comp.CompReq.CompUpdateReqDto;
import shop.mtcoding.project.exception.CustomApiException;
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

    @Transactional(readOnly = true)
    public Comp 로그인(CompLoginReqDto compLoginReqDto) {
        Comp principal = compRepository.findByEmailAndPassword(compLoginReqDto.getEmail(),
                compLoginReqDto.getPassword());
        if (principal == null) {
            throw new CustomException("이메일 혹은 패스워드가 잘못 입력 되었습니다.");
        }
        return principal;
    }

    @Transactional
    public void 회사정보수정(CompUpdateReqDto compUpdateReqDto, Integer compId) {
        if (compId != compUpdateReqDto.getCompId()) {
            throw new CustomApiException("정상적인 접근이 아닙니다.", HttpStatus.FORBIDDEN);
        }
        System.out.println("테스트 : 111111");
        Comp compPS = compRepository.findByCompId(compUpdateReqDto.getCompId());
        System.out.println("테스트 : 22222");
        if (compPS == null)
            throw new CustomException("존재하지 않는 회원입니다.");
        System.out.println("테스트 : 333333");
        try {
            compRepository.updateByCompId(compUpdateReqDto, compId);
            System.out.println("테스트 : 444444");
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        System.out.println("테스트 : 5555");
    }
}
