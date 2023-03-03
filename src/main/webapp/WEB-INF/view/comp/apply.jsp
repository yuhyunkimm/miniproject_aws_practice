<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<div class="mx-auto width-53 top-80">
    <div class="container my-5 py-5">
        <div class="row">
            <div class="col-3 px-5" style="text-align: center;">
                <div class="mb-3">
                    <div class="fs-4">지원자 현황</div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <!-- <h5 class="card-title">지원 및 제안</h5><br> -->
                        <div class="relative mb-3">
                            <div>
                                <img src="/images/default_profile.png" class="rounded" alt="Cinque Terre"
                                    style="max-width: 80px;">
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
            <div class="col-9  my-4 pe-5">
                <div>
                    <h6><b>지원 ${aDtos.size()} </b></h6>
                    <table class="table" style="width:100%">
                        <thead>
                            <tr class="table-secondary" align=center>
                                <th scope="col" style="width:15%">이름</th>
                                <th scope="col" style="width:25%">이력서 제목</th>
                                <th scope="col" style="width:25%">포지션</th>
                                <th scope="col" style="width:10%">경력</th>
                                <th scope="col" style="width:10%">학력</th>
                                <th scope="col" style="width:15%">상세보기</th>
                            </tr>
                        </thead>
                        <c:forEach items="${aDtos}" varStatus="status" var="aDto">
                            <tbody>
                                <tr align=center>
                                    <td>${aDto.name}</td>
                                    <td>${aDto.title}</td>
                                    <td>${aDto.position}</td>
                                    <td>${aDto.career}</td>
                                    <td>${aDto.education}</td>
                                    <td><button type="button" class="btn btn-success btn-sm"
                                            onclick="window.open('/resume/${aDto.resumeId}', '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">상세보기</button>
                                    </td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<%@ include file="../layout/footer.jsp" %>