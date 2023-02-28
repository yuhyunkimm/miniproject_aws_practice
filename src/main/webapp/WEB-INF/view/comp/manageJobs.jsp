<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>


        <div class="mx-auto width-53 top-80">
            <div class="container mt-5">
                            <div class="mb-3">
                    <h5> 공고 관리 ( 데이터 넣어야 함 )</h5>
                </div>
                <div class="row">
                    <!-- <h2> 이력서 관리</h2> -->
                    <div class="col-3" style="text-align: center;">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="card-subtitle text-muted mb-3">사진</h6>
                                <h6 class="card-subtitle text-muted">이름</h6>
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
                       <div class="col-9">
                    <c:forEach items="${jDtos}" var="jDto">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">${jDto.title}</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">${jDto.position}</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">${jDto.career}</h6>
                                </div>
                                <div style="float: right;" pt-2>
                                    <button type="button" class="btn btn-success btn-sm" onclick="location.href=`/jobs/`+${jDto.jobsId}+`/update`">공고 수정</button>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                        <button style="float: right;" type="button" class="btn btn-success mb-4"
                            onclick="location.href='/jobs/write'">공고 작성</button>
                    </div>
                </div>
            </div>
        </div>


        <%@ include file="../layout/footer.jsp" %>