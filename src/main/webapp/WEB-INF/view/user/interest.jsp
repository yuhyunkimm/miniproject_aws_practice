<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="mx-auto width-53">
    <div class="d-flex">
        <c:forEach items="${uDto} " var="Dto">
            <div class="me-3"> ${Dto} </div>
        </c:forEach>
        에 매칭되는 공고 리스트 입니다.
    </div>
    <div class="d-flex flex-wrap my-3 info-card">
        <c:forEach items="${fourMatchDto}" var="jDto">
            <div class="col-4 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}">
                    <div class="card">
                        <div>
                            <img src='${jDto.photo}' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                444${jDto.compName}
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
        <c:forEach items="${threeMatchDto}" var="jDto">
            <div class="col-4 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}">
                    <div class="card">
                        <div>
                            <img src='${jDto.photo}' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                333${jDto.compName}
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
        <c:forEach items="${twoMatchDto}" var="jDto">
            <div class="col-4 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}">
                    <div class="card">
                        <div>
                            <img src='${jDto.photo}' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                222${jDto.compName}
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
        <c:forEach items="${oneMatchDto}" var="jDto">
            <div class="col-4 px-2 py-2 remove-card">
                <a href="/jobs/${jDto.jobsId}">
                    <div class="card">
                        <div>
                            <img src='${jDto.photo}' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                111${jDto.compName}
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