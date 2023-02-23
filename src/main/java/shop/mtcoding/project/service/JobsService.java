package shop.mtcoding.project.service;

import org.eclipse.jdt.internal.compiler.ast.TrueLiteral;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.project.controller.JobsController.JobsSearchReqDto;

@Transactional(readOnly = true)
@Service
public class JobsService {

    public void 공고검색(JobsSearchReqDto jDto) {
    }
    
}
