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
                                    ${rDtos.size()}</div></b></h6>
                        <div class="card mb-2">
                            <div class="card-body mt-3 ">
                                <table class="table" style="width:100%">
                                    <div class="row">
                                        <c:forEach items="${rDtos}" var="rDto" begin="0" end="1">
                                            <div class="col-6 ">
                                                <a href="/resume/${rDto.resumeId}" style="width: 240px; height: 120px;"
                                                    onclick="window.open(this.href, '_blank', 'width=1200,height=900,toolbars=no,scrollbars=no, resizable=no'); return false;">
                                                    <div class="card card-color">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="text-align: center;">
                                                                ${rDto.title}</h5>
                                                            <!-- <div class="d-flex justify-content-around ">
                                                                <div style="float: left;">
                                                                    <h6 class="card-subtitle mb-2">${rDto.career}</h6>
                                                                </div>
                                                                <div style="float: left;">
                                                                    <h6 class="card-subtitle mb-2">${rDto.address}</h6>
                                                                </div>

                                                            </div> -->
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>


                                    </div>
                                </table>
                            </div>
                        </div>
                        <div class="mb-3 mt-3">
                            <h6><b>관심카테고리(직무별)

                                </b></h6>
                            <div class="card">
                                <div class="card-body mt-3">
                                    <table class="table" style="-ms-flex-item-align: center; width:100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="interest" value="서버 개발자" <c:forEach
                                                                items="${iDtos}" var="interest">
                                                            ${interest.interestCt=='서버 개발자' ? 'checked="checked"' : '' }
                                                            </c:forEach>
                                                            >서버 개발자
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="interest" value="백엔드 개발자" <c:forEach
                                                                items="${iDtos}" var="interest">
                                                            ${interest.interestCt=='백엔드 개발자' ? 'checked="checked"' : ''
                                                            }
                                                            </c:forEach>
                                                            > 백엔드 개발자
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="interest" value="프론트엔드 개발자" <c:forEach
                                                                items="${iDtos}" var="interest">
                                                            ${interest.interestCt=='프론트엔드 개발자' ? 'checked="checked"' :
                                                            '' }
                                                            </c:forEach>
                                                            > 프론트엔드 개발자

                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="interest" value="안드로이드 개발자" <c:forEach
                                                                items="${iDtos}" var="interest">
                                                            ${interest.interestCt=='안드로이드 개발자' ? 'checked="checked"' :
                                                            '' }
                                                            </c:forEach>
                                                            > 안드로이드 개발자

                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="interest" value="IOS 개발자" <c:forEach
                                                                items="${iDtos}" var="interest">
                                                            ${interest.interestCt=='IOS 개발자' ? 'checked="checked"' : ''
                                                            }
                                                            </c:forEach>
                                                            > IOS 개발자
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-align">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                name="interest" value="풀스택 개발자" <c:forEach
                                                                items="${iDtos}" var="interest">
                                                            ${interest.interestCt=='풀스택 개발자' ? 'checked="checked"' : ''
                                                            }
                                                            </c:forEach>
                                                            > 풀스택 개발자
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <td>
                                                <div class="form-check text-align">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="interest"
                                                            value="빅데이터 엔지니어" <c:forEach items="${iDtos}"
                                                            var="interest">
                                                        ${interest.interestCt=='빅데이터 엔지니어' ? 'checked="checked"' : '' }
                                                        </c:forEach>
                                                        > 빅데이터 엔지니어
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-align">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="interest"
                                                            value="임베디드 개발자" <c:forEach items="${iDtos}" var="interest">
                                                        ${interest.interestCt=='임베디드 개발자' ? 'checked="checked"' : '' }
                                                        </c:forEach>
                                                        > 임베디드 개발자

                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-align">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="interest"
                                                            value="devops 개발자" <c:forEach items="${iDtos}"
                                                            var="interest">
                                                        ${interest.interestCt=='devops 개발자' ? 'checked="checked"' : '' }
                                                        </c:forEach>
                                                        >devops 개발자
                                                    </label>
                                                </div>
                                            </td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="my-4">
                            <h6><b>추천 공고</b></h6>
                            <div class="card mb-2">
                                <div class="d-flex flex-wrap  info-card m-3">
                                    <c:forEach items="${jDtos}" var="jDto" begin="1" end="3">
                                        <div class="col-4 px-2 py-2 remove-card">
                                            <a href="/jobs/${jDto.jobsId}"
                                                onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">
                                                <div class="card main-card">
                                                    <div class="pt-4 px-auto" style="text-align: center;">
                                                        <img src='${jDto.photo}' alt="" srcset=""
                                                            style="height: 4em; width: 200px;">
                                                    </div>
                                                    <div class="card-body">
                                                        <div>
                                                            ${jDto.compName}
                                                        </div>
                                                        <div class="fs-5">
                                                            ${jDto.title}
                                                        </div>
                                                        <div>
                                                            <c:forEach items="${jDto.skillList}" var="skill" begin="1"
                                                                end="3">
                                                                <span class="badge  skill-color">${skill}</span>
                                                            </c:forEach>
                                                        </div>
                                                        <div>
                                                            ${jDto.career} ${jDto.education} ${jDto.address}
                                                        </div>

                                            </a>
                                            <div class="d-flex justify-content-between">
                                                <c:choose>
                                                    <c:when test="${principal != null}">
                                                        <div class="scrap-${jDto.jobsId}-render">
                                                            <div class="scrap-${jDto.jobsId}-remove">
                                                                <c:choose>
                                                                    <c:when test="${jDto.userScrapId > 0}">
                                                                        <i id="scrap-${jDto.jobsId}"
                                                                            class="fa-solid on-Clicked fa-star my-cursor"
                                                                            onclick="scrap(`${jDto.jobsId}`,`${principal.userId}`,`${jDto.userScrapId}`)"></i>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <i id="scrap-${jDto.jobsId}"
                                                                            class="fa-regular fa-star my-cursor"
                                                                            onclick="scrap(`${jDto.jobsId}`,`${principal.userId}`,`${jDto.userScrapId}`)"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div>
                                                            <a href="/user/login">
                                                                <i id="scrap-${jDto.jobsId}"
                                                                    class="fa-regular fa-star"></i>
                                                            </a>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div>
                                                    D-${jDto.leftTime}
                                                </div>
                                            </div>
                                        </div>
                                </div>

                            </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
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
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary"
                                    onclick="passwordCheckBtn(`${principal.userId}`)">Check</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>

        <input type="hidden" id="pricipalId" value="${principal.userId}">
        <script>
            function checkPS(uId) {
                passwordCheckBtn(uId);
            }

            const passwordInputEl = document.querySelector('#inputPassword')
            const modalEl = document.querySelector('#modal')

            modalEl.addEventListener('shown.bs.modal', function () {
                passwordInputEl.focus()
            });

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
            function getCheckedValues(name) {
                var checkedValues = [];
                var checkboxes = document.getElementsByName(name);
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        checkedValues.push(checkboxes[i].value);
                    }
                }
                return checkedValues;
            }

            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('click', function () {
                    interestValues = getCheckedValues("interest");
                    // console.log(interestValues);
                    let data = {
                        userId: $('#pricipalId').val(),
                        interestList: interestValues
                    };
                    $.ajax({
                        type: "put",
                        url: "/interest/change",
                        data: JSON.stringify(data),
                        headers: {
                            "content-type": "application/json; charset=utf-8"
                        },
                        dataType: "json"
                    }).done((res) => {
                    }).fail((err) => {
                    });
                })
            });
            function getCheckedValues(name) {
                var checkedValues = [];
                var checkboxes = document.getElementsByName(name);
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        checkedValues.push(checkboxes[i].value);
                    }
                }
                return checkedValues;
            }
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('click', function () {
                    interestValues = getCheckedValues("interest");
                    // console.log(interestValues);
                    let data = {
                        userId: $('#pricipalId').val(),
                        interestList: interestValues
                    };
                    $.ajax({
                        type: "put",
                        url: "/user/interest/change",
                        data: JSON.stringify(data),
                        headers: {
                            "content-type": "application/json; charset=utf-8"
                        },
                        dataType: "json"
                    }).done((res) => {
                    }).fail((err) => {
                    });
                })
            });
        </script>
        <%@ include file="../layout/footer.jsp" %>