<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header-simple.jsp" %>

    <div style="display:flex;" class="my-5">
        <div class="mx-auto width-53 top-40">
        <div class="rounded-3 container all-form border border-3 p-3 mt-5" style="width: 400px;">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item fs-4">
                    <a class="nav-link" href="/comp/login">기업로그인</a>
                </li>
                <li class="nav-item fs-4">
                    <a class="nav-link text-muted" href="/comp/join">기업회원가입</a>
                </li>
            </ul> 

            <form action="/comp/login" method="post">
               <div class="d-flex form-group mt-2 mb-2">
                    <input type="email" name="email" class="form-control" placeholder="Enter email" id="email"
                    value="${cookie.rememberEmail.value}">
                </div>

                <div class="form-group mb-2">
                    <input type="password" name="password" class="form-control" placeholder="Enter password"
                        id="password">
                </div>

                <div class="box mb-2">
                    <span class="input-wrap mb-2">
                        <input type="checkbox" id="rememberEmail" name="rememberEmail">
                        이메일을 기억 하시겠습니까?
                    </span>
                </div>

                <!-- <div class="d-flex justify-content">
                    <div>
                        <a href="/" class="emailSearch" id="emailSearch">이메일 찾기</a>
                    </div>
                    <div>
                        <a href="/" class="pwSearch" id="pwSearch">비밀번호 찾기</a>
                    </div>
                </div> -->

                <div class="d-grid gap-2 mb-2">
                    <input id="button" class=" btn btn-primary" type="submit" value="로그인"
                        onclick="submitForm()">
                </div>

                <hr>
                <div class="d-flex justify-content-around ">
                    <div>
                        <a href="/" class="emailSearch" id="emailSearch">이용 약관</a>
                    </div>
                    <div>
                        <a href="/" class="pwSearch" id="pwSearch">개인정보 처리방법</a>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    </div>
<%@ include file="../layout/footer.jsp" %>