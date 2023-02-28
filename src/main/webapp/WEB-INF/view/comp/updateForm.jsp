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
            <title>기업 회원수정 페이지</title>
        </head>

<body>
    <div class="mx-auto width-53">
        <div class="container border border-3 p-3 mt-5" style="width: 350px;">
            <div style="text-align: center;">
                <h4>기업 회원정보 수정</h4>
            </div>
            <form action="/" method="post">

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
                    <select autofocus name="representativeName">
                        <option value="">필요 기술 선택(다중)</option>
                        <option value="">Java</option>
                        <option value="">JavaScript</option>
                        <option value="">Spring</option>
                        <option value="">HTML/CSS</option>
                        <option value="">jQuery</option>
                        <option value="">JSP</option>
                        <option value="">Vue.js</option>
                        <option value="">Oracle</option>
                        <option value="">MySQL</option>
                        <option value="">React</option>
                    </select>
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="" class="form-control" placeholder="관심 카테고리" id="">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="homepage" class="form-control" placeholder="Enter homepage" id="homepage">
                </div>

                <div class="d-grid gap-2 mb-4">
                    <input id="button" class=" btn btn-primary" type="submit" value="수정완료" onclick="submitForm()">
                </div>

            </form>
        </div>
    </div>
    </div>
    <script>

    </script>

</body>

</html>