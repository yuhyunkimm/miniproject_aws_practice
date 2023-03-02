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
                            <input type="text" name="address" class="form-control" placeholder="Enter address"
                                id="address" value="${user.adress}">
                        </div>

                        <div class="d-grid gap-2 mb-2">
                            <button onclick="updateUser(${principal.userId})" class=" btn btn-primary">수정완료</button>
                        </div>

                    </form>
                </div>
            </div>

            </div>
            <script>
                // 회원 수정 update 버튼
                function updateUser(id) {
                    let data = {
                        userId: id,
                        password: $("#password").val(),
                        birth: $("#birth").val(),
                        tel: $("#tel").val(),
                        address: $("#address").val()
                    };
                    $.ajax({
                        type: "put",
                        url: "/user/update",
                        data: JSON.stringify(data),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json"
                    }).done((res) => {
                        alert(res.msg);
                        location.href = "/user/update";
                    }).fail((err) => {
                        alert(err.responseJSON.msg);
                    });
                }
            </script>

        </body>

        </html>