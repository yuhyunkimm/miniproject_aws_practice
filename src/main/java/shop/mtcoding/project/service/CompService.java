package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import shop.mtcoding.project.dto.comp.CompReq.CompJoinReqDto;
import shop.mtcoding.project.dto.comp.CompReq.CompLoginReqDto;
import shop.mtcoding.project.dto.comp.CompReq.CompUpdateReqDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.CompRepository;
import shop.mtcoding.project.util.PathUtil;
import shop.mtcoding.project.util.Sha256;

@Service
public class CompService {

    @Autowired
    private CompRepository compRepository;

    @Transactional
    public void 회원가입(CompJoinReqDto compJoinReqDto) {
        Comp compPS = compRepository.findByCompEmail(compJoinReqDto.getEmail());
        if (compPS != null) {
            throw new CustomException("존재하는 회원입니다.");
        }
        compJoinReqDto.setPassword(Sha256.encode(compJoinReqDto.getPassword()));
        try {
            compRepository.insert(compJoinReqDto);
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional(readOnly = true)
    public Comp 로그인(CompLoginReqDto compLoginReqDto) {
        compLoginReqDto.setPassword(Sha256.encode(compLoginReqDto.getPassword()));
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
        Comp compPS = compRepository.findByCompId(compUpdateReqDto.getCompId());
        if (compPS == null)
            throw new CustomException("존재하지 않는 회원입니다.");
        try {
            compRepository.updateByCompId(compUpdateReqDto, compId);
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public Comp 프로필사진수정(MultipartFile photo, Integer compId) {

        String uuidImageName = PathUtil.writeImageFile(photo);

        Comp compPS = compRepository.findByCompId(compId);
        compPS.setPhoto(uuidImageName);
        try {
            compRepository.updatePhotoById(uuidImageName, compId);
        } catch (Exception e) {
            throw new CustomException("사진 수정에 실패 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return compPS;
    }
}
