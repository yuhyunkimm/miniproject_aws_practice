
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
                            <h6 class="card-subtitle mb-1 text-muted"><a href="/user/update" data-bs-toggle="modal" 
                            data-bs-target="#modal">정보수정</a></h6><br>
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
                                    aria-describedby="passwordHelp" onkeypress="if(event.keyCode=='13'){event.preventDefault(); checkPS(${compSession.compId});}">
                                <div id="passwordHelp" class="form-text">현재 비밀번호를 입력해 주세요.</div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary"
                            onclick="passwordCheckBtn(${compSession.compId})">Check</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <script>
            function checkPS(cId){
                passwordCheckBtn(cId);
            }
      
            const passwordInputEl = document.querySelector('#inputPassword')
            const modalEl = document.querySelector('#modal')

            modalEl.addEventListener('shown.bs.modal', function () {
                passwordInputEl.focus()
            })

            function passwordCheckBtn(cId) {

                let data = {
                    compId: cId,
                    password: $('#inputPassword').val()
                }

                $.ajax({
                    type: "post",
                    url: "/comp/passwordCheck",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    datatype: "json"
                }).done((res) => {
                    location.href = "/comp/update";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>