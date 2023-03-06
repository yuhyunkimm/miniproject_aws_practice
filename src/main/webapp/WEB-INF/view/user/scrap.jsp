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
                                        <a href="/user/profileUpdateForm" onclick="window.open(this.href, '_blank', 'left=300,width=1100,height=900,toolbars=no,scrollbars=no, toolbars=no, menubar=no, resizable=no'); return false;">
                                            <div>
                                                <img src="${user.photo}" class="rounded" alt="Cinque Terre" style="max-width: 80px;">
                                                <%-- <img src="${user.photo}" alt="Current Photo" class="img-fluid" id="imagePreview"> --%>
                                            </div>
                                            <div>
                                                <span style="font-size: 14px;">사진 수정</span><i class="ms-1 fa-solid fa-gear mt-3"></i>
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
                                            <a class="nav-link a p-1 mb-1 active " href="/user/scrap">스크랩</a>
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
                        <h6><b>전체  <div class="badge count-color px-2 " style="font-weight: 900; font-size: 16px;">${usDtos.size()}</div></b></h6>
                        <c:forEach items="${usDtos}" var="usDto">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h5 class="card-title" style="text-align: left;">${usDto.title} D-${usDto.leftTime}
                                    </h5>
                                    <div class="mt-4">
                                        <div class="me-2" style="float: left;">
                                            <h6 class="card-subtitle  text-muted">${usDto.compName}</h6>
                                        </div>
                                        <div class="me-2" style="float: left;">
                                            <h6 class="card-subtitle  text-muted">${usDto.position}</h6>
                                        </div>
                                        <div class="me-2" style="float: left;">
                                            <h6 class="card-subtitle  text-muted">${usDto.career}</h6>
                                        </div>
                                        <c:forEach items="${usDto.skillList}" var="skill" begin="0" end="3">
                                            <div class="me-2 pb-2" style="float: left;">
                                                <span class="badge  skill-color">${skill}</span>
                                            </div>
                                        </c:forEach>
    
                                        <div style="float: right;" pt-2>
                                            <button type="button" class="btn btn-success btn-sm"
                                            onclick="window.open(`/jobs/${usDto.userScrapId}`, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">상세보기</button>
                                        </div>     
                                    </div>
                                    
                                </div>
                            </div>
                        </c:forEach>
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