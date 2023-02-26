<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<style>
        .my-cursor {
        cursor: pointer;
    }

    .my-cursor:hover {
        color: rgb(226, 226, 40);
    }

    .on-Clicked {
        color: rgb(226, 226, 40);
    }
</style>
<div class="mx-auto width-53 mx-5 px-3 my-3">
    <div class="d-flex flex-wrap my-3 info-card">
        <c:forEach items="${rDtos}" var="jDto" begin="1" end="3">
            <div class="col-4 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}">
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
                                ${jDto.skillName1} ${jDto.skillName2} ${jDto.skillName3}
                            </div>
                            <div>
                                ${jDto.career} ${jDto.education} ${jDto.address}
                            </div>
                        </a>
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                   <c:when test="${principal != null}">
                                    <div>
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

                                </div>

                            </div>
                        </div>
                    </div>
                
            </div>
        </c:forEach>
    </div>

    <!-- 가운데 -->
    <div class="row ">
        <div class="col-4  ">
            <button type="button" class="btn btn-success w-100">지역별</button>
        </div>
        <div class="col-4 ">
            <button type="button" class="btn btn-success w-100">기술별</button>
        </div>
        <div class="col-4  ">
            <button type="button" class="btn btn-success w-100">직무별</button>
        </div>
    </div>

    <!-- 공고들 -->
    <div class="d-flex flex-wrap my-3 info-card">
        <c:forEach items="${jDtos}" var="jDto">
            <div class="col-3 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}">
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
                                ${jDto.skillName1} ${jDto.skillName2} ${jDto.skillName3}
                            </div>
                            <div>
                                ${jDto.career} ${jDto.education} ${jDto.address}
                            </div>
                        </a>
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                   <c:when test="${principal != null}">
                                    <div>
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

        if (userScrap > 0) {
            let data = {
                userScrapId: userScrap,
                userId: user,
                jobsId: jobs
            }
            $.ajax({
                type: "delete",
                url: "/user/scrap/delete",
                data: JSON.stringify(data),
                headers:{
                    "content-type":"application/json; charset=utf-8"
                },
                dataType:"json"
            }).done((res) => {
                changeScrap(userScrapId);
            }).fail((err) => {
            
            });

        } else {
            let data = {
                userId: user,
                jobsId: jobs
            }
            $.ajax({
                type: "put",
                url: "/user/scrap/insert",
                data: JSON.stringify(data),
                headers: {
                    "content-type": "application/json; charset=utf-8"
                },
                dataType: "json"
            }).done((res) => {
                res.data
                changeScrap();
            }).fail((err) => {

            });
        }
    }

    function changeScrap(id) {
        if(id > 0){
            $('#scrap-' + jobsId).toggleClass("fa-solid");
            $('#scrap-' + jobsId).toggleClass("on-Clicked");
        }

    }
</script>
<%@ include file="../layout/footer.jsp" %>  