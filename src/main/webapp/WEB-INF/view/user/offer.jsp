<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="mx-auto width-53 top-80">
            <div class="container my-5 py-5">
                <div class="row">
                    <div class="col-3 px-5" style="text-align: center;">
                        <div class="mb-3">
                    <div class="fs-4">지원 및 제안</div>
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
                                  <a class="nav-link a p-1 mb-1" aria-current="page" href="/user/resume">이력서</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link a p-1 mb-1 active" href="/user/offer">지원 / 제안</a>
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
                    <div class="col-9 my-4 pe-5">
                <div>
                    <h6><b>지원  <div class="btn btn-dark px-2 py-0">${aDtos.size()}</div></b></h6>
                    <table class="table" style="width:100%">
                        <thead>
                            <tr class="table-secondary" align=center>
                                <th scope="col" style="width:10%">No.</th>
                                <th scope="col" style="width:23%">공고명</th>
                                <th scope="col" style="width:23%">이력서</th>
                                <th scope="col" style="width:20%">포지션</th>
                                <th scope="col" style="width:16%">상태</th>
                            </tr>
                        </thead>
                        <c:forEach items="${aDtos}" varStatus="status" var="aDto">
                            <tbody>
                                <tr align=center>
                                    <td>${status.count}</td>
                                    <td><a href="/jobs/${aDto.jobsId}" onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;"> ${aDto.jobsTitle}</a></td>
                                    <td><a href="/resume/${aDto.resumeId}" onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;"> ${aDto.resumeTitle}</a></td>
                                    <td>${aDto.position}</td>
                                    <td>${aDto.state == 0 ? '대기중' : aDto.state == 1 ? '합격' : '불합격'}</td>
                                </tr>
                            </tbody>
                        </c:forEach>

                    </table>
                            <table class="table" style="width:100%">
                                <h6><b>제안 <div class="btn btn-dark px-2 py-0">${sDtos.size()}</div> </b></h6>
                                <thead>
                                    <tr class="table-secondary " align=center>
                                        <th scope="col" style="width:10%">No.</th>
                                        <th scope="col" style="width:15%">회사명</th>
                                        <th scope="col" style="width:25%">공고명</th>
                                        <th scope="col" style="width:22%">포지션</th>
                                        <th scope="col" style="width:15%">상태 </th>
                                        <th scope="col" style="width:13%">응답</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${sDtos}" varStatus="status" var="sDto"><tbody>
                                    <tr align=center>
                                        <th scope="row">${status.count}</th>
                                        <td>${sDto.compName}</td>
                                        <td><a href="/jobs/${sDto.jobsId}" onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;"> ${sDto.title}</a></td>
                                        <td>${sDto.position}</td>
                                        <td>
                                            <button type="button" class="btn btn-secondary py-0">${sDto.state == 0 ? '대기중' : aDto.state == 1 ? '수락' : '거절'}</button>
                                        </td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn btn-primary dropdown-toggle py-0" data-bs-toggle="dropdown">
                                                  답변하기
                                                </button>
                                                <ul class="dropdown-menu">
                                                  <li><a class="dropdown-item" onclick="accept(`${principal.userId}`,`${sDto.suggestId}`)">수락</a></li>
                                                  <li><a class="dropdown-item" onclick="deny()">거절</a></li>
                                                </ul>
                                              </div>
                                        </td>
                                    </tr>
                                </tbody>
                                </c:forEach>
                            </table>
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
                                    aria-describedby="passwordHelp" onkeypress="if(event.keyCode=='13'){event.preventDefault(); checkPS(`${principal.userId}`);}">
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
        <script>
            function checkPS(uId){
                passwordCheckBtn(uId);
            }
            function accept(id,sId){
                let data = {
                    userId: id,
                    suggestId: sId,
                    state: 1
                }
                $.ajax({
                    type: "put",
                    url: "/suggest/update",
                    data: JSON.stringify(data),
                    headers:{
                        "content-type":"application/json; charset=utf-8"
                    },
                    dataType:"json"
                }).done((res) => {
                    renderbtn();
                }).fail((err) => {
                
                });
            }

            function renderbtn(){
                
            }
            function deny(){

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