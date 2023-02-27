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
            <title>기업 회원가입 페이지</title>
        </head>

<body>
    <div class="mx-auto width-53">
        <div class="container w-50 border border-3 p-3 mt-5" style="width: 300px;">
            <div class="card-header d-flex justify-content-around my-4">
                <div class="fs-4">
                    <a href="/comp/login">기업 로그인</a>
                </div>
                <div class="fs-4">
                    <a href="/comp/join">기업 회원가입</a>
                </div>
            </div>

            <form action="/comp/join" method="post">
                <div class="d-flex form-group mb-2">
                    <input type="email" name="email" class="form-control" placeholder="Enter email" id="email">
                </div>

                <div class="form-group mb-2">
                    <input type="password" name="password" class="form-control" placeholder="Enter password"
                        id="password">
                </div>

                <div class="form-group mb-2">
                    <input type="password" class="form-control" placeholder="Enter passwordCheck" id="passwordCheck">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="compName" class="form-control" placeholder="Enter companyName"
                        id="compName">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="businessNumber" class="form-control" placeholder="Enter businessNumber"
                        id="businessNumber">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="compAddress" class="form-control" placeholder="Enter companyAddress"
                        id="compAddress">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="homePage" class="form-control" placeholder="Enter homePage" id="homePage">
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="flexCheckChecked1">
                    <label class="form-check-label" for="flexCheckChecked">
                        (필수) 이용약관 동의
                    </label>
                </div>
                <div class="form-check mb-4">
                    <input class="form-check-input" type="checkbox" id="flexCheckChecked2">
                    <label class="form-check-label" for="flexCheckChecked">
                        (필수) 개인정보 수집 및 이용 동의
                    </label>
                </div>

                <div class="d-grid gap-2 mb-4">
                    <input id="button" class=" btn btn-primary" type="submit" value="가입완료" onclick="submitForm()">
                </div>


            </form>
        </div>
    </div>
    </div>
    <script>
        // 회원가입 버튼 클릭 이벤트
        function submitForm() {
            let agreeCheckbox1 = document.getElementById("flexCheckChecked1");
            let agreeCheckbox2 = document.getElementById("flexCheckChecked2");
            if (!agreeCheckbox1.checked || !agreeCheckbox2.checked) {
                alert("약관에 동의해주세요.");
                return;
            }
        }
    </script>

</body>

</html>