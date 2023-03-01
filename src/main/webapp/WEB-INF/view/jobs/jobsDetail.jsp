<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .view-up {
            width: 50em;
        }

        .my-border {
            border: 1px solid rgb(0, 0, 0);
            padding: 40px;
            padding-top: 0;
            margin-top: 0;
        }

        .border {
            border: 1px solid rgb(0, 0, 0);
        }

        header {
            position: sticky;
            top: 1em;
            padding: 5px;
            border-bottom: 1px solid #000;
            background-color: white;
            /* border: 1px solid rgb(0, 0, 0); */
            z-index: 10;
        }

        html {
            width: 100%;
            height: 100%;
        }

        body {
            margin: 0;
            padding: 0;
        }

        .header {
            position: fixed;
            top: 0;
            z-index: 1;
            width: 100%;
            background-color: #F1F1F1;
        }

        .progress-container {
            width: 100%;
            height: 8px;
            background: #CCCCCC;
        }

        .progress-container .progress-bar {
            width: 0;
            height: 8px;
            background: #4CAF50;
        }

        .content_obj {
            width: 100%;
            height: 5000px;
            background-color: #eeeeee;
        }

        .selected {
            background-color: #c5f1c5;
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="progress-container">
            <div class="progress-bar progress-bar-striped progress-bar-animated"></div>
        </div>
    </div>
    <div class="mx-auto width-53">
        <div class="relative">
            <div class="width-l my-border relative my-5">
                <header>
                    <div class="view-up d-flex py-0 my-0">
                        <div class="  my-auto me-3">
                            <img src="${jDto.photo}" alt="" srcset="" style="height: 5em;">
                        </div>
                        <div class=" fs-5  my-auto me-5">
                            ${jDto.compName}
                        </div>
                        <div class=" fs-4  my-auto">
                            ${jDto.title}
                        </div>
                    </div>
                </header>
                <div class="">
                    <!-- 상세 공고 위치 -->
                    <div class="my-4">
                        <div class="row mb-3">
                            <!-- 회사정보 -->
                            <div class="col-3">
                                <div class="">
                                    <span class="me-5">
                                        경력
                                    </span>
                                    <span class="me-5">
                                        학력
                                    </span>
                                    <span class="me-5">
                                        개발직무
                                    </span>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="">
                                    <span>
                                        ${jDto.career}
                                    </span>
                                    <span>
                                        ${jDto.education}
                                    </span>
                                    <span>
                                        ${jDto.position}
                                    </span>
                                </div>
                            </div>
                            <div class="col-2">
                                <div>필요기술</div>
                                <div>근무지역</div>
                            </div>
                            <div class="col-4">
                                <div>
                                    ${jDto.skillName1} ${jDto.skillName2} ${jDto.skillName3}
                                </div>
                                <div>
                                    ${jDto.address}
                                </div>
                            </div>
                        </div>
                        <div class="relative">
                            ${jDto.content}
                            <img class="w-100"
                                src="https://www.saraminimage.co.kr/recruit/bbs_recruit7/35_bm_img_230217.png">
                        </div>
                        <div class="fs-4 mt-5">
                            접수방법
                        </div>

                        <div class="border row">
                            <!-- 남은 날짜 -->
                            <div class="col-4">
                                <span class="fs-1">d-day 계산.. ${jDto.endDate}</span>
                            </div>
                            <div class="col-8">
                                홈페이지 지원 ${jDto.homepage}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="width-r">
                <div class="view-fix d-grid  view-right p-4">
                    <!-- 뷰포트 -->
                    <div class="d-flex justify-content-between">
                        <div>
                            <img class="" src="${jDto.photo}" style="height: 20px;">
                        </div>
                        <div class="me-2"><i id=`scrap-${jDto.jobsId}` class=" fa-regular fa-star"
                                onclick="scrap(`${jDto.jobsId}`)"></i>
                        </div>
                    </div>
                    <div class="my-1 fs-5">
                        ${jDto.title}
                    </div>
                    <div class="align-self-end" id="apply-render">
                        <div id="apply-btn">
                            <button type="button" class="btn btn-success w-100" data-bs-toggle="modal"
                                data-bs-target="#myModal" onclick="requestResume()">지원하기</button>
                        </div>
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
                    <h4 class="modal-title">이력서 선택</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="render-resume">


                    </div>
                    <button type="button" class="btn btn-success mt-2" style="float: right;" onclick="apply(`${jDto.jobsId}`,`${principal.userId}`)"
                        data-bs-dismiss="modal">지원 하기</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        let resumeId1;

        window.onscroll = function () {
            progressBar()
        };
        function progressBar() {
            var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            var scrolled = (winScroll / height) * 100;
            document.getElementsByClassName("progress-bar")[0].style.width = scrolled + "%";
        }

        let rDtos;
        function requestResume() {
            $.ajax({
                type: "get",
                url: "/user/request/resume",
                dataType: "json"
            }).done((res) => {
                renderRes(res.data);
            }).fail((err) => {
                alert(err.responseJSON.msg);
            });
        }
        function renderRes(rDtoss) {
            $('#apply-btn').remove();
            renderBtn();
            rDtoss.forEach((rd) => {
                renderResumeOne(rd);
            });
            let resumes = document.querySelectorAll('.resumeList');
            console.log(resumes);
            resumes.forEach(function (resume) {
                resume.addEventListener('click', function (evt) {
                    // 모든 탭 버튼에서 active 클래스를 제거
                    resumes = document.getElementsByClassName("resumeList");
                    for (i = 0; i < resumes.length; i++) {
                        resumes[i].classList.remove("selected");
                    }
                    evt.currentTarget.classList.add("selected");
                })
            });
        }
        function renderBtn() {
            let el = `
            <div id="apply-btn">
                            <button type="button" class="btn btn-success w-100" data-bs-toggle="modal"
                            data-bs-target="#myModal">지원하기</button>
                        </div>
            `;
            $('#apply-render').append(el);
        }
        function renderBtnSuccess() {
            let el = `
            <div id="apply-btn">
                            <button type="button" class="btn btn-secondary w-100">지원완료</button>
                        </div>
            `;
            $('#apply-render').append(el);
        }
        function renderResumeOne(rDto) {
            let el = `
                        <div class="card mb-4 resumeList" onclick="selectResume(`+ rDto.resumeId + `)">
                                <div class="card-body">
                                    <h5 class="card-title" style="text-align: left;">`+ rDto.title + `</h5>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ rDto.education + `</h6>
                                    </div>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ rDto.career + `</h6>
                                    </div>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ rDto.skillName1 + `</h6>
                                    </div>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ rDto.skillName2 + `</h6>
                                    </div>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ rDto.skillName3 + `</h6>
                                    </div>
                                </div>
                            </div>
        `;
            $('#render-resume').append(el);
        }

        function selectResume(id) {
            resumeId1 = id;
        }
        function apply(job,user) {
            let date = {
                jobsId: job,
                resumeId: resumeId1,
                userId: user
            }
            $.ajax({
                type: "post",
                url: "/apply/resume",
                data: JSON.stringify(date),
                headers: {
                    "content-type": "application/json; charset=utf-8"
                },
                dataType: "json"
            }).done((res) => {
                alert(res.msg);
                $('#apply-btn').remove();
                renderBtnSuccess();
            }).fail((err) => {
                alert(err.responseJSON.msg);
            });
        }
    </script>
</body>

</html>