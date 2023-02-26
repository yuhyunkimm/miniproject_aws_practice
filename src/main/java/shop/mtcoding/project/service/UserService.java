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
        userRepository.insert(userJoinReqDto);
        try {
        } catch (Exception e) {
            throw new CustomException("동일한 내용이 존재합니다");
        }
    }
}
