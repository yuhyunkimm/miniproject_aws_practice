<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53 top-80">
            <div class="mx-auto width-53 top-80">
                <div class="container my-5 py-5">
                    <div class="row">
                        <div class="col-3 px-5" style="text-align: center;">
                            <div class="mb-3">
                                <div class="fs-4">이력서 관리</div>
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
                            <ul class="nav flex-column nav-pills">
                                <li class="nav-item">
                                  <a class="nav-link a p-1 mb-1 active" aria-current="page" href="/user/resume">이력서</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link a p-1 mb-1" href="/user/offer">지원 / 제안</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link a p-1" href="/user/scrap">스크랩</a>
                                </li>
                                <hr>
                                <li class="nav-item">
                                    <a class="nav-link a p-1 mb-1"  href="/user/update" data-bs-toggle="modal" 
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
                        <div class="col-9 my-4 pe-5 mt-5">
                            <c:choose>

                                <c:when test="${rDtos != null }">
                                    <c:forEach items="${rDtos}" var="rDto">
                                        <div class="card mb-4 mt-1">
                                            <a href="/resume/${rDto.resumeId}"
                                                onclick="window.open(this.href, '_blank', 'width=1200,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-9 mt-2">
                                                            <h5 class="card-title" style="text-align: left;">
                                                                ${rDto.title}
                                                            </h5>
                                                            <div class="m-2" style="float: left;">
                                                                <h6 class="card-subtitle text-muted">
                                                                    ${rDto.education}
                                                                </h6>
                                                            </div>
                                                            <div class="m-2" style="float: left;">
                                                                <h6 class="card-subtitle text-muted">${rDto.career}
                                                                </h6>
                                                            </div>
                                                            <div class="m-2" style="float: left;">
                                                                <h6 class="card-subtitle text-muted">
                                                                    ${rDto.address}
                                                                </h6>
                                                            </div>
                                                            <div style="float: left; d-flex">
                                                                <c:forEach items="${rDto.skillList}" var="skill">
                                                                    <span class="badge bg-secondary">${skill}</span>
                                                                </c:forEach>
                                                            </div>
                                                        </div>

                                                        <div class="col-3">
                                                            <div class="row">
                                                                <input type="hidden" value="${rDto.resumeId}" name=""
                                                                    id="resumeId">
                                                                <div style="float: right;">
                                                                    <button type="button"
                                                                        class="btn btn-secondary btn-sm mb-2"
                                                                        data-bs-toggle="modal" data-bs-target="#dModal"
                                                                        style="float: right;"
                                                                        onclick="event.preventDefault();deleteBtn(event, ${rDto.resumeId});">이력서
                                                                        삭제</button>
                                                                </div>
                                                                <div style="float: right;">
                                                                    <button type="button" class="btn btn-success btn-sm"
                                                                        style="float: right;"
                                                                        onclick="location.href=`/user/resume/`+${rDto.resumeId}+`/update`">이력서
                                                                        수정</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </a>

                                        </div>
                                    </c:forEach>

                                    <button style="float: right;" type="button" class="btn btn-success mb-4"
                                        onclick="location.href='/user/resume/write'">이력서
                                        작성</button>
                                </c:when>

                                <c:otherwise>
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <h5 class="card-title" style="text-align: left;">이력서를 등록해주세요</h5>
                                            <div class="mt-3">
                                                <button style="float: left;" type="button" class="btn btn-success"
                                                    onclick="location.href='/user/resume/write'">이력서
                                                    작성</button>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
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
                                        aria-describedby="passwordHelp"
                                        onkeypress="if(event.keyCode=='13'){event.preventDefault(); checkPS(${principal.userId});}">
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

            <div class="modal fade" id="dModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">이력서 삭제</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body ">해당 이력서를 삭제하시겠습니까?</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" onclick="deleteResume()"
                                class="btn btn-primary">삭제하기</button>
                        </div>
                    </div>
                </div>
            </div>
    
        </div>


        <script>

            function deleteResume() {
                $.ajax({
                    type: "delete",
                    url: "/resume/" + $('#resumeId').val() +"/delete",
                    dataType: "json"
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/user/resume";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }

            function deleteBtn(event, resumeId) {
                event.stopPropagation();
            }

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