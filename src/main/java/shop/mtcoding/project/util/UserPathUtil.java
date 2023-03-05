package shop.mtcoding.project.util;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.web.multipart.MultipartFile;

import shop.mtcoding.project.exception.CustomException;

public class UserPathUtil {

    private static String getStaticFolder() {

        return System.getProperty("user.dir") + "\\build\\resources\\main\\static\\";

    }

    public static String writeImageFile(MultipartFile photo){
            UUID uuid = UUID.randomUUID();
            String uuidImageRealName = "images\\"+uuid+"_"+ photo.getOriginalFilename();
    
            String staticFolder = getStaticFolder();
            Path imageFilePath = Paths.get(staticFolder+uuidImageRealName);
            try {
                Files.write(imageFilePath, photo.getBytes());
            }catch (Exception e){
                throw new CustomException("사진을 웹서버에 저장하지 못하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
            return "/images/"+uuid+"_"+photo.getOriginalFilename();
        }
}
