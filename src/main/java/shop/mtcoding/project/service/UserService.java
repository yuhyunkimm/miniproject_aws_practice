package shop.mtcoding.project.service;

import javax.lang.model.element.Element;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session.Cookie;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.dto.user.UserReq.UserLoginReqDto;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void 회원가입(UserJoinReqDto userJoinReqDto) {
        User userPS = userRepository.findByUserEmail(userJoinReqDto.getEmail());
        if (userPS != null)
            throw new CustomException("존재하는 회원입니다.");
        try {
            userRepository.insert(userJoinReqDto);
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional(readOnly = true)
    public User 로그인(UserLoginReqDto userloginReqDto) {
        User principal = userRepository.findByEmailAndPassword(userloginReqDto.getEmail(),
                userloginReqDto.getPassword());
        if (principal == null) {
            throw new CustomException("이메일 혹은 패스워드가 잘못 입력 되었습니다.");
        }
        return principal;
    }
}
