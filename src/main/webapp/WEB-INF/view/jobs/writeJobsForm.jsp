<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Blog</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .my-border {
            background-color: #f8f8f8;
            padding: 20px;
        }

        .border {
            border: 1px solid rgb(0, 0, 0);
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-sm bg-light navbar-light  ">
        <div class="container-fluid width-53">
            <div class="">
                <a class="navbar-brand" href="/"><i class="fa-brands fa-github-square" style="font-size: 2em;"></i></a>
            </div>
            <div class="d-flex">
                <div class="me-4">
                </div>
                <div class="my-auto me-5">
                    <a href="/user/myhome">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </div>
                <div class="my-auto pb-1">
                    <a href="/comp/comphome"><span class="badge bg-success">기업홈</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!-- 헤더 추가 요망 -->
    <div class="mx-auto width-53 top-80">
        <div class="relative">
            <div class="width-l">
                <div class="mb-5">
                    <!-- 회사 정보  -->
                    <div class="d-flex justify-content-between">
                        <div>
                            <h4>회사정보</h4>
                        </div>
                        <div>
                            <button type="button" class="btn btn-success mb-2" data-bs-toggle="modal"
                                data-bs-target="#myModal">회사 정보 수정</button>
                        </div>
                    </div>
                    <div class="row justify-content-between my-border ">
                        <div class="my-border col-3">
                            <img class="" src="${cDto.photo}" alt="" srcset="" style="" id="photo">
                        </div>

                        <div class="col-2 mt-3 pt-3">
                            <div class="mb-2">
                                회사명
                            </div>
                            <div class="mb-2">
                                대표자명
                            </div>
                            <div class="mb-2">
                                홈페이지
                            </div>
                        </div>
                        <div class="col-7 mt-3 pt-3">
                            <div class="mb-2" id="compName">
                                ${cDto.compName}
                                <input type="hidden" id="compName1" value="${cDto.compName}">
                            </div>
                            <div class="mb-2" id="representativeName">
                                ${cDto.representativeName}
                                <input type="hidden" id="representativeName1" value="${cDto.representativeName}">
                            </div>
                            <div class="mb-2" id="homepage">
                                ${cDto.homepage}
                                <input type="hidden" id="homepage1" value="${cDto.homepage}">
                            </div>
                        </div>
                    </div>

                    <!-- 공고등록 -->
                    <div class="row my-3 my-border">
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>공고 제목</h5>
                            </div>
                            <div class="col-10">
                                <input type="text" name="title" class="form-control" value="" id="title">
                            </div>
                        </div>
                    </div>

                    <div class="row my-3 my-border">
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>학력</h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" aria-label="Default select example" id="education"
                                    name="education">
                                    <option value="학력무관">학력무관</option>
                                    <option value="대졸">대졸</option>
                                    <option value="대학원 이상">대학원 이상</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>경력</h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" aria-label="Default select example" id="career"
                                    name="career">
                                    <option value="신입">신입</option>
                                    <option value="1년차 미만">1년차 미만</option>
                                    <option value="1년차">1년차</option>
                                    <option value="2년차">2년차</option>
                                    <option value="3년차">3년차</option>
                                    <option value="4년차">4년차</option>
                                    <option value="5년차">5년차</option>
                                    <option value="6년차">6년차</option>
                                    <option value="7년차">7년차</option>
                                    <option value="8년차 이상">8년차 이상</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>희망 직무</h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" aria-label="Default select example" id="position"
                                    name="position">
                                    <option value="서버 개발자">서버 개발자</option>
                                    <option value="백엔드 개발자">백엔드 개발자</option>
                                    <option value="프론트엔드 개발자">프론트엔드 개발자</option>
                                    <option value="안드로이드 개발자">안드로이드 개발자</option>
                                    <option value="IOS 개발자">IOS 개발자</option>
                                    <option value="풀스택 개발자">풀스택 개발자</option>
                                    <option value="빅데이터 엔지니어">빅데이터 엔지니어</option>
                                    <option value="임베디드 개발자">임베디드 개발자</option>
                                    <option value="devops 개발자">devops 개발자</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>근무지역</h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" aria-label="Default select example" id="address"
                                    name="address">
                                    <option value="서울">서울</option>
                                    <option value="경기도">경기도</option>
                                    <option value="인천">인천</option>
                                    <option value="부산">부산</option>
                                    <option value="대구">대구</option>
                                    <option value="대전">대전</option>
                                    <option value="광주">광주</option>
                                    <option value="제주">제주</option>
                                    <option value="지역">지역</option>
                                    <option value="지역 2">지역 2</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>마감일</h5>
                            </div>
                            <div class="col-4">
                                <input type="date" class="form-control" id="endDate" name="endDate">
                            </div>
                        </div>
                        <div class="d-flex my-2">
                            <div class="col-2 my-auto">
                                <h5>접수방법</h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" aria-label="Default select example" id="receipt"
                                    name="receipt">
                                    <option value="홈페이지 접수">홈페이지 접수</option>
                                    <option value="공고 접수">공고 접수</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- 공고 조건 / 공고 내용 -->
                    <div class="row my-3 my-border">

                        <h5>필요 기술 ( 최대 3개 )</h5>
                        <div id="my-table-body2">
                            <table class="my-table table table-bordered" style="background-color: white;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="Java">Java
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="JavaScript">
                                                    JavaScript
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="Spring"> Spring
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="HTML"> HTML
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="jQuery"> jQuery
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="JSP"> JSP
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="Vue.js"> Vue.js
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="Oracle"> Oracle
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="MySQL"> MySQL
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check text-center">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="skill"
                                                        value="React"> React
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row my-3 my-border">
                        <div>
                            <h5>공고 상세 내용</h5>
                            <div class="form-group" style="background-color: white;">
                                <textarea class="form-control summernote" id="content" rows="5" id="content"
                                    name="content"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="width-r" id="jobs-render">
                <div class="view-fix d-grid view-right2 p-4" id="jobs-remove">
                    <!-- 뷰포트 -->
                    <div class="align-self-end">
                        <button type="button" class="btn btn-success w-100" onclick="">미리보기</button>
                    </div>
                    <div class="align-self-end">
                        <button type="button" class="btn btn-success w-100"
                            onclick="saveTemp(`${compSession.compId}`,`${jDto.jobsId}`)">임시저장</button>
                    </div>
                    <div class="align-self-end">
                        <button type="button" class="btn btn-success w-100"
                            onclick="saveJobs(`${compSession.compId}`,`${jDto.jobsId}`)">공고등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <!-- modal-sm modal-lg modal-xl 모달 사이즈 -->
            <!-- modal-dialog-centered 화면 가운데 -->
            <!-- modal-dialog-scrollable 스크롤 기능 -->
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">회사 정보 수정</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <input id="update-compName" placeholder="회사명" class="form-control" value="${cDto.compName}">
                        <br>
                        <input id="update-representativeName" placeholder="대표자명" class="form-control"
                            value="${cDto.representativeName}"> <br>
                        <input id="update-homepage" placeholder="홈페이지" class="form-control"
                            value="${cDto.homepage}"><br>
                        <button type="button" class="btn btn-success mt-2" style="float: right;" onclick="updateComp()"
                            data-bs-dismiss="modal">수정 완료</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.summernote').summernote({
            tabsize: 2,
            height: 400
        });

        function updateComp() {
            $('#compName').text($('#update-compName').val());
            $('#representativeName').text($('#update-representativeName').val());
            $('#homepage').text($('#update-homepage').val());
        }

        $('input:checkbox[name=skill]').click(function () {
            let count = $('input:checkbox[name=skill]:checked').length;
            if (count > 3) {
                alert('기술은 3개까지 선택 가능')
                $(this).prop('checked', false);
            }
        });

        // function test(){

        // }

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

        let jobsId;
        let compId;
        function saveTemp(id, jobs) {
            resumeId = jobs;
            compId = id;

            let data = {
                photo: $("#photo").attr('src'),
                compName: $('#update-compName').val(),
                representativeName: $('#update-representativeName').val(),
                homepage: $('#update-homepage').val(),
                title: $("#title").val(),
                content: $("#content").val(),
                education: $("#education").val(),
                career: $("#career").val(),
                position: $("#position").val(),
                address: $("#address").val(),
                endDate: $("#endDate").val(),
                receipt: $("#receipt").val(),
                skill: skillValues,
                compId: id,
                jobsId: jobs
            };

            if (resumeId > 0) {
                $.ajax({
                    type: "put",
                    url: "/jobs/update",
                    data: JSON.stringify(data),
                    headers: {
                        "content-type": "application/json; charset=utf-8"
                    },
                    dataType: "json"
                }).done((res) => {
                    jobsId = res.data;
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            } else {
                $.ajax({
                    type: "post",
                    url: "/jobs/write",
                    data: JSON.stringify(data),
                    headers: {
                        "content-type": "application/json; charset=utf-8"
                    },
                    dataType: "json"
                }).done((res) => {
                    jobsId = res.data;
                    changeBtn();
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        }

        function changeBtn() {
            $('#jobs-remove').remove();
            renderBtn();
        }

        function renderBtn() {
            let el = `
                <div class="view-fix d-grid view-right2 p-4" id="jobs-remove">
                        <div class="align-self-end">
                            <button type="button" class="btn btn-success w-100" onclick="test()" >미리보기</button>
                        </div>
                        <div class="align-self-end">
                            <button type="button" class="btn btn-success w-100" onclick="saveTemp(`+ compId + `,` + jobsId + `)">임시저장</button>
                        </div>
                        <div class="align-self-end">
                            <button type="button" class="btn btn-success w-100" onclick="saveJobs(`+ compId + `,` + jobsId + `)">공고등록</button>
                        </div>
                    </div>
        `;
            $('#jobs-render').append(el);
        }

        function saveJobs(id, jobs) {
            jobsId = jobs;
            compId = id;

            let data = {
                photo: $("#photo").attr('src'),
                compName: $('#update-compName').val(),
                representativeName: $('#update-representativeName').val(),
                homepage: $('#update-homepage').val(),
                title: $("#title").val(),
                content: $("#content").val(),
                education: $("#education").val(),
                career: $("#career").val(),
                position: $("#position").val(),
                address: $("#address").val(),
                endDate: $("#endDate").val(),
                receipt: $("#receipt").val(),
                skill: skillValues,
                compId: id,
                jobsId: jobs
            };

            if (jobsId > 0) {
                $.ajax({
                    type: "put",
                    url: "/jobs/update",
                    data: JSON.stringify(data),
                    headers: {
                        "content-type": "application/json; charset=utf-8"
                    },
                    dataType: "json"
                }).done((res) => {
                    jobsId = res.data;
                    alert('등록 완료 !');
                    location.href = "/comp/comphome";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            } else {
                $.ajax({
                    type: "post",
                    url: "/jobs/write",
                    data: JSON.stringify(data),
                    headers: {
                        "content-type": "application/json; charset=utf-8"
                    },
                    dataType: "json"
                }).done((res) => {
                    jobsId = res.data;
                    alert('등록 완료 !');
                    location.href = "/comp/comphome";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        }

    </script>
</body>

</html>