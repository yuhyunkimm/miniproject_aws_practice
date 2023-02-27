package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.project.dto.ResponseDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsDetailRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSkillRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsWriteRespDto;
import shop.mtcoding.project.dto.user.UserResp.UserSkillAndInterestDto;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.CompRepository;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.model.UserRepository;
import shop.mtcoding.project.util.MockSession;

@Controller
public class JobsController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private CompRepository compRepository;

    @Autowired
    private HttpSession session;



    
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
        List<JobsSearchRespDto> jDtos = jobsRepository.findBySearch(jDto);
        model.addAttribute("jDtos", jDtos);
        return "jobs/info";
    }

    @GetMapping("/jobs/{id}")
    public String viewJobs(@PathVariable Integer id, Model model){
        JobsDetailRespDto jDto = jobsRepository.findByJobsDetail(id);
        model.addAttribute("jDto", jDto);
        return "jobs/jobsDetail";
    }

    @GetMapping("/jobs/write")
    public String writeJobs(Model model){
        MockSession.mockComp(session);
        Comp compSesseion = (Comp) session.getAttribute("compSession");
        JobsWriteRespDto cDto = compRepository.findById(compSesseion.getCompId());
        if ( cDto == null ){
            throw new CustomException("회사정보가 없습니다.");
        }
        model.addAttribute("cDto", cDto);
        return "jobs/writeJobsForm";
    }

    @GetMapping("/jobs/{id}/update")
    public String updateJobs(){
    return "jobs/updateJobsForm";
    }

    @PostMapping("/jobs/info/search")
    public ResponseEntity<?> searchJobs(@RequestBody JobsCheckBoxReqDto jDto, Model model){
        // System.out.println("테스트 : "+ jDto.toString());
        if( jDto.getCareer() == null || jDto.getCareer().isEmpty()){
            jDto.setCareer("");
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findByCheckBox(jDto);
        // model.addAttribute("jDtos", jDtos);
        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", jDtos), HttpStatus.OK);
    }

    @PostMapping("/jobs/info/list")
    public ResponseEntity<?> searchJobsSize(@RequestBody JobsCheckBoxReqDto jDto, Model model){
        // System.out.println("테스트 : "+ jDto.toString());
        if( jDto.getCareer() == null || jDto.getCareer().isEmpty()){
            jDto.setCareer("");
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findByCheckBox(jDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", jDtos.size()), HttpStatus.OK);
    }

    @GetMapping("/jobs/interest")
    public String interest(Model model) {
        MockSession.mockUser(session);
        User principal = (User) session.getAttribute("principal");
        UserSkillAndInterestDto usi = userRepository.findByUserSkillAndInterest(principal.getUserId());
        List<String> insertList = Arrays.asList(usi.getSkillName1(),usi.getSkillName2(),usi.getSkillName3(),usi.getInterestCt1(),usi.getInterestCt2(),usi.getInterestCt3()); 
        Set<String> set = new HashSet<>(insertList);
        List<String> matchingList = new ArrayList<>(set);
        model.addAttribute("uDto", matchingList);

        List<JobsSkillRespDto> jsList = jobsRepository.findAllByJobsAndSkill();
        List<JobsSkillRespDto> fourMatchDto = new ArrayList<>();
        List<JobsSkillRespDto> threeMatchDto = new ArrayList<>();
        List<JobsSkillRespDto> twoMatchDto = new ArrayList<>();
        List<JobsSkillRespDto> oneMatchDto = new ArrayList<>();
        for (JobsSkillRespDto jsPS : jsList) {
            if( set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3()) && set.contains(jsPS.getPosition()) ){
                fourMatchDto.add(jsPS);
                continue;
            }
            if(( set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition()) ||
            ( set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition()) ||
            ( set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition())
            ){
                threeMatchDto.add(jsPS);
                continue;
            }
            if(( set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition()) ||
            ( set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition()) ||
            ( set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition())
            ){
                twoMatchDto.add(jsPS);
                continue;
            } 
            if(( set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && set.contains(jsPS.getSkillName3())) && !set.contains(jsPS.getPosition()) ||
            ( !set.contains(jsPS.getSkillName1()) && !set.contains(jsPS.getSkillName2()) && !set.contains(jsPS.getSkillName3())) && set.contains(jsPS.getPosition())
            ){
                oneMatchDto.add(jsPS);
                continue;
            }
        }
        model.addAttribute("fourMatchDto", fourMatchDto);
        model.addAttribute("threeMatchDto", threeMatchDto);
        model.addAttribute("twoMatchDto", twoMatchDto);
        model.addAttribute("oneMatchDto", oneMatchDto); 
        return "jobs/interest";
    }
}
// ⬜ 채용정보    "/jobs/info"
// ⬜ 공고    "/jobs/1"

// 🟦 공고등록    "/jobs/write
// 🟦 공고수정    "/jobs/공고번호/update"