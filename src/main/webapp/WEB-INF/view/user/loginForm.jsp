<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <link rel="stylesheet" href="/css/style.css">
            <title>로그인 페이지</title>
        </head>

        <body>
            <div class="mx-auto width-53">
                <div class="container w-50 border border-3 p-3 mt-5" style="width: 300px;">
                    <div class="card-header d-flex justify-content-around my-4">
                        <div class="fs-4">
                            <a href="/user/login">로그인</a>
                        </div>
                        <div class="fs-4">
                            <a href="/user/join">회원가입</a>
                        </div>
                    </div>

                    <form action="/user/login" method="post">
                        <div class="d-flex form-group mb-2">
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

            <script>

            </script>
        </body>

        </html>