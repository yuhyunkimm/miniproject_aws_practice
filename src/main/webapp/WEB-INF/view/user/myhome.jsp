<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="mx-auto width-53 top-80">
    <div class="container my-5 py-5">
        <div class="row">
            <div class="col-3 px-5" style="text-align: center;">
                <div class="mb-3">
                    <div class="fs-4">마이 홈</div>
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
                <div>
                    <h6><b>지원 현황 / 기업 요청 숫자 넣을 거임 </b></h6>
                    <table class="table" style="width:100%">
                        <thead>
                            <tr class="table-secondary" align=center>
                                <th scope="col" style="width:30%">No.</th>
                                <th scope="col" colspan=2 style="width:40%">제목</th>
                                <th scope="col"></th>
                                <th scope="col" style="width:30%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr align=center>
                                <th scope="row">1</th>
                                <td colspan=2>경력직 서버개발자 모집</td>
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
                    <br />
                    <table class="table" style="width:100%">
                        <h6><b>추천 인재</b></h6>
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