<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="mx-auto width-53 top-80">
            <div class="container mb-5">
                <form>
                    <div class="row">
                        <div class="col-10">
                            <br>
                            <h5>이력서 상세보기<br></h5>
                            <hr />
                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">기본 정보</div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-3">
                                            프로필 사진
                                        </div>
                                        <div class="col-9">
                                            <p>이름</p>
                                            <p>번호</p>
                                            <p>email</p>
                                            <p>주소</p>
                                            <p>생년월일</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">학력 사항</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="education" id="education" class="form-control"
                                            value="학력사항" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">경력 사항</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="career" id="career" class="form-control" value="경력사항"
                                            readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">보유 기술</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="skillName1" id="skillName1" class="form-control"
                                            value="경력사항" readonly>
                                        <input type="text" name="skillName2" id="skillName1" class="form-control"
                                            value="경력사항" readonly>
                                        <input type="text" name="skillName3" id="skillName3" class="form-control"
                                            value="경력사항" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">자기소개서</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <textarea class="form-control" name="content" id="content" rows="3" readonly>
                                            자기소개글
                                        </textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">링크</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="text" name="link" id="link" class="form-control" value="링크">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-2">
                            <div id="rButton">
                                <br>
                                <div class="row p-1">
                                    <button type="button" class="btn btn-success w-80">스크랩</button>
                                </div>
                                <div class="row p-1">
                                    <button type="button" class="btn btn-success w-80">제안하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%@ include file="../layout/footer.jsp" %>