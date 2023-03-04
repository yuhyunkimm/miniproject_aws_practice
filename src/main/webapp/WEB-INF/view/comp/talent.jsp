<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="mx-auto width-53 top-80">
   <div class="d-flex">
        <c:forEach items="${sDto.skillList}" var="skill">
            <span class="badge bg-secondary me-2">${skill}</span>
        </c:forEach>
        기술을 가진 인재를 추천합니다. 
    </div>
    <div class="d-flex flex-wrap my-3 info-card">
        <c:forEach items="${rDtos}" var="rDto">
            <div class="col-6 px-2 py-2 remove-card">
                <a href="/resume/${rDto.resumeId}">
                    <div class="card">
                        <div>
                            <img src='${rDto.photo}' alt="" srcset="">
                        </div>
                        <div class="card-body">
                            <div>
                                ${rDto.name}
                            </div>
                            <div class="fs-5">
                                ${rDto.title}
                            </div>
                            <div>
                                <c:forEach items="${rDto.skillList}" var="skill">
                                    <span class="badge bg-secondary me-2">${skill}</span>
                                </c:forEach>
                            </div>
                            <div>
                                ${rDto.career} ${rDto.education} ${rDto.address}
                            </div>
                            <div class="d-flex justify-content-between">
                                <div><i id=`scrap-${rDto.resumeId}` class="fa-regular fa-star"
                                        onclick="scrap(`${rDto.resumeId}`)"></i>
                                    <input type="hidden" id="endDate-${rDto.resumeId}" value="">
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