package shop.mtcoding.project.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.project.dto.ResponseDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.service.JobsService;

@Controller
public class JobsController {
    
    @Autowired
    private JobsService service;

    @Autowired
    private JobsRepository jobsRepository;



    @Autowired
    private HttpSession session;

    private void mockUserSession() {
        Comp mockcomp = new Comp(
                1,
                "kakao@kakao.com",
                "1234",
                "카카오(주)",
                "제주 제주시 첨단로",
                "홍은택",
                "120-81-47521",
                "1577-3321",
                "/images/default_profile.png",
                3600,
                "1995-02-16",
                "http://www.kakaocorp.com",
                new Timestamp(System.currentTimeMillis())
                );
        session.setAttribute("principal", mockcomp);
    }
    
    @GetMapping("/jobs/info")
    public String info(JobsSearchReqDto jDto, Model model) throws Exception{
        ObjectMapper om = new ObjectMapper();
        if( jDto.getAddress() == null || jDto.getAddress().isEmpty()){
            jDto.setAddress("");
        }
        if( jDto.getCareer() == null || jDto.getCareer().isEmpty()){
            jDto.setCareer("");
        }
        if( jDto.getPosition() == null || jDto.getPosition().isEmpty()){
            jDto.setPosition("");
        }
        if( jDto.getSkill() == null || jDto.getSkill().isEmpty()){
            jDto.setSkill("");
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findByAddressAndCareerAndSkillAndDuty(jDto);
        model.addAttribute("jDtos", jDtos);
        // System.out.println("테스트 : " +  om.writeValueAsString(jDtos));
        return "jobs/info";
        // return "/";
    }

    @GetMapping("/jobs/{id}")
    public String viewJobs(){
        return "jobs/jobsDetail";
    }

    @GetMapping("/comp/jobs/write")
    public String writeJobs(){
    return "comp/writeJobsForm";
    }

    @GetMapping("/comp/jobs/{id}/update")
    public String updateJobs(){
    return "comp/updateJobsForm";
    }

    @PostMapping("/jobs/info/search")
    public ResponseEntity<?> searchJobs(@RequestBody JobsSearchReqDto jDto, Model model){
        if( jDto.getAddress() == null || jDto.getAddress().isEmpty()){
            jDto.setAddress("");
        }
        if( jDto.getCareer() == null || jDto.getCareer().isEmpty()){
            jDto.setCareer("");
        }
        if( jDto.getPosition() == null || jDto.getPosition().isEmpty()){
            jDto.setPosition("");
        }
        if( jDto.getSkill() == null || jDto.getSkill().isEmpty()){
            jDto.setSkill("");
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findByAddressAndCareerAndSkillAndDuty(jDto);
        model.addAttribute("jDtos", jDtos);
        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", null), HttpStatus.OK);
    }
}
// ⬜ 채용정보    "/jobs/info"
// ⬜ 공고    "/jobs/1"

// 🟦 공고등록    "/comp/jobs/write
// 🟦 공고수정    "/comp/jobs/공고번호/update"