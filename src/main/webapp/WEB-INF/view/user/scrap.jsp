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