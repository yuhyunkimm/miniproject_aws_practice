<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53 top-80">
            <div class="container my-5 py-5">   
                <div class="row">
                    <div class="col-3 px-5" style="text-align: center;">
                        <div class="mb-3">
                            <div class="fs-4">기업 홈</div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <!-- <h5 class="card-title">지원 및 제안</h5><br> -->
                                <div class="relative mb-3">
                                    <div>
                                        <a href="/comp/profileUpdateForm"
                                            onclick="window.open(this.href, '_blank', 'width=1200,height=900,toolbars=no,scrollbars=no, resizable=no'); return false;">
                                            <div class="user-img">
                                                <img src="${comp.photo}" class="rounded" alt="Cinque Terre"
                                                    style="max-width: 80px;">
                                            </div>
                                        </a>
                                    </div>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle text-muted">${compSession.compName}</h6>
                                        <hr>
                                        <ul class="nav flex-column nav-pills">
                                            <li class="nav-item">
                                              <a class="nav-link a p-1 mb-1" aria-current="page" href="/comp/jobs">공고등록 / 수정</a>
                                            </li>
                                            <li class="nav-item">
                                              <a class="nav-link a p-1 mb-1" href="/comp/apply">지원자 현황</a>
                                            </li>
                                            <li class="nav-item">
                                              <a class="nav-link a p-1" href="/comp/resume/scrap">이력서 스크랩</a>
                                            </li>
                                            <hr>
                                            <li class="nav-item">
                                                <a class="nav-link a p-1 mb-1"  href="/comp/update" data-bs-toggle="modal" 
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
                        <div>
                            <h6><b> 등록된 공고 </b></h6>
                            <table class="table" style="width:100%">
                                <thead>
                                    <tr class="table-secondary" align=center>
                                        <th scope="col" style="width:10%">No.</th>
                                        <th scope="col" colspan=2 style="width:30%">제목</th>
                                        <th scope="col" style="width:30%">포지션</th>
                                        <th scope="col" style="width:20%"></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${jDtos}" varStatus="status" var="jDto">
                                    <tbody>
                                    <tr align=center>
                                        <th scope="row">${status.count}</th>
                                        <td colspan=2>${jDto.title}</td>
                                        <td>${jDto.position}</td>
                                        <td><button type="button" class="btn btn-success btn-sm" 
                                        onclick="location.href='/jobs/${jDto.jobsId}'">상세보기</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>

                                
                            </table>
                            <br />
                                <h6><b>추천 인재</b></h6>
                            <table class="table" style="width:100%">
                                <thead>
                                    <tr class="table-secondary" align=center>
                                        <th scope="col" style="width:30%">No.</th>
                                        <th scope="col" colspan=2 style="width:40%">Name</th>
                                        <th scope="col"></th>
                                        <th scope="col" style="width:30%">Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr align=center>
                                        <th scope="row">1</th>
                                        <td colspan=2>최주호</td>
                                        <td></td>
                                        <td><button type="button" class="btn btn-success btn-sm">상세보기</button></td>
                                    </tr>
                                    <tr align=center>
                                        <th scope="row">2</th>
                                        <td colspan=2></td>
                                        <td></td>
                                        <td><button type="button" class="btn btn-success btn-sm">상세보기</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
                                    aria-describedby="passwordHelp" onkeypress="if(event.keyCode=='13'){event.preventDefault(); checkPS(${compSession.compId});}">
                                <div id="passwordHelp" class="form-text">현재 비밀번호를 입력해 주세요.</div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary"
                            onclick="passwordCheckBtn(${compSession.compId})">Check</button>
                    </div>
                </div>
            </div>
        </div>
       <script>
    function checkPS(cId){
        passwordCheckBtn(cId);
    }

    const passwordInputEl = document.querySelector('#inputPassword')
    const modalEl = document.querySelector('#modal')

    modalEl.addEventListener('shown.bs.modal', function () {
        passwordInputEl.focus()
    })

    function passwordCheckBtn(cId) {

        let data = {
            compId: cId,
            password: $('#inputPassword').val()
        }

        $.ajax({
            type: "post",
            url: "/comp/passwordCheck",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            datatype: "json"
        }).done((res) => {
            location.href = "/comp/update";
        }).fail((err) => {
            alert(err.responseJSON.msg);
        });
    }
</script>
<%@ include file="../layout/footer.jsp" %>