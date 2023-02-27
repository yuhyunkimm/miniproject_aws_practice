<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

        <div class="mx-auto width-53">
            <div class="container mt-5 mb-5">
                <div class="mb-3">
                    <h5>기업 홈</h5>
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
                        <div>
                            <h6><b>동록된 공고 </b></h6>
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