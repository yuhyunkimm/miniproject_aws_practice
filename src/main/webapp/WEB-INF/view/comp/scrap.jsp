<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<div class="mx-auto width-53 top-80">
    <div class="container my-5 py-5">
        <div class="row">
            <div class="col-3 px-5" style="text-align: center;">
                <div class="mb-3">
                    <div class="fs-4">이력서 스크랩</div>
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
                <h6><b>전체 ${sDtos.size()} </b></h6>
                <hr />
                <c:forEach items="${sDtos}" var="sDto">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: left;">${sDto.title}</h5>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">${sDto.name} ${sDto.birth}</h6>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">${sDto.education}</h6>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">${sDto.career}</h6>
                        </div>
                                               <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">${sDto.address}</h6>
                        </div>
                        <div style="float: right;" pt-2>
                            <button type="button" class="btn btn-success btn-sm"
                                onclick="location.href='/resume/${sDto.resumeId}'">상세보기</button>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>

        <%@ include file="../layout/footer.jsp" %>