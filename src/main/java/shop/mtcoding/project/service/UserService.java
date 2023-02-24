package shop.mtcoding.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void 회원가입(UserJoinReqDto userJoinReqDto) {
        try {
            userRepository.insert(userJoinReqDto);
        } catch (Exception e) {
            throw new CustomException("서버 에러가 발생 했습니다.");
        }
    }
}
