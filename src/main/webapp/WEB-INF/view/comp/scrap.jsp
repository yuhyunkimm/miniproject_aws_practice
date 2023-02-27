<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53">
            <div class="container mt-5 mb-5">
                <div class="mb-3">
                    <h5>이력서 스크랩</h5>
                </div>
                <div class="row">
                    <div class="col-3" style="text-align: center;">
                        <div class="card">
                            <div class="card-body">
                                <!-- <h5 class="card-title">지원 및 제안</h5><br> -->
                                <h6 class="card-subtitle text-muted mb-3">사진</h6>
                                <h6 class="card-subtitle text-muted">이름</h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="#">공고등록/수정</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="#">지원자 현황</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="#">이력서 스크랩</a></h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="#">정보수정</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="#">로그아웃</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <h6><b>전체 2</b></h6>
                        <hr />
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">이력서 title</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">이름</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">학력</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                                </div>
                                <div style="float: right;" pt-2>
                                    <button type="button" class="btn btn-success btn-sm"
                                        onclick="location.href='/resume/{id}'">상세보기</button>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">이력서 title</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">이름</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">학력</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                                </div>
                                <div style="float: right;" pt-2>
                                    <button type="button" class="btn btn-success btn-sm"
                                        onclick="location.href='#'">상세보기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>



        <%@ include file="../layout/footer.jsp" %>