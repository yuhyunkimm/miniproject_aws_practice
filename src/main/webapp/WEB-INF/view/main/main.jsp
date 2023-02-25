<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

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
                            <div class="d-flex justify-content-between">
                                <div><i id=`scrap-${jDto.jobsId}` class="fa-regular fa-star"
                                        onclick="scrap(`${jDto.jobsId}`)"></i>
                                    <input type="hidden" id="endDate-${jDto.jobsId}" value="${jDto.endDate}">
                                </div>
                                <div>

                                </div>

                            </div>
                        </div>
                    </div>
                </a>
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
                            <div class="d-flex justify-content-between">
                                <div><i id=`scrap-${jDto.jobsId}` class="fa-regular fa-star"
                                        onclick="scrap(`${jDto.jobsId}`)"></i>
                                    <input type="hidden" id="endDate-${jDto.jobsId}" value="${jDto.endDate}">
                                </div>
                                <div>

                                </div>

                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>  