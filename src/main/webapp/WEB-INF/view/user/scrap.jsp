<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53 top-80">
            <div class="container my-5 py-5">     
                <div class="row">
                    <div class="col-3 px-5" style="text-align: center;">
                    <div class="mb-3">
                    <div class="fs-4">공고 스크랩</div>
                </div>
                        <div class="card">
                    <div class="card-body">
                        <div class="relative mb-3">
                            <div>
                                <img src="/images/default_profile.png" class="rounded" alt="Cinque Terre"
                                    style="max-width: 80px;">
                            </div>
                        </div>
                        <div>
                            <h6 class="card-subtitle text-muted">${principal.name}</h6>
                            <hr>
                            <h6 class="card-subtitle mb-1 text-muted"><a href="/user/resume">이력서</a></h6><br>
                            <h6 class="card-subtitle mb-1 text-muted"><a href="/user/offer">지원 / 제안</a></h6><br>
                            <h6 class="card-subtitle mb-1 text-muted"><a href="/user/scrap">스크랩</a></h6>
                            <hr>
                            <h6 class="card-subtitle mb-1 text-muted"><a href="/user/update">정보수정</a></h6><br>
                            <h6 class="card-subtitle mb-1 text-muted"><a href="/logout">로그아웃</a></h6>
                        </div>
                    </div>
                </div>
                    </div>
            <div class="col-9 my-4 pe-5">
                <div class="card-header d-flex justify-content-around">
                    <div class="fs-4">
                        진행중<a href="/"></a>
                    </div>
                    <div class="fs-4">
                        마감<a href="/"></a>
                    </div>
                </div>
                <hr />
                <div class="card mb-4">
                    <div class="card-body">
                        <div>
                            <h5 class="card-title" style="text-align: left;">회사이름</h5>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">경력</h6>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">기간</h6>
                        </div>
                        <div style="float: right;" pt-2>
                            <button type="button" class="btn btn-success btn-sm"
                                onclick="location.href='/resume/{id}'">상세보기</button>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <div>
                            <h5 class="card-title" style="text-align: left;">회사이름</h5>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">경력</h6>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">기술</h6>
                        </div>
                        <div class="m-2" style="float: left;">
                            <h6 class="card-subtitle mb-2 text-muted">기간</h6>
                        </div>
                        <div style="float: right;" pt-2>
                            <button type="button" class="btn btn-success btn-sm"
                                onclick="location.href='/resume/{id}'">상세보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
</div>
</div>
<%@ include file="../layout/footer.jsp" %>