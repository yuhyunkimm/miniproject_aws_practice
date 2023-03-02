<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53 top-80">
            <div class="container mt-5 mb-5">
                <div class="mb-3">
                <div>
                    <h5>이력서 스크랩</h5>
                </div>
                <div class="row">
                    <div class="col-3" style="text-align: center;">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="card-subtitle text-muted mb-3">사진</h6>
                                <h6 class="card-subtitle text-muted">이름</h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/resume">이력서</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/offer">지원 / 제안</a></h6><br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/user/scrap">스크랩</a></h6>
                                <hr>
                                <h6 class="card-subtitle mb-1 text-muted">
                                    <div class="mb-1" data-bs-toggle="modal" data-bs-target="#modal">
                                        정보수정
                                    </div>
                                    <br>
                                <h6 class="card-subtitle mb-1 text-muted"><a href="/logout">로그아웃</a></h6>
                            </div>
                        </div>
                    </div>
            <div class="col-9">
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
</div>
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">비밀번호 인증</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-3">
                                <label for="inputPassword" class="form-label">Password</label>
                                <input type="password" class="form-control" id="inputPassword"
                                    aria-describedby="passwordHelp">
                                <div id="passwordHelp" class="form-text">현재 비밀번호를 입력해 주세요.</div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" onclick="checkPassword()">Check</button>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="../layout/footer.jsp" %>