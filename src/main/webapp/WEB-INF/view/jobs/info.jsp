<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53 mx-5 px-3 top-80">
            <div class="mb-4">
                <ul class="nav nav-pills nav-justified">
                    <li class="nav-item mx-2">
                        <button class="nav-link active tap-btn" id="btn1" onclick="openTab(event, 'tab1')">지역별</button>
                    </li>
                    <li class="nav-item mx-2">
                        <button class="nav-link tap-btn" " id=" btn2" onclick="openTab(event, 'tab2')">기술별</button>
                    </li>
                    <li class="nav-item mx-2">
                        <button class="nav-link tap-btn" id="btn3" onclick="openTab(event, 'tab3')">직무별</button>
                    </li>
                    <li class="nav-item mx-2">
                        <button class="nav-link tap-btn" id="btn4" onclick="openTab(event, 'tab4')">경력별</button>
                    </li>
                </ul>
            </div>

            <div id="my-table-body1" style="display: block;">
                <table class="my-table table table-bordered">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="서울">서울
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="경기도"> 경기도
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="인천"> 인천
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="부산"> 부산
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="대구"> 대구
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="대전"> 대전
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="광주"> 광주
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="제주"> 제주
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="지역"> 지역
                                    </label>
                                </div>

                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="address" value="지역 2"> 지역
                                        2
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


        </div>
        <div class="col-4 d-flex justify-content-end">
            <button type="button" class="btn btn-primary mb-2 my-auto" onclick="resetCheckboxes()" >초기화</button>
            <button type="button" class="btn btn-primary mx-3 mb-2 my-auto" onclick="searchInfo()" id="search-info-btn">검색하기</button>
        </div>
    </div>


    <div class="hr"></div>
    <div class="under-line">
    </div>
    <div id="result">
        ${keyword} 검색결과
    </div>
    <!-- 공고들 -->
    <div class="d-flex flex-wrap my-3 info-card">
        <c:forEach items="${jDtos}" var="jDto">
            <div class="col-3 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}"
                    onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">
                    <div class="card">
                        <div>
                            <img src='${jDto.photo}' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                ${jDto.compName}
                            </div>
                            <div class="fs-5">
                                ${jDto.title}
                            </div>
                            <div>
                                <c:forEach items="${jDto.skillList}" var="skill">
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
                            <div id="scrap-${jDto.jobsId}-render">
                                <div id="scrap-${jDto.jobsId}-remove">
                                    <c:choose>
                                        <c:when test="${jDto.userScrapId > 0}">
                                            <i id="scrap-${jDto.jobsId}" class="fa-solid on-Clicked fa-star my-cursor"
                                                onclick="scrap(`${jDto.jobsId}`,`${principal.userId}`,`${jDto.userScrapId}`)"></i>
                                        </c:when>
        
                                        <c:otherwise>
                                            <i id="scrap-${jDto.jobsId}" class="fa-regular fa-star my-cursor"
                                                onclick="scrap(`${jDto.jobsId}`,`${principal.userId}`,`${jDto.userScrapId}`)"></i>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="JavaScript">
                                        JavaScript
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="Spring">
                                        Spring
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="HTML"> HTML
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="jQuery">
                                        jQuery
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="JSP"> JSP
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="Vue.js">
                                        Vue.js
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="Oracle">
                                        Oracle
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="MySQL">
                                        MySQL
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="skill" value="React">
                                        React
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="my-table-body3" style="display: none;">
                <table class="my-table table table-bordered">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position"
                                            value="서버 개발자">서버 개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position" value="백엔드 개발자">
                                        백엔드 개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position"
                                            value="프론트엔드 개발자"> 프론트엔드
                                        개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position"
                                            value="안드로이드 개발자"> 안드로이드
                                        개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position" value="IOS 개발자">
                                        IOS 개발자
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position" value="풀스택 개발자">
                                        풀스택 개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position"
                                            value="빅데이터 엔지니어"> 빅데이터
                                        엔지니어
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position"
                                            value="임베디드 개발자"> 임베디드
                                        개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position"
                                            value="devops 개발자">
                                        devops 개발자
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" name="position" value="비엇음"> 비엇음
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="my-table-body4" class="display-none">
                <table class="my-table table table-bordered">
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="신입">신입
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="1년차 미만"> 1년차
                                        미만
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="1년차"> 1년차
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="2년차"> 2년차
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="3년차"> 3년차
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="4년차"> 4년차
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="5년차"> 5년차
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="6년차"> 6년차
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="7년차"> 7년차
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="form-check text-center">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="career" value="8년차 이상"> 8년차
                                        이상
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="row justify-content-between">
                <div class="col-8 d-flex flex-wrap" id="selected">

                </div>
                <div class="col-4 d-flex justify-content-end">
                    <button type="button" class="btn btn-primary mb-2 my-auto" onclick="resetCheckboxes()">초기화</button>
                    <button type="button" class="btn btn-primary mx-3 mb-2 my-auto" onclick="searchInfo()"
                        id="search-info-btn">검색하기</button>
                </div>
            </div>


            <div class="hr"></div>
            <div class="under-line">
            </div>
            <div id="result">
                ${keyword} 검색결과
            </div>
            <!-- 공고들 -->
            <div class="d-flex flex-wrap my-3 info-card">
                <c:forEach items="${jDtos}" var="jDto">
                    <div class="col-3 px-2 py-2 remove-card">
                        <a href="/jobs/${jDto.jobsId}"
                            onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">
                            <div class="card">
                                <div class=" pt-4 px-auto" style="text-align: center;">
                                    <img src='${jDto.photo}' alt="" srcset="" style="height: 4em; width: 130px;">
                                </div>
                                <div class="card-body">
                                    <div>
                                        ${jDto.compName}
                                    </div>
                                    <div class="fs-5">
                                        ${jDto.title}
                                    </div>
                                    <div>
                                        <c:forEach items="${jDto.skillList}" var="skill">
                                            <span class="badge bg-primary">${skill}</span>
                                        </c:forEach>
                                    </div>
                                    <div>
                                        ${jDto.career} ${jDto.education} ${jDto.address}
                                    </div>
                        </a>
                        <div class="d-flex justify-content-between">
                            <c:choose>
                                <c:when test="${principal != null}">
                                    <div id="scrap-${jDto.jobsId}-render">
                                        <div id="scrap-${jDto.jobsId}-remove">
                                            <c:choose>
                                                <c:when test="${jDto.userScrapId > 0}">
                                                    <i id="scrap-${jDto.jobsId}"
                                                        class="fa-solid on-Clicked fa-star my-cursor"
                                                        onclick="scrap(`${jDto.jobsId}`,`${principal.userId}`,`${jDto.userScrapId}`)"></i>
                                                </c:when>

                                                <c:otherwise>
                                                    <i id="scrap-${jDto.jobsId}" class="fa-regular fa-star my-cursor"
                                                        onclick="scrap(`${jDto.jobsId}`,`${principal.userId}`,`${jDto.userScrapId}`)"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <div>
                                        <a href="/user/login">
                                            <i id="scrap-${jDto.jobsId}" class="fa-regular fa-star"></i>
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
        <script>
            let jobsId;
            let userId;
            let userScrapId;

            function scrap(jobs, user, userScrap) {
                jobsId = jobs;
                userId = user;

                // 스크랩 id 있을때
                if (userScrap > 0) {
                    userScrapId = userScrap;
                    $.ajax({
                        type: "delete",
                        url: "/user/scrap/" + userScrapId + "/delete",
                        dataType: "json"
                    }).done((res) => {
                        userScrapId = res.data;
                        changeScrap();
                    }).fail((err) => {
                        alert(err.responseJSON.msg);
                    });

                } else {
                    let data = {
                        userId: user,
                        jobsId: jobs
                    }
                    $.ajax({
                        type: "post",
                        url: "/user/scrap/insert",
                        data: JSON.stringify(data),
                        headers: {
                            "content-type": "application/json; charset=utf-8"
                        },
                        dataType: "json"
                    }).done((res) => {
                        userScrapId = res.data;
                        changeScrap();
                    }).fail((err) => {
                        alert(err.responseJSON.msg);
                    });
                }
            }

            function changeScrap() {
                $('#scrap-' + jobsId + '-remove').remove();
                renderScrap();
            }

            function renderScrap() {
                let el;

                if (userScrapId > 0) {
                    el = `
            <div id="scrap-`+ jobsId + `-remove">
                <i id="scrap-`+ jobsId + `" class="fa-solid on-Clicked fa-star my-cursor"
                                        onclick="scrap(`+ jobsId + `,` + userId + `,` + userScrapId + `)"></i>
                                    </div>
            `;
                } if (userScrapId === 0) {
                    el = `
            <div id="scrap-`+ jobsId + `-remove">
                <i id="scrap-`+ jobsId + `" class="fa-regular fa-star my-cursor"
                                        onclick="scrap(`+ jobsId + `,` + userId + `,` + userScrapId + `)"></i>
                                    </div>
            `;
                }
                $('#scrap-' + jobsId + '-render').append(el);
            }

            document.getElementById("btn1").addEventListener("click", function () {
                changeTable("btn1");
            });
            document.getElementById("btn2").addEventListener("click", function () {
                changeTable('btn2');
            });
            document.getElementById("btn3").addEventListener("click", function () {
                changeTable("btn3");
            });
            document.getElementById("btn4").addEventListener("click", function () {
                changeTable("btn4");
            });

            function changeTable(btn) {
                if (btn === 'btn1') {
                    $("#my-table-body1").show();
                    $('#my-table-body2').hide();
                    $('#my-table-body3').hide();
                    $('#my-table-body4').hide();
                }
                if (btn === 'btn2') {
                    $("#my-table-body1").hide();
                    $('#my-table-body2').show();
                    $('#my-table-body3').hide();
                    $('#my-table-body4').hide();
                }
                if (btn === 'btn3') {
                    $("#my-table-body1").hide();
                    $('#my-table-body2').hide();
                    $('#my-table-body3').show();
                    $('#my-table-body4').hide();
                }
                if (btn === 'btn4') {
                    $("#my-table-body1").hide();
                    $('#my-table-body2').hide();
                    $('#my-table-body3').hide();
                    $('#my-table-body4').show();
                }
            }

            function openTab(evt, tabName) {
                let tablinks;
                // 모든 탭 버튼에서 active 클래스를 제거
                tablinks = document.getElementsByClassName("tap-btn");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].classList.remove("active");
                }
                evt.currentTarget.classList.add("active");
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

            let addressValues;
            let skillValues;
            let positionValues;
            let careerValue;

            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('click', function () {
                    addressValues = getCheckedValues("address");
                    skillValues = getCheckedValues("skill");
                    positionValues = getCheckedValues("position");
                    careerValue = $("input[name='career']:checked").val();

                    let data = {
                        address: addressValues,
                        skill: skillValues,
                        position: positionValues,
                        career: careerValue
                    }
                    $('.selectBox-remove').remove();
                    rendering(addressValues);
                    rendering(skillValues);
                    rendering(positionValues);
                    render(careerValue);

                    // $('.remove-card').remove();
                    $.ajax({
                        type: "post",
                        url: "/jobs/info/list",
                        data: JSON.stringify(data),
                        headers: {
                            "content-type": "application/json; charset=utf-8"
                        },
                        dataType: "json"
                    }).done((res) => {
                        newbtn(res.data);
                    }).fail((err) => {
                    });
                });
            });

            $("input[name='career']").click(function () {
                addressValues = getCheckedValues("address");
                skillValues = getCheckedValues("skill");
                positionValues = getCheckedValues("position");
                careerValue = $("input[name='career']:checked").val();

                let data = {
                    address: addressValues,
                    skill: skillValues,
                    position: positionValues,
                    career: careerValue
                }
                $('.selectBox-remove').remove();
                rendering(addressValues);
                rendering(skillValues);
                rendering(positionValues);
                render(careerValue);

                // $('.remove-card').remove();
                $.ajax({
                    type: "post",
                    url: "/jobs/info/list",
                    data: JSON.stringify(data),
                    headers: {
                        "content-type": "application/json; charset=utf-8"
                    },
                    dataType: "json"
                }).done((res) => {
                    newbtn(res.data);
                }).fail((err) => {
                });
            });

            function rendering(checkboxes) {
                if (checkboxes.length > 0) {
                    checkboxes.forEach(function (checkbox) {
                        render(checkbox);
                    });
                }
            }

            function render(values) {
                if (values !== undefined) {
                    let el = `
            <h5 class="selectBox-remove me-2"><span class="badge bg-light text-dark" onclick="deleteBox()" value=`+ values + `>` + values + `  X 
            </span>
            </h5>
        `;
                    $('#selected').append(el);
                }
            }

            const radios = document.querySelectorAll('input[type="radio"]');
            function resetCheckboxes() {
                radios.forEach((radio) => {
                    radio.checked = false;
                })
                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = false;
                    $('.selectBox-remove').remove();
                    addressValues = getCheckedValues("address");
                    skillValues = getCheckedValues("skill");
                    positionValues = getCheckedValues("position");
                    careerValue = $("input[name='career']:checked").val();
                    $('#search-info-btn').text("검색하기");
                });
            }

            function newbtn(num) {
                $('#search-info-btn').text("'" + num + "' 건 검색하기");
            }

            // function deleteBox() {
            //     // console.log(event.currentTarget);
            //     let deleteValue = $(event.currentTarget).attr('value');
            //     $(event.currentTarget).remove();
            //     addressValues.filter((e)=>e !== deleteValue);
            //     skillValues;
            //     positionValues;
            //     careerValue;
            // }

            function searchInfo() {
                let arr1 = addressValues;
                let address = 'address=' + arr1.join(',');
                let arr2 = skillValues;
                let skill = 'skill=' + arr2.join(',');
                let arr3 = positionValues;
                let position = 'position=' + arr3.join(',');
                if (careerValue === undefined) {
                    careerValue = '';
                }
                $('.remove-card').remove();
                $.ajax({
                    type: "get",
                    url: "/jobs/info/search?" + address + "&" + skill + "&" + position + "&career=" + careerValue,
                    dataType: "json"
                }).done((res) => {
                    renderInfo(res.data);
                    $('#result').text('검색결과');
                }).fail((err) => {
                    // console.log(err.responseJSON.msg);
                });
            }

            function renderInfo(jDtos) {
                jDtos.forEach(jDto => {
                    let el = `
            <div class="col-3 px-2 py-2 remove-card">
                <a href="/jobs/`+ jDto.jobsId + `">
                    <div class="card">
                        <div>
                            <img src='`+ jDto.photo + `' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                `+ jDto.compName + `
                            </div>
                            <div class="fs-5">
                                `+ jDto.title + `
                            </div>

                            <div id="insert-skill-`+jDto.jobsId+`">
                            </div>
                            <div>
                                `+ jDto.career + " " + jDto.education + " " + jDto.address + `
                            </div>
                            <div class="d-flex justify-content-between">
                                <div><i id="scrap-`+ jDto.jobsId + `" class="fa-regular fa-star"
                                        onclick="scrap(`+ jDto.jobsId + `)"></i>
                                    <input type="hidden" id="endDate-`+ jDto.jobsId + `" value="` + jDto.endDate + `">
                                </div>
                                <div>
                                    D-`+ jDto.leftTime + `
                                </div>

                            </div>
                        </div>
                </div>
                </a>
            </div>
            `;


            // console.log(jDto.skillList);
            $('.info-card').append(el);
            insertSkill(jDto.skillList,jDto.jobsId);
        });
    }
    function insertSkill(skillList,jobsId){
        skillList.forEach(skill => {
            el =`
                <span class="badge skill-color">`+skill+`</span>
            `;
        $('#insert-skill-'+jobsId).append(el);
        })
    }
</script>
<%@ include file="../layout/footer.jsp" %>

