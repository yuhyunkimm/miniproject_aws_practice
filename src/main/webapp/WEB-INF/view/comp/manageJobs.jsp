<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>


        <div class="mx-auto width-53">
            <div class="container mt-5">
                <div class="row">
                    <!-- <h2> 이력서 관리</h2> -->
                    <div class="col-3" style="text-align: center;">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"> 회사 공고 등록/ 수정 페이지임 훔쳐온거 수정할거임</h5><br>
                                <h6 class="card-subtitle text-muted mb-3">사진</h6>
                                <h6 class="card-subtitle text-muted">이름</h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/resume">이력서</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/offer">지원/제안</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/scrap">스크랩</a></h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/update">정보수정</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="#">로그아웃</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">이력서 title</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">학력</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                                </div>
                                <div style="float: right;" pt-2>
                                    <button type="button" class="btn btn-success btn-sm" onclick="location.href='#'">이력서
                                        수정</button>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">이력서 title</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">학력</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                                </div>
                                <div style="float: right;" pt-2>
                                    <button type="button" class="btn btn-success btn-sm" onclick="location.href='#'">이력서
                                        수정</button>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">이력서 title</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">학력</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                                </div>
                                <div style="float: right;" pt-2>
                                    <button type="button" class="btn btn-success btn-sm" onclick="location.href='#'">이력서
                                        수정</button>
                                </div>
                            </div>
                        </div>

                        <button style="float: right;" type="button" class="btn btn-success mb-4"
                            onclick="location.href='/user/resume/write'">이력서
                            작성</button>
                    </div>
                </div>
            </div>
        </div>


        <%@ include file="../layout/footer.jsp" %>