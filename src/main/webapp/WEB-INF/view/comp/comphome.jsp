<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

        <div class="mx-auto width-53 top-80">
            <div class="container my-5 py-5">
                <div class="row">
                    <div class="col-3 px-5" style="text-align: center;">
                        <div class="mb-3">
                            <div class="fs-4">기업 홈</div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <!-- <h5 class="card-title">지원 및 제안</h5><br> -->
                                <div class="relative mb-3">
                                    <div>
                                        <img src="/images/default_profile.png" class="rounded" alt="Cinque Terre" style="max-width: 80px;">
                                    </div>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle text-muted">${compSession.compName}</h6>
                                        <hr>
                                        <h6 class="card-subtitle mb-1 text-muted"><a href="/comp/jobs">공고등록/수정</a></h6><br>
                                        <h6 class="card-subtitle mb-1 text-muted"><a href="/comp/apply">지원자 현황</a></h6><br>
                                        <h6 class="card-subtitle mb-1 text-muted"><a href="/comp/resume/scrap">이력서 스크랩</a></h6>
                                        <hr>
                                        <h6 class="card-subtitle mb-1 text-muted"><a href="/comp/update">정보수정</a></h6><br>
                                        <h6 class="card-subtitle mb-1 text-muted"><a href="/logout">로그아웃</a></h6>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-9 my-4 pe-5">
                        <div>
                            <h6><b> 등록된 공고 </b></h6>
                            <table class="table" style="width:100%">
                                <thead>
                                    <tr class="table-secondary" align=center>
                                        <th scope="col" style="width:10%">No.</th>
                                        <th scope="col" colspan=2 style="width:30%">제목</th>
                                        <th scope="col" style="width:30%">포지션</th>
                                        <th scope="col" style="width:20%"></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${jDtos}" varStatus="status" var="jDto">
                                    <tbody>
                                    <tr align=center>
                                        <th scope="row">${status.count}</th>
                                        <td colspan=2>${jDto.title}</td>
                                        <td>${jDto.position}</td>
                                        <td><button type="button" class="btn btn-success btn-sm" 
                                        onclick="location.href='/jobs/${jDto.jobsId}'">상세보기</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>

                                
                            </table>
                            <br />
                                <h6><b>추천 인재</b></h6>
                            <table class="table" style="width:100%">
                                <thead>
                                    <tr class="table-secondary" align=center>
                                        <th scope="col" style="width:30%">No.</th>
                                        <th scope="col" colspan=2 style="width:40%">Name</th>
                                        <th scope="col"></th>
                                        <th scope="col" style="width:30%">Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr align=center>
                                        <th scope="row">1</th>
                                        <td colspan=2>최주호</td>
                                        <td></td>
                                        <td><button type="button" class="btn btn-success btn-sm">상세보기</button></td>
                                    </tr>
                                    <tr align=center>
                                        <th scope="row">2</th>
                                        <td colspan=2></td>
                                        <td></td>
                                        <td><button type="button" class="btn btn-success btn-sm">상세보기</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

<%@ include file="../layout/footer.jsp" %>