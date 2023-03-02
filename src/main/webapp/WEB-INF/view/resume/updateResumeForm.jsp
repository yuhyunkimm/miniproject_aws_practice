<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="mx-auto width-53 top-80">
            <div class="container">
                <form>
                    <div class="row">
                        <div class="col-10">
                            <br>
                            이력서 수정<br>
                            <hr />
                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">기본 정보</div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-3">
                                            프로필 사진
                                        </div>
                                        <div class="col-9">
                                            <p>이름</p>
                                            <p>번호</p>
                                            <p>email</p>
                                            <p>주소</p>
                                            <p>생년월일</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">학력 사항</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <select class="form-select" name="education" id="education">
                                            <option selected disabled>학력 사항을 선택해주세요</option>
                                            <option value="초졸" ${rDto.education=='초졸' ? 'selected="selected"' : '' }>초졸
                                            </option>
                                            <option value="중졸" ${rDto.education=='중졸' ? 'selected="selected"' : '' }>중졸
                                            </option>
                                            <option value="고졸" ${rDto.education=='고졸' ? 'selected="selected"' : '' }>고졸
                                            </option>
                                            <option value="대졸" ${rDto.education=='대졸' ? 'selected="selected"' : '' }>대졸
                                            </option>
                                            <option value="대학원 이상" ${rDto.education=='대학원 이상' ? 'selected="selected"'
                                                : '' }>대학원 이상</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">경력 사항</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <select class="form-select" name="career" id="career">
                                            <option selected disabled>경력 사항을 선택해주세요</option>
                                            <option value="신입" ${rDto.career=='신입' ? 'selected="selected"' : '' }>신입
                                            </option>
                                            <option value="1년차 미만" ${rDto.career=='1년차 미만' ? 'selected="selected"' : ''
                                                }>1년차 미만</option>
                                            <option value="1년" ${rDto.career=='1년' ? 'selected="selected"' : '' }>1년
                                            </option>
                                            <option value="2년" ${rDto.career=='2년' ? 'selected="selected"' : '' }>2년
                                            </option>
                                            <option value="3년" ${rDto.career=='3년' ? 'selected="selected"' : '' }>3년
                                            </option>
                                            <option value="4년" ${rDto.career=='4년' ? 'selected="selected"' : '' }>4년
                                            </option>
                                            <option value="5년" ${rDto.career=='5년' ? 'selected="selected"' : '' }>5년
                                            </option>
                                            <option value="6년" ${rDto.career=='6년' ? 'selected="selected"' : '' }>6년
                                            </option>
                                            <option value="7년" ${rDto.career=='7년' ? 'selected="selected"' : '' }>7년
                                            </option>
                                            <option value="8년차 이상" ${rDto.career=='8년차 이상' ? 'selected="selected"' : ''
                                                }>8년차 이상</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">보유 기술</div>
                                <div class="card-body">
                                    <div class="row my-3 my-border">
                                        <div id="my-table-body2">
                                            <table class="my-table table table-bordered"
                                                style="background-color: white;">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="Java"
                                                                        ${rDto.skillList=='Java' ? 'checked' : '' }>Java
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="JavaScript"
                                                                        ${rDto.skillList=='JavaScript' ? 'checked' : ''
                                                                        }>
                                                                    JavaScript
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="Spring"
                                                                        ${rDto.skillList=='Spring' ? 'checked' : '' }>
                                                                    Spring
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="HTML"
                                                                        ${rDto.skillList=='HTML' ? 'checked' : '' }>
                                                                    HTML
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="jQuery"
                                                                        ${rDto.skillList=='jQuery' ? 'checked' : '' }>
                                                                    jQuery
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="JSP" ${rDto.skillList=='JSP'
                                                                        ? 'checked' : '' }> JSP
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="Vue.js"
                                                                        ${rDto.skillList=='Vue' ? 'checked' : '' }>
                                                                    Vue.js
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="Oracle"
                                                                        ${rDto.skillList=='Oracle' ? 'checked' : '' }>
                                                                    Oracle
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="MySQL"
                                                                        ${rDto.skillList=='MySQL' ? 'checked' : '' }>
                                                                    MySQL
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-check text-center">
                                                                <label class="form-check-label">
                                                                    <input class="form-check-input" type="checkbox"
                                                                        name="skill" value="React"
                                                                        ${rDto.skillList=='React' ? 'checked' : '' }>
                                                                    React
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">자기소개서</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <!-- <label for="exampleTextarea" class="form-label mt-4">자기소개서</label>
                        <hr> -->
                                        <textarea class="form-control" name="content" id="content"
                                            rows="3">${rDto.content}</textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">링크</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="link" id="link" class="form-control"
                                            value="${rDto.link}">
                                    </div>
                                </div>
                            </div>


                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">제목</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="form-group">
                                            <input type="text" name="title" id="title" class="form-control"
                                                value="${rDto.title}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">이력서 공개 여부</div>
                                <div class="card-body">
                                    <fieldset class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="state" id="state" value=1
                                                ${rDto.state=='1' ? 'checked' : '' } checked="">
                                            <label class="form-check-label" for="optionsRadios1">
                                                공개
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="state" id="state"
                                                value="0" ${rDto.state=='0' ? 'checked' : '' }>
                                            <label class="form-check-label" for="optionsRadios2">
                                                비공개
                                            </label>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>

                        <div class="col-2">
                            <div id="rButton">
                                <br>
                                <div class="row p-1">
                                    <button type="button" class="btn btn-success w-100">미리보기</button>
                                </div>
                                <div class="row p-1">
                                    <button type="button"
                                        onclick="UpdateTempResume(`${rDto.resumeId}`,`${principal.userId}`)"
                                        class="btn btn-success w-100">임시 저장</button>
                                </div>
                                <div class="row p-1">
                                    <button onclick="updateResume(`${rDto.resumeId}`,`${principal.userId}`)"
                                        type="button" class="btn btn-success w-100">이력서
                                        수정</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            let resumeId;
            let userId;
            function updateResume(id, uId) {
                let data = {
                    title: $("#title").val(),
                    content: $("#content").val(),
                    education: $("#education").val(),
                    career: $("#career").val(),
                    skillList: skillValues,
                    link: $("#link").val(),
                    state: $("#state").val(),
                    userId: id,
                    resumeId: resume
                }
                $.ajax({
                    type: "put",
                    url: "/user/resume/update",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json" // default : 응답의 mime 타입으로 유추함
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/user/resume";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }

            function UpdateTempResume(id, uId) {
                let data = {
                    title: $("#title").val(),
                    content: $("#content").val(),
                    education: $("#education").val(),
                    career: $("#career").val(),
                    skillList: skillValues,
                    link: $("#link").val(),
                    state: $("#state").val(),
                    userId: id,
                    resumeId: resume
                }
                $.ajax({
                    type: "put",
                    url: "/user/resume/update",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json" // default : 응답의 mime 타입으로 유추함
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                }).fail((err) => { // 40X, 50X 일때
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
            };

            let skillValues;

            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('click', function () {
                    skillValues = getCheckedValues("skill");
                })
            });

        </script>

        <%@ include file="../layout/footer.jsp" %>