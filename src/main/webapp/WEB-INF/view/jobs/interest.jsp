<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="mx-auto width-53 top-80">
    <div class="d-flex">
        <c:forEach items="${sDto.skillList}" var="skill">
            <span class="badge bg-secondary me-2">${skill}</span>
        </c:forEach>
        에 매칭되는 공고 리스트 입니다.
    </div>
    <div class="d-flex flex-wrap my-3 info-card">
        <c:forEach items="${jDtos}" var="jDto">
            <div class="col-4 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}"
                    onclick="window.open(this.href, '_blank', 'width=1920,height=1080,toolbars=no,scrollbars=no, resizable=no'); return false;">
                    <div class="card">
                        <div class="pt-4 px-auto" style="text-align: center;">
                            <img src='${jDto.photo}' alt="" srcset="" style="height: 4em; width: 130px;">
                        </div>
                        <div class="card-body">
                            <div>
                                444${jDto.compName}
                            </div>
                            <div class="fs-5">
                                ${jDto.title}
                            </div>
                            <div>
                                <c:forEach items="${jDto.skillList}" var="skill">
                                    <span class="badge bg-secondary me-2">${skill}</span>
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
        $('.scrap-' + jobsId + '-remove').remove();
        renderScrap();
    }
    function renderScrap() {
        let el;
        if (userScrapId > 0) {
            el = `
            <div class="scrap-`+ jobsId + `-remove">
                <i id="scrap-`+ jobsId + `" class="fa-solid on-Clicked fa-star my-cursor"
                                        onclick="scrap(`+ jobsId + `,` + userId + `,` + userScrapId + `)"></i>
                                    </div>
            `;
        } if (userScrapId === 0) {
            el = `
            <div class="scrap-`+ jobsId + `-remove">
                <i id="scrap-`+ jobsId + `" class="fa-regular fa-star my-cursor"
                                        onclick="scrap(`+ jobsId + `,` + userId + `,` + userScrapId + `)"></i>
                                    </div>
            `;
        }
        $('.scrap-' + jobsId + '-render').append(el);
    }
</script>
<%@ include file="../layout/footer.jsp" %>  