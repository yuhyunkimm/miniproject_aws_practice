package shop.mtcoding.project.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import shop.mtcoding.project.dto.ResponseDto;
import shop.mtcoding.project.util.Script;

@RestControllerAdvice
public class CustomExceptionHandler {
    
    @ExceptionHandler(CustomException.class)
    public ResponseEntity<?> customException(CustomException e){
        return new ResponseEntity<>(Script.back(e.getMessage()), e.getStatus());
    }

    @ExceptionHandler(CustomApiException.class)
    public ResponseEntity<?> customApiException(CustomApiException e){
        return new ResponseEntity<>(new ResponseDto<>(-1,e.getMessage(),null), e.getStatus());
    }
}
