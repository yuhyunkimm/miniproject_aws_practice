package shop.mtcoding.project.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.project.dto.apply.ApplyResp.ApplyUserStatusDetailRespDto;
import shop.mtcoding.project.dto.common.ResponseDto;
import shop.mtcoding.project.dto.comp.CompResp.CompWriteJobsRespDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsCheckBoxReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsSearchReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsUpdateReqDto;
import shop.mtcoding.project.dto.jobs.JobsReq.JobsWriteReqDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsDetailRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsMainRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsMatchRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSearchRespDto;
import shop.mtcoding.project.dto.jobs.JobsResp.JobsSuggestRespDto;
import shop.mtcoding.project.dto.resume.ResumeResp.ResumeIdRespDto;
import shop.mtcoding.project.dto.skill.RequiredSkillReq.RequiredSkillWriteReqDto;
import shop.mtcoding.project.dto.skill.ResumeSkillResp.ResumeSkillByUserRespDto;
import shop.mtcoding.project.dto.skill.ResumeSkillResp.ResumeSkillRespDto;
import shop.mtcoding.project.exception.CustomApiException;
import shop.mtcoding.project.exception.CustomException;
import shop.mtcoding.project.model.ApplyRepository;
import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.CompRepository;
import shop.mtcoding.project.model.JobsRepository;
import shop.mtcoding.project.model.ResumeRepository;
import shop.mtcoding.project.model.ScrapRepository;
import shop.mtcoding.project.model.SkillRepository;
import shop.mtcoding.project.model.User;
import shop.mtcoding.project.service.JobsService;
import shop.mtcoding.project.util.DateUtil;

@Controller
public class JobsController {

    @Autowired
    private JobsRepository jobsRepository;

    @Autowired
    private CompRepository compRepository;

    @Autowired
    private SkillRepository skillRepository;
    
    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private ScrapRepository scrapRepository;

    @Autowired
    private ApplyRepository applyRepository;
    
    @Autowired
    private JobsService jobsService;

    @Autowired
    private HttpSession session;

    @GetMapping("/comp/request/jobs")
    public ResponseEntity<?> requestJobs() {
        Comp compSession = (Comp) session.getAttribute("compSession");
        List<JobsSuggestRespDto> jDtos = jobsRepository.findAllToSuggestReq(compSession.getCompId());
        return new ResponseEntity<>(new ResponseDto<>(1, "공고 불러오기 완료", jDtos), HttpStatus.OK);
    }

    @GetMapping("/jobs/search")
    public String searchJobs(String keyword, Model model){
        if(ObjectUtils.isEmpty(keyword)){
            keyword = "검색어를 입력해 주세요 !!!";
            throw new CustomException("검색어가 없습니다.");
        }
        User principal = (User) session.getAttribute("principal");
        Integer num = null;
        if( principal != null ){
            num = principal.getUserId();
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findBySearch(keyword, num);
        for (JobsSearchRespDto jDto : jDtos) {
            long dDay = DateUtil.dDay(jDto.getEndDate());
            jDto.setLeftTime(dDay);
            List<String> insertList = new ArrayList<>();
            for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                insertList.add(skill.getSkill());
            }
            jDto.setSkillList(insertList);
        }

        model.addAttribute("jDtos", jDtos);
        model.addAttribute("keyword", keyword);
        return "jobs/info";
    }

    @GetMapping("/jobs/info/search")
    public ResponseEntity<?> searchCheckbox(JobsCheckBoxReqDto jobsDto, Model model) {
        User principal = (User) session.getAttribute("principal");
        if (jobsDto.getCareer() == null || jobsDto.getCareer().isEmpty()) {
            jobsDto.setCareer("");
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findByCheckBox(jobsDto);
        for (JobsSearchRespDto jDto : jDtos) {
            try {
                jDto.setUserScrapId(scrapRepository.findScrapIdByUserIdAndJobsId(principal.getUserId(), jDto.getJobsId()).getUserScrapId()); 
            } catch (Exception e) {
            }
            long dDay = DateUtil.dDay(jDto.getEndDate());
            jDto.setLeftTime(dDay);
            List<String> insertList = new ArrayList<>();
            for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                insertList.add(skill.getSkill());
            }
            jDto.setSkillList(insertList);
        }
        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", jDtos), HttpStatus.OK);
    }

    @GetMapping("/jobs/info")
    public String info(JobsSearchReqDto jDto, Model model) throws Exception {
        if (jDto.getAddress() == null || jDto.getAddress().isEmpty()) {
            jDto.setAddress("");
        }
        if (jDto.getCareer() == null || jDto.getCareer().isEmpty()) {
            jDto.setCareer("");
        }
        if (jDto.getPosition() == null || jDto.getPosition().isEmpty()) {
            jDto.setPosition("");
        }
        if (jDto.getSkill() == null || jDto.getSkill().isEmpty()) {
            jDto.setSkill("");
        }
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            List<JobsMainRespDto> jDtos = jobsRepository.findAlltoMain(principal.getUserId());
            for (JobsMainRespDto jDto1 : jDtos) {
                long dDay = DateUtil.dDay(jDto1.getEndDate());
                jDto1.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto1.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto1.setSkillList(insertList);
            }
            model.addAttribute("jDtos", jDtos);
        } else {
            List<JobsMainRespDto> jDtos = jobsRepository.findAlltoMain(null);
            for (JobsMainRespDto jDto2 : jDtos) {
                long dDay = DateUtil.dDay(jDto2.getEndDate());
                jDto2.setLeftTime(dDay);
                List<String> insertList = new ArrayList<>();
                for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto2.getJobsId())) {
                    insertList.add(skill.getSkill());
                }
                jDto2.setSkillList(insertList);
            }
            model.addAttribute("jDtos", jDtos);
        }

        return "jobs/info";
    }

    @GetMapping("/jobs/{id}")
    public String viewJobs(@PathVariable Integer id, Model model) {
        if( ObjectUtils.isEmpty(jobsRepository.findById(id))){
            throw new CustomException("조회한 공고가 존재하지 않습니다.");
        }
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            JobsDetailRespDto jDto = jobsRepository.findByJobsDetail(id, principal.getUserId());
            Integer state ;
            try {
                ApplyUserStatusDetailRespDto aDto = applyRepository.findApplyStateByUserIdAndJobsId(principal.getUserId(), id);
                state = aDto.getState();
            } catch (Exception e) {
                state = null ;
            }
            jDto.setState(state);
            long dDay = DateUtil.dDay(jDto.getEndDate());
            jDto.setLeftTime(dDay);
            jDto.setFormatEndDate(DateUtil.format(jDto.getEndDate()));
            List<String> insertList = new ArrayList<>();
            for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                insertList.add(skill.getSkill());
            }
            jDto.setSkillList(insertList);
            model.addAttribute("jDto", jDto);
        } else {
            JobsDetailRespDto jDto = jobsRepository.findByJobsDetail(id, null);
            long dDay = DateUtil.dDay(jDto.getEndDate());
            jDto.setLeftTime(dDay);
            jDto.setFormatEndDate(DateUtil.format(jDto.getEndDate()));
            List<String> insertList = new ArrayList<>();
            for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                insertList.add(skill.getSkill());
            }
            jDto.setSkillList(insertList);
            model.addAttribute("jDto", jDto);
        }
        return "jobs/jobsDetail";
    }

    @GetMapping("/comp/jobs/write")
    public String writeJobs(Model model) {
        Comp compSesseion = (Comp) session.getAttribute("compSession");
        CompWriteJobsRespDto cDto = compRepository.findByIdToJobs(compSesseion.getCompId());
        if (cDto == null) {
            throw new CustomException("회사정보가 없습니다.");
        }
        model.addAttribute("cDto", cDto);
        return "jobs/writeJobsForm";
    }

    @GetMapping("/jobs/{id}/update")
    public String updateJobs(@PathVariable Integer id, Model model) {
        if( ObjectUtils.isEmpty(jobsRepository.findById(id))){
            throw new CustomException("조회한 공고가 존재하지 않습니다.");
        }
        JobsDetailRespDto jDto = jobsRepository.findByJobsDetail(id, null);
            long dDay = DateUtil.dDay(jDto.getEndDate());
            jDto.setLeftTime(dDay);
            jDto.setFormatEndDate(DateUtil.format(jDto.getEndDate()));
            List<String> insertList = new ArrayList<>();
            for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                insertList.add(skill.getSkill());
            jDto.setSkillList(insertList);
        }
        model.addAttribute("cDto", jDto);
        return "jobs/updateJobsForm";
    }

    @PostMapping("/jobs/info/list")
    public ResponseEntity<?> searchJobsSize(@RequestBody JobsCheckBoxReqDto jDto, Model model) {
        if (jDto.getCareer() == null || jDto.getCareer().isEmpty()) {
            jDto.setCareer("");
        }
        List<JobsSearchRespDto> jDtos = jobsRepository.findByCheckBox(jDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", jDtos.size()), HttpStatus.OK);
    }

    @GetMapping("/user/jobs/interest")
    public String interest(Model model) {
        User principal = (User) session.getAttribute("principal");
        if( principal == null){
            return "redirect:/user/login";
        }
        Set<String> set = new HashSet<>();
        List<ResumeIdRespDto> resumeIdList = resumeRepository.findResumeIdByUserId(principal.getUserId());
        for (ResumeIdRespDto resumeId : resumeIdList) {
            List<ResumeSkillRespDto> rSkillList = skillRepository.findByResumeSkill(resumeId.getResumeId());
            for (ResumeSkillRespDto skill : rSkillList) {
                set.add(skill.getSkill());
            }
        }

        ResumeSkillByUserRespDto rSkillList = new ResumeSkillByUserRespDto();
        List<String> skillList = new ArrayList<>(set);
        rSkillList.setSkillList(skillList);

        model.addAttribute("sDto", rSkillList);

        List<JobsMatchRespDto> fiveMatchList = new ArrayList<>();
        List<JobsMatchRespDto> fourMatchList = new ArrayList<>();
        List<JobsMatchRespDto> threeMatchList = new ArrayList<>();
        List<JobsMatchRespDto> twoMatchList = new ArrayList<>();
        List<JobsMatchRespDto> oneMatchList = new ArrayList<>();

        List<JobsMatchRespDto> jDtos = jobsRepository.findMatchJobsByUserId(principal.getUserId());
        for (JobsMatchRespDto jDto : jDtos) {
            long dDay = DateUtil.dDay(jDto.getEndDate());
            jDto.setLeftTime(dDay);

            int count = 0;
            List<String> insertList = new ArrayList<>();
            for (RequiredSkillWriteReqDto skill : skillRepository.findByJobsSkill(jDto.getJobsId())) {
                insertList.add(skill.getSkill());
                if ( set.contains(skill.getSkill())){
                    count ++ ;
                }
            }
            jDto.setSkillList(insertList);
            if ( count >= 5 ){
                fiveMatchList.add(jDto);
            }else if ( count >= 4 ){
                fourMatchList.add(jDto);
            }else if ( count >= 3 ){
                threeMatchList.add(jDto);
            }else if ( count >= 2 ){
                twoMatchList.add(jDto);
            }else if ( count >= 1 ){
                oneMatchList.add(jDto);
            }
            count = 0;
        }        
        List<JobsMatchRespDto> resultList = new ArrayList<>();
        resultList.addAll(fiveMatchList);
        resultList.addAll(fourMatchList);
        resultList.addAll(threeMatchList);
        resultList.addAll(twoMatchList);
        resultList.addAll(oneMatchList);
        model.addAttribute("jDtos", resultList);
        return "jobs/interest";
    }
    

    @PostMapping("/comp/jobs/write")
    public ResponseEntity<?> writeJobs(@RequestBody JobsWriteReqDto jDto) {
        // System.out.println("테스트 : "+jDto.toString());
        Comp compSession = (Comp) session.getAttribute("compSession");
        if (jDto.getCompId() == null) {
            throw new CustomApiException("회사계정이 필요합니다.", HttpStatus.UNAUTHORIZED);
        }
        if (jDto.getCompName() == null || jDto.getCompName().isEmpty()) {
            throw new CustomApiException("회사명이 필요합니다.");
        }
        if (jDto.getRepresentativeName() == null || jDto.getRepresentativeName().isEmpty()) {
            throw new CustomApiException("대표자명이 필요합니다.");
        }
        if (jDto.getTitle() == null || jDto.getTitle().isEmpty()) {
            throw new CustomApiException("공고 제목이 필요합니다.");
        }
        if (jDto.getEducation() == null || jDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력정보가 필요합니다.");
        }
        if (jDto.getCareer() == null || jDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력정보가 필요합니다.");
        }
        if (jDto.getPosition() == null || jDto.getPosition().isEmpty()) {
            throw new CustomApiException("직무정보가 필요합니다.");
        }
        if (jDto.getAddress() == null || jDto.getAddress().isEmpty()) {
            throw new CustomApiException("근무주소가 필요합니다.");
        }
        if (jDto.getReceipt() == null || jDto.getReceipt().isEmpty()) {
            throw new CustomApiException("접수방법이 필요합니다.");
        }
        if (ObjectUtils.isEmpty(jDto.getEndDate())) {
            throw new CustomApiException("마감일을 선택해주세요");
        }
        if (ObjectUtils.isEmpty(jDto.getSkillList())) {
            throw new CustomApiException("기술을 선택해주세요");
        } 

        Integer jobsId = jobsService.공고작성(jDto, compSession.getCompId());
        return new ResponseEntity<>(new ResponseDto<>(1, "저장 완료", jobsId), HttpStatus.CREATED);
    }

    @PutMapping("/comp/jobs/update")
    public ResponseEntity<?> updateJobs(@RequestBody JobsUpdateReqDto jDto) {
        Comp compSession = (Comp) session.getAttribute("compSession");
        if (jDto.getCompId() == null) {
            throw new CustomApiException("회사계정이 필요합니다.", HttpStatus.UNAUTHORIZED);
        }
        if (jDto.getCompName() == null || jDto.getCompName().isEmpty()) {
            throw new CustomApiException("회사명이 필요합니다.");
        }
        if (jDto.getRepresentativeName() == null || jDto.getRepresentativeName().isEmpty()) {
            throw new CustomApiException("대표자명이 필요합니다.");
        }
        if (jDto.getTitle() == null || jDto.getTitle().isEmpty()) {
            throw new CustomApiException("공고 제목이 필요합니다.");
        }
        if (jDto.getEducation() == null || jDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력정보가 필요합니다.");
        }
        if (jDto.getCareer() == null || jDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력정보가 필요합니다.");
        }
        if (jDto.getPosition() == null || jDto.getPosition().isEmpty()) {
            throw new CustomApiException("직무정보가 필요합니다.");
        }
        if (jDto.getAddress() == null || jDto.getAddress().isEmpty()) {
            throw new CustomApiException("근무주소가 필요합니다.");
        }
        if (jDto.getReceipt() == null || jDto.getReceipt().isEmpty()) {
            throw new CustomApiException("접수방법이 필요합니다.");
        }
        if ( ObjectUtils.isEmpty(jDto.getSkillList())){
            throw new CustomApiException("기술을 선택해주세요");
        }   

        Integer jobdId = jobsService.공고수정(jDto, compSession.getCompId());
        return new ResponseEntity<>(new ResponseDto<>(1, "저장 완료", jobdId), HttpStatus.CREATED);
    }

    @DeleteMapping("/jobs/{id}/delete")
    public ResponseEntity<?> deleteJobs(@PathVariable Integer id){
        if( ObjectUtils.isEmpty(jobsRepository.findById(id))){
            throw new CustomException("조회한 공고가 존재하지 않습니다.");
        }
        Comp compSession = (Comp)session.getAttribute("compSession");
        jobsService.공고삭제(id, compSession.getCompId());
        return new ResponseEntity<>(new ResponseDto<>(1, "공고 삭제 성공", null), HttpStatus.OK);
    }
}
// ⬜ 채용정보 "/jobs/info"
// ⬜ 공고 "/jobs/1"

// 🟦 공고등록 "/comp/jobs/write
// 🟦 공고수정 "/jobs/공고번호/update"