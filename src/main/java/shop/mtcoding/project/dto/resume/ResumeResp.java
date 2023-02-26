package shop.mtcoding.project.dto.resume;

public class ResumeResp {
    
    @Getter
    @Setter
    public static class ResumeRecommendRespDto{
        private Integer resumeId;
        private String photo;
        private String name;
        private String title;
        private String birth;
        private String education;
        private String career;
        private String skillName1;
        private String skillName2;
        private String skillName3;
        private String address;
    }
}
