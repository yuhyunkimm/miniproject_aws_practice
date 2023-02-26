package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
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
        if ( userPS != null )
            throw new CustomException("존재하는 회원입니다.");
        try {
            userRepository.insert(userJoinReqDto);
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
