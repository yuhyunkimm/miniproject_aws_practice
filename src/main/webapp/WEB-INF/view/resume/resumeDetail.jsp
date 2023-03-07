<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        .selected3 {
            background-color: #c5f1c5;
            color: #000;
        }

        #photo {
            width: 80%;
            height: auto;
        }
    </style>
</head>

<body>

    <div class="mx-auto width-53 top-80">
        <div class="container mb-5">
            <form>
                <div class="row mx-auto">
                    <div class="col-9">
                        <div style="max-width: 45em;">
                            <br>
                            <h5>이력서 상세보기<br></h5>
                            <hr />
                            <div class="card border-light mb-3">
                                <div class="card-header">기본 정보</div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="my-border col-3">
                                            <img class="" src="${rDto.photo}" alt="" srcset="" style="" id="photo">
                                        </div>

                                        <div class="col-2 pt-3">
                                            <div class="mb-2">
                                                이름
                                            </div>
                                            <div class="mb-2">
                                                주소
                                            </div>
                                            <div class="mb-2">
                                                생년월일
                                            </div>
                                        </div>
                                        <div class="col-7 pt-3">
                                            <div class="mb-2" id="compName">
                                                ${rDto.name}
                                                <input type="hidden" id="compName1" value="${rDto.name}">
                                            </div>
                                            <div class="mb-2" id="representativeName">
                                                ${rDto.address}
                                                <input type="hidden" id="representativeName1" value="${rDto.address}">
                                            </div>
                                            <div class="mb-2" id="homepage">
                                                ${rDto.birth}
                                                <input type="hidden" id="homepage1" value="${rDto.birth}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3">
                                <div class="card-header">학력 사항</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="education" id="education" class="form-control"
                                            value="${rDto.education}" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3">
                                <div class="card-header">경력 사항</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="career" id="career" class="form-control"
                                            value="${rDto.career}" readonly>
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
                                                <div style="float: left; d-flex">
                                                    <c:forEach items="${rDto.skillList}" var="skill">
                                                        <span class="badge  skill-color">${skill}</span>
                                                    </c:forEach>
                                                </div>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3">
                                <div class="card-header">자기소개서</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <textarea class="form-control" name="content" id="content" rows="3" readonly>
                                    ${rDto.content}
                                        </textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3">
                                <div class="card-header">링크</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="link" id="link" class="form-control"
                                            value="${rDto.link}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div id="rButton" style="width: 12em;">
                            <br>
                            <div class="row p-1">
                                <div>
                                    <c:choose>
                                        <c:when test="${compSession != null}">
                                            <div id="scrap-${rDto.resumeId}-render">
                                                <div id="scrap-${rDto.resumeId}-remove">
                                                    <c:choose>
                                                        <c:when test="${rDto.compScrapId > 0}">
                                                            <button id="scrap-${rDto.resumeId}" type="button"
                                                                class="btn selected3 w-100"
                                                                onclick="scrap(`${rDto.resumeId}`,`${compSession.compId}`,`${rDto.compScrapId}`)">스크랩
                                                                완료</button>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <button id="scrap-${rDto.resumeId}" type="button"
                                                                class="btn btn-secondary w-100"
                                                                onclick="scrap(`${rDto.resumeId}`,`${compSession.compId}`,`${rDto.compScrapId}`)">스크랩</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                </div>
                            </div>
                            <div class="row p-1" id="suggest-render">
                                <div id="suggest-btn">
                                <c:choose>
                                   <c:when test="${rDto.applyState == null}">
                                        <c:choose>
                                       <c:when test="${rDto.suggestState == 0}">
                                       <button type="button" class="btn btn-secondary w-100">제안완료</button>
                                       </c:when>
                                       <c:when test="${rDto.suggestState == 1}">
                                       <button type="button" class="btn btn-secondary w-100">제안성공</button>
                                       </c:when>
                                       <c:when test="${rDto.suggestState == -1}">
                                       <button type="button" class="btn btn-secondary w-100">제안거절</button>
                                       </c:when>
                                       <c:when test="${rDto.suggestState == null }">
                                       <button type="button" class="btn btn-success w-100" data-bs-toggle="modal"
                                        data-bs-target="#myModal" onclick="requestJobs()">제안하기</button>
                                       </c:when>
                                    </c:choose>
                                   </c:when>
                                
                                   <c:otherwise>
                                    <div class="mb-2">
                                        <button type="button" class="btn btn-success w-100" onclick="accept(`${compSession.compId}`,`${rDto.applyId}`)">합격</button>
                                    </div>
                                    <div>
                                        <button type="button" class="btn btn-danger w-100" onclick="deny(`${compSession.compId}`,`${rDto.applyId}`)">불합격</button>
                                    </div>
                                   </c:otherwise>
                                </c:choose>
                                    
                                </div>
                            </div>
                            </c:when>

                            <c:otherwise>
                        </div>
                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
        </div>
    </div>
    </form>
    </div>
    </div>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <!-- modal-sm modal-lg modal-xl 모달 사이즈 -->
            <!-- modal-dialog-centered 화면 가운데 -->
            <!-- modal-dialog-scrollable 스크롤 기능 -->
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">제안할 공고 선택</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="render-jobs">

                    </div>
                    <button type="button" class="btn btn-success mt-2" style="float: right;"
                        onclick="suggest(`${rDto.resumeId}`,`${compSession.compId}`)" data-bs-dismiss="modal">제안
                        하기</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        let rDtos;
        let jobsId1;
        let compId;
        let resumeId;
        let compScrapId;
        function requestJobs() {
            $.ajax({
                type: "get",
                url: "/comp/request/jobs",
                dataType: "json"
            }).done((res) => {
                renderRes(res.data);
            }).fail((err) => {
                alert(err.responseJSON.msg);
            });
        }
        function renderRes(rDtoss) {
            $('#suggest-btn').remove();
            renderBtn();
            rDtoss.forEach((rj) => {
                renderJobsOne(rj);
            });
            let jobs = document.querySelectorAll('.jobsList');
            jobs.forEach(function (job) {
                job.addEventListener('click', function (evt) {
                    // 모든 탭 버튼에서 active 클래스를 제거
                    jobs = document.getElementsByClassName("jobsList");
                    for (i = 0; i < jobs.length; i++) {
                        jobs[i].classList.remove("selected2");
                    }
                    evt.currentTarget.classList.add("selected2");
                })
            });
        }
        function renderBtn() {
            let el = `
        <div id="suggest-btn">
                            <button type="button" class="btn btn-success w-100" data-bs-toggle="modal"
                        data-bs-target="#myModal">제안하기</button>
                        </div>
        `;
            $('#suggest-render').append(el);
        }
        function renderBtnSuccess() {
            let el = `
        <div id="suggest-btn">
                        <button type="button" class="btn btn-secondary w-100">제안완료</button>
                    </div>
        `;
            $('#suggest-render').append(el);
        }
        function renderJobsOne(jDto) {
            let el = `
                    <div class="card mb-4 jobsList" onclick="selectJobs(`+ jDto.jobsId + `)">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: left;">`+ jDto.title + `</h5>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">`+ jDto.position + `</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">`+ + `</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">`+ + `</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">`+ + `</h6>
                                </div>
                                <div class="m-2" style="float: left;">
                                    <h6 class="card-subtitle mb-2 text-muted">`+ jDto.endDate + `</h6>
                                </div>
                            </div>      
                        </div>
    `;
            $('#render-jobs').append(el);
        }

        function selectJobs(id) {
            jobsId1 = id;
        }
        function suggest(resume, comp) {
            let data = {
                jobsId: jobsId1,
                resumeId: resume,
                compId: comp
            }
            $.ajax({
                type: "post",
                url: "/comp/suggest/jobs",
                data: JSON.stringify(data),
                headers: {
                    "content-type": "application/json; charset=utf-8"
                },
                dataType: "json"
            }).done((res) => {
                alert(res.msg);
                $('#suggest-btn').remove();
                // location.href = "/comp/apply";
                renderBtnSuccess();
            }).fail((err) => {
                alert(err.responseJSON.msg);
            });
        }




        function scrap(resume, comp, compScrap) {
            resumeId = resume;
            compId = comp;
            // 스크랩 id 있을때
            if (compScrap > 0) {
                compScrapId = compScrap;

                $.ajax({
                    type: "delete",
                    url: "/comp/scrap/" + compScrapId + "/delete",
                    dataType: "json"
                }).done((res) => {
                    compScrapId = res.data;
                    changeScrap();
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });

            } else {
                let data = {
                    compId: comp,
                    resumeId: resume
                }
                $.ajax({
                    type: "post",
                    url: "/comp/scrap/insert",
                    data: JSON.stringify(data),
                    headers: {
                        "content-type": "application/json; charset=utf-8"
                    },
                    dataType: "json"
                }).done((res) => {
                    compScrapId = res.data;
                    changeScrap();
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        }

        function changeScrap() {
            $('#scrap-' + resumeId + '-remove').remove();
            renderScrap();
        }

        function renderScrap() {
            let el;

            if (compScrapId > 0) {
                el = `
        <div id="scrap-${rDto.resumeId}-remove">
            <button id="scrap-`+ resumeId + `" type="button" class="btn selected3 w-100" 
            onclick="scrap(`+ resumeId + `,` + compId + `,` + compScrapId + `)">스크랩 완료</button>
        </div>
        `;
            } if (compScrapId === 0) {
                el = `
        <div id="scrap-${rDto.resumeId}-remove">
            <button id="scrap-`+ resumeId + `" type="button" class="btn btn-secondary w-100" 
             onclick="scrap(`+ resumeId + `,` + compId + `,` + compScrapId + `)">스크랩</button>
        </div>
        `;
            }
            $('#scrap-' + resumeId + '-render').append(el);
        }

        function accept(id,aId){
                let data = {
                    compId: id,
                    applyId: aId,
                    state: 1
                }
                $.ajax({
                    type: "put",
                    url: "/comp/apply/update",
                    data: JSON.stringify(data),
                    headers:{
                        "content-type":"application/json; charset=utf-8"
                    },
                    dataType:"json"
                }).done((res) => {
                    window.close();
                    window.opener.location.reload();
                    // renderbtn(res.data, aId);
                }).fail((err) => {
                
                });
            }

       
            function deny(id,aId){
                let data = {
                    compId: id,
                    applyId: aId,
                    state: -1
                }
                $.ajax({
                    type: "put",
                    url: "/comp/apply/update",
                    data: JSON.stringify(data),
                    headers:{
                        "content-type":"application/json; charset=utf-8"
                    },
                    dataType:"json"
                }).done((res) => {
                    window.close();
                    window.opener.location.reload();
                    // renderbtn(res.data, aId);
                }).fail((err) => {
                
                });
            }

            // function renderbtn(num, applyId){
            //     if(num === 1){
            //         $('#state-btn-'+applyId).remove();
            //         $('#response-dropdown-'+applyId).remove();
            //         let el1 = `
            //         <div id="state-btn" class="badge bg-success p-2">합격</div>
            //         `;
            //         let el2 = `
            //         <div class="badge bg-secondary p-2">답변완료</div>
            //         `;
            //         $('#state-'+applyId).append(el1);
            //         $('#response-'+applyId).append(el2);
            //     }
            //     if(num === -1){
            //         $('#state-btn-'+applyId).remove();
            //         $('#response-dropdown-'+applyId).remove();
            //         let el1 = `
            //         <div id="state-btn" class="badge bg-danger p-2">불합격</div>
            //         `;
            //         let el2 = `
            //         <div class="badge bg-secondary p-2">답변완료</div>
            //         `;
            //         $('#state-'+applyId).append(el1);
            //         $('#response-'+applyId).append(el2);
            //     }
            // }
    </script>

</body>

</html>