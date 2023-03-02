<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="mx-auto width-53 top-80">
            <div class="container my-5 py-5">   
                <div class="row">
                    <div class="col-3 px-5" style="text-align: center;">
                              <div class="mb-3">
                    <div class="fs-4">지원 및 제안</div>
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
                            <h6><b>지원 3 </b></h6>
                            <table class="table" style="width:100%">
                                <thead>
                                    <tr class="table-secondary" align=center>
                                        <th scope="col" style="width:10%">No.</th>
                                        <th scope="col" style="width:25%">지원회사</th>
                                        <th scope="col" style="width:30%">채용정보</th>
                                        <th scope="col" style="width:25%">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr align=center>
                                        <th scope="row">1</th>
                                        <td>카카오</td>
                                        <td>백엔드 개발자 모집</td>
                                        <td>입사지원</td>
                                    </tr>
                                    <tr align=center>
                                        <th scope="row">2</th>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <table class="table" style="width:100%">
                                <h6><b>제안 3 </b></h6>
                                <thead>
                                    <tr class="table-secondary" align=center>
                                        <th scope="col" style="width:10%">No.</th>
                                        <th scope="col" style="width:25%">제안회사</th>
                                        <th scope="col" style="width:30%">제안내용</th>
                                        <th scope="col" style="width:25%">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr align=center>
                                        <th scope="row">1</th>
                                        <td>인프런</td>
                                        <td>강사</td>
                                        <td>답변가능</td>
                                    </tr>
                                    <tr align=center>
                                        <th scope="row">2</th>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@ include file="../layout/footer.jsp" %>