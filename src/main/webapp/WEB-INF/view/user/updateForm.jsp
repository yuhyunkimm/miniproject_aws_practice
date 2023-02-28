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
            <form action="/user/update" method="post">

                <div class="form-group mb-2">
                    <input type="password" name="password" class="form-control" placeholder="Enter password"
                        id="password">
                </div>

                <div class="form-group mb-2">
                    <input type="password" class="form-control" placeholder="Enter passwordCheck" id="passwordCheck">
                </div>

                <div class="form-group mb-2">
                    <input type="date" name="birth" class="form-control" placeholder="Enter birth" id="birth">
                </div>

                <div class="form-group mb-2">
                    <input type="tel" name="tel" class="form-control" placeholder="Enter tel" id="tel">
                </div>

                <div class="form-group mb-4">
                    <input type="text" name="Address" class="form-control" placeholder="Enter Address" id="Address">
                </div>

                <div class="d-grid gap-2 mb-2">
                    <input id="button" class=" btn btn-primary" type="submit" value="수정완료" onclick="submitForm()">
                </div>

            </form>
        </div>
    </div>
    </div>
     <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 확인</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">passwordCheck</label>
                            <input type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                        
                        <button type="button" class="btn btn-success mt-2" style="float: right;" onclick="updateComp()"  data-bs-dismiss="modal">인증 완료</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>

    </script>

</body>

</html>