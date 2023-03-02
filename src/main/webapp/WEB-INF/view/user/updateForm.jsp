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
            <title>개인 회원수정 페이지</title>
        </head>

        <body>
            <div class="mx-auto width-53">
                <div class="container border border-3 p-3 mt-5" style="width: 350px;">
                    <div style="text-align: center;">
                        <h4>개인 회원정보 수정</h4>
                    </div>
                    <form>

                        <div class="form-group mb-2">
                            <input type="password" name="password" class="form-control" placeholder="Enter password"
                                id="password">
                        </div>

                        <div class="form-group mb-2">
                            <input type="password" class="form-control" placeholder="Enter passwordCheck"
                                id="passwordCheck">
                        </div>

                        <div class="form-group mb-2">
                            <input type="date" name="birth" class="form-control" placeholder="Enter birth" id="birth"
                                value="${user.birth}">
                        </div>

                        <div class="form-group mb-2">
                            <input type="tel" name="tel" class="form-control" placeholder="Enter tel" id="tel"
                                value="${user.tel}">
                        </div>

                        <div class="form-group mb-4">
                            <input type="text" name="Address" class="form-control" placeholder="Enter Address"
                                id="Address" value="${user.adress}">
                        </div>

                        <div class="d-grid gap-2 mb-2">
                            <input id="button" class=" btn btn-primary" type="submit" value="수정완료"
                                onclick="submitForm()">
                        </div>

                    </form>
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
                                        aria-describedby="passwordHelp1">
                                    <div id="passwordHelp1" class="form-text">현재 비밀번호를 입력해 주세요.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="inputPassword" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="inputPassword"
                                        aria-describedby="passwordHelp2">
                                    <div id="passwordHelp2" class="form-text">비밀번호를 한번 더 입력해 주세요.</div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <script>
                const passwordInputEl = document.querySelector('#inputPassword')
                const modalEl = document.querySelector('#modal')

                modalEl.addEventListener('shown.bs.modal', function () {
                    passwordInputEl.focus()
                })
            </script>

        </body>

        </html>