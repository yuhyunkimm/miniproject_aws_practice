<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

<div class="mx-auto width-53 top-80">
            <div class="container mt-5">
                            <div class="mb-3">
                    <h5> 이력서 관리 ( 수정 필요 )</h5>
                </div>
                <div class="row">
                    <!-- <h2> 이력서 관리</h2> -->
                    <div class="col-3" style="text-align: center;">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="card-subtitle text-muted mb-3">사진</h6>
                                <h6 class="card-subtitle text-muted">이름</h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/resume">이력서</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/offer">지원/제안</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/scrap">공고 스크랩</a></h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/update">정보수정</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/logout">로그아웃</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <c:choose>

                            <c:when test="${rDtos != null }">
                                <c:forEach items="${rDtos}" var="rDto">
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <h5 class="card-title" style="text-align: left;">${rDto.title}</h5>
                                            <div class="m-2" style="float: left;">
                                                <h6 class="card-subtitle mb-2 text-muted">${rDto.education}</h6>
                                            </div>
                                            <div class="m-2" style="float: left;">
                                                <h6 class="card-subtitle mb-2 text-muted">${rDto.career}</h6>
                                            </div>
                                            <div class="m-2" style="float: left;">
                                                <h6 class="card-subtitle mb-2 text-muted">${rDto.skillName1}</h6>
                                            </div>
                                            <div class="m-2" style="float: left;">
                                                <h6 class="card-subtitle mb-2 text-muted">${rDto.skillName2}</h6>
                                            </div>
                                            <div class="m-2" style="float: left;">
                                                <h6 class="card-subtitle mb-2 text-muted">${rDto.skillName3}</h6>
                                            </div>
                                            <div style="float: right;" pt-2>
                                                <button type="button" class="btn btn-success btn-sm"
                                                    onclick="location.href='/user/resume/{id}/update'">이력서
                                                    수정</button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <button style="float: right;" type="button" class="btn btn-success mb-4"
                                    onclick="location.href='/user/resume/write'">이력서
                                    작성</button>
                            </c:when>

                            <c:otherwise>
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="card-title" style="text-align: left;">이력서를 등록해주세요</h5>
                                        <div class="mt-3">
                                            <button style="float: left;" type="button" class="btn btn-success"
                                                onclick="location.href='/user/resume/write'">이력서
                                                작성</button>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>




                    </div>
                </div>
            </div>
        </div>


        <%@ include file="../layout/footer.jsp" %>