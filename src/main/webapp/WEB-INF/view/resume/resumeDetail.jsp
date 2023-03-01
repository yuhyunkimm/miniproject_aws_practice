<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<style>
    .selected {
        background-color: #c5c8f1;
    }
</style>
<div class="mx-auto width-53 top-80">
    <div class="container mb-5">
        <form>
            <div class="row">
                <div class="col-8">
                    <br>
                    <h5>이력서 상세보기<br></h5>
                    <hr />
                    <div class="card border-light mb-3" style="max-width: 40rem;">
                        <div class="card-header">기본 정보</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-3">
                                    프로필 사진 ${rDto.photo}
                                </div>
                                <div class="col-9">
                                    <p>이름</p> ${rDto.name}
                                    <p>주소</p>${rDto.address}
                                    <p>생년월일</p>${rDto.birth}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card border-light mb-3" style="max-width: 40rem;">
                        <div class="card-header">학력 사항</div>
                        <div class="card-body">
                            <div class="form-group">
                                <input type="text" name="education" id="education" class="form-control" value="${rDto.education}"
                                    readonly>
                            </div>
                        </div>
                    </div>

                    <div class="card border-light mb-3" style="max-width: 40rem;">
                        <div class="card-header">경력 사항</div>
                        <div class="card-body">
                            <div class="form-group">
                                <input type="text" name="career" id="career" class="form-control" value="${rDto.career}" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="card border-light mb-3" style="max-width: 40rem;">
                        <div class="card-header">보유 기술</div>
                        <div class="card-body">
                            <div class="form-group">
                                <input type="text" name="skillName1" id="skillName1" class="form-control" value="${rDto.skillName1}"
                                    readonly>
                                <input type="text" name="skillName2" id="skillName1" class="form-control" value="${rDto.skillName2}"
                                    readonly>
                                <input type="text" name="skillName3" id="skillName3" class="form-control" value="${rDto.skillName3}"
                                    readonly>
                            </div>
                        </div>
                    </div>

                    <div class="card border-light mb-3" style="max-width: 40rem;">
                        <div class="card-header">자기소개서</div>
                        <div class="card-body">
                            <div class="form-group">
                                <textarea class="form-control" name="content" id="content" rows="3" readonly>
                                    ${rDto.content}
                                        </textarea>
                            </div>
                        </div>
                    </div>

                    <div class="card border-light mb-3" style="max-width: 40rem;">
                        <div class="card-header">링크</div>
                        <div class="card-body">
                            <div class="form-group">
                                <input type="text" name="link" id="link" class="form-control" value="${rDto.link}">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-4">
                    <div id="rButton" style="width: 10em;">
                        <br>
                        <div class="row p-1">
                            <button type="button" class="btn btn-secondary  w-100">스크랩</button>
                        </div>
                        <div class="row p-1" id="suggest-render">
                            <div id="suggest-btn">
                                <button type="button" class="btn btn-success w-100" data-bs-toggle="modal"
                            data-bs-target="#myModal" onclick="requestJobs()">제안하기</button>
                            </div>
                        </div>
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
                    onclick="suggest(`${rDto.resumeId}`,`${compSession.compId}`)" data-bs-dismiss="modal" >제안 하기</button>
            </div>
        </div>
    </div>
</div>
<script>
function requestJobs(){


}

let rDtos;
let jobsId1;
let compId;
let resumeId;
        function requestJobs() {
            $.ajax({
                type: "get",
                url: "/request/jobs",
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
                        jobs[i].classList.remove("selected");
                    }
                    evt.currentTarget.classList.add("selected");
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
                                        <h6 class="card-subtitle mb-2 text-muted">`+ jDto.skillName1 + `</h6>
                                    </div>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ jDto.skillName2 + `</h6>
                                    </div>
                                    <div class="m-2" style="float: left;">
                                        <h6 class="card-subtitle mb-2 text-muted">`+ jDto.skillName3 + `</h6>
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
                url: "/suggest/jobs",
                data: JSON.stringify(data),
                headers: {
                    "content-type": "application/json; charset=utf-8"
                },
                dataType: "json"
            }).done((res) => {
                alert(res.msg);
                $('#suggest-btn').remove();
                location.href="/comp/apply";
                renderBtnSuccess();
            }).fail((err) => {
                alert(err.responseJSON.msg);
            });
        }
</script>
<%@ include file="../layout/footer.jsp" %>