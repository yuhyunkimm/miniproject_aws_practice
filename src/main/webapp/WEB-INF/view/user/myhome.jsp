<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <style>
            .user-img:hover {
                filter: brightness(70%);
                /* color: #100f0f;
                opacity: 40%; */
            }
        </style>
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
                                        <a href="/user/profileUpdateForm"
                                            onclick="window.open(this.href, '_blank', 'width=1200,height=900,toolbars=no,scrollbars=no, resizable=no'); return false;">
                                            <div class="user-img">
                                                <img src="${user.photo}" class="rounded" alt="Cinque Terre"
                                                    style="max-width: 80px;">

                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div>
                                    <h6 class="card-subtitle text-muted">${principal.name}</h6>
                                    <hr>
                                    <ul class="nav flex-column nav-pills">
                                        <li class="nav-item">
                                            <a class="nav-link a p-1 mb-1" aria-current="page"
                                                href="/user/resume">이력서</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link a p-1 mb-1" href="/user/offer">지원 / 제안</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link a p-1" href="/user/scrap">스크랩</a>
                                        </li>
                                        <hr>
                                        <li class="nav-item">
                                            <a class="nav-link a p-1 mb-1" href="/user/update" data-bs-toggle="modal"
                                                data-bs-target="#modal">정보수정</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link a p-1" href="/logout">로그아웃</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-9 my-4 pe-5">
                        <h6><b>이력서 <div class="badge count-color px-2 " style="font-weight: 900; font-size: 16px;">
                                    ${usDtos.size()}</div></b></h6>
                        <div class="card mb-2">
                            <div class="card-body mt-3">
                                <table class="table" style="width:100%">
                                    <div class="row">
                                        <div class="card col-4" style="margin: 0; text-align: center; width: 13rem;">
                                            <div class="card-body">
                                                <h5 class="card-title">벡엔드 지원자 입니다</h5>
                                                <p class="card-text">Some quick example text to build on the card title
                                                </p>
                                                <button style="display: inline-block;" type="button"
                                                    class="btn btn-success"
                                                    onclick="location.href='/user/resume/write'">이력서
                                                    작성</button>
                                            </div>
                                        </div>

                                        <div class="card col-4" style="margin: 0; text-align: center; width: 13rem;">
                                            <div class="card-body">
                                                <h5 class="card-title">벡엔드 지원자 입니다</h5>
                                                <p class="card-text">Some quick example text to build on the card title
                                                </p>
                                                <button style="display: inline-block;" type="button"
                                                    class="btn btn-success"
                                                    onclick="location.href='/user/resume/write'">이력서 작성</button>
                                            </div>
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </div>
                        <div class="mb-3 mt-3">
                            <h6><b>관심카테고리(직무별)
                                    <div class="badge count-color px-2 " style="font-weight: 900; font-size: 16px;">
                                        ${usDtos.size()}</div>
                                </b></h6>
                            <div class="card" style="height: 216px; width: 725px;">
                                <div class="card-body mt-3">
                                    <table class="table" style="-ms-flex-item-align: center; width:100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="position" value="서버 개발자">서버
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="position" value="백엔드 개발자"> 백엔드
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="position" value="프론트엔드 개발자"> 프론트엔드

                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="position" value="안드로이드 개발자"> 안드로이드

                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="position" value="IOS 개발자"> IOS
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="position" value="풀스택 개발자"> 풀스택
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <td>
                                                <div class="form-check text-align">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="position"
                                                            value="빅데이터 엔지니어"> 빅데이터
                                                        엔지니어
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-align">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="position"
                                                            value="임베디드 개발자"> 임베디드

                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-align">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="position"
                                                            value="devops 개발자">
                                                        devops
                                                    </label>
                                                </div>
                                            </td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-4 pe-5">
                            <h6><b>추천 공고 <div class="badge count-color px-2 "
                                        style="font-weight: 900; font-size: 16px;">
                                        ${usDtos.size()}</div></b></h6>
                            <div class="card mb-2">
                                <div class="card-body mt-3">
                                    <table class="table" style="width:100%">
                                        <div class="row">
                                            <div class="card col-4"
                                                style="margin: 0; text-align: center; width: 16rem;">
                                                <img src="/images/Samsung.png" class="card-img-top">
                                                <div class="card-body">
                                                    <h5 class="card-title">벡엔드 지원자 입니다</h5>
                                                    <p class="card-text">Some quick example text to build on the card
                                                        title
                                                    </p>
                                                    <button style="display: inline-block;" type="button"
                                                        class="btn btn-success"
                                                        onclick="location.href='/user/resume/write'">이력서
                                                        작성</button>
                                                </div>
                                            </div>

                                            <div class="card col-4"
                                                style="margin: 0; text-align: center; width: 16rem;">
                                                <img src="/images/Samsung.png" class="card-img-top">
                                                <div class="card-body">
                                                    <h5 class="card-title">벡엔드 지원자 입니다</h5>
                                                    <p class="card-text">Some quick example text to build on the card
                                                        title
                                                    </p>
                                                    <button style="display: inline-block;" type="button"
                                                        class="btn btn-success"
                                                        onclick="location.href='/user/resume/write'">이력서 작성</button>
                                                </div>
                                            </div>
                                        </div>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalLabel">비밀번호 인증</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="inputPassword" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="inputPassword"
                                                    aria-describedby="passwordHelp"
                                                    onkeypress="if(event.keyCode=='13'){event.preventDefault(); checkPS(`${principal.userId}`);}">
                                                <div id="passwordHelp" class="form-text">현재 비밀번호를 입력해 주세요.</div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary"
                                            onclick="passwordCheckBtn(`${principal.userId}`)">Check</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        function checkPS(uId) {
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