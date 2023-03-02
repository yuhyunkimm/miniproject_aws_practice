<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="mx-auto width-53 top-80">
            <div class="container mt-5 mb-5">
                <div class="mb-3">
                    <h5> 마이 홈 ( 수정 필요 )</h5>
                </div>
                <div class="row">
                    <div class="col-3" style="text-align: center;">
                        <div class="card">
                            <div class="card-body">
                                <!-- <h5 class="card-title">지원 및 제안</h5><br> -->
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
                                    aria-describedby="passwordHelp" onkeypress="if(event.keyCode=='13'){event.preventDefault(); checkPS(${principal.userId});}">
                                <div id="passwordHelp" class="form-text">현재 비밀번호를 입력해 주세요.</div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary"
                            onclick="passwordCheckBtn(${principal.userId})">Check</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function checkPS(uId){
                passwordCheckBtn(uId);
            }
      
            const passwordInputEl = document.querySelector('#inputPassword')
            const modalEl = document.querySelector('#modal')

            modalEl.addEventListener('shown.bs.modal', function () {
                passwordInputEl.focus()
            })

            function passwordCheckBtn(uId) {

                let data = {
                    userId: uId,
                    password: $('#inputPassword').val()
                }

                $.ajax({
                    type: "post",
                    url: "/user/passwordCheck",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    datatype: "json"
                }).done((res) => {
                    location.href = "/user/update";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>