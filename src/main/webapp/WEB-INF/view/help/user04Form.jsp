<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>Blog</title>
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
    <style>
        .qButton {
            font-size: 1em;
            font-weight: bold;
            width: 124px;
            height: 35px;
            display: inline;
            float: right;
            margin-right: 3em;
            background-color: rgb(20, 73, 233);
            cursor: pointer;
            color: rgb(255, 255, 255);
            border: none;
            padding: 0.2em 2em;

        }

        .qButton:hover {
            background-color: rgb(59, 103, 235);
            cursor: pointer;
        }

        .width-53 {
            width: 53%;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-sm bg-light navbar-light  ">
        <div class="container-fluid width-53">
            <div class="">
                <a class="navbar-brand" href="/"><i class="fa-brands fa-github-square" style="font-size: 2em;"></i></a>
            </div>
            <div class="d-flex">
                <div class="me-4">
                </div>
                <div class="my-auto me-5">
                    <a href="/user/myhome">
                        <i class="fa-regular fa-user"></i>
                    </a>
                </div>
                <div class="my-auto pb-1">
                    <a href="/comp/comphome"><span class="badge bg-success">기업홈</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-fluid width-53 top-80">
        <div>
            <div style="font-size: 1.2em; font-weight : bold; display:inline; margin-left : 0em;">
                <a href="/help" style="color: black; text-decoration: none;"> 고객 서비스</a>
            </div>
            <button type="submit" class="qButton" style="border-radius: 30px; padding: 1.5px 20px; margin-right: 0em;">
                <a href="/help/inquiryForm" style="text-decoration: none; color: rgb(253, 255, 255);"> 문의하기</a>
            </button>
            <hr>
        </div>

        <div style="font-weight: bold; font-size: 0.8em; color: rgb(145, 143, 143); display:inline; margin-left : 0em;">
            고객센터 ＞ 개인회원 ＞
        </div>
        <div style="font-weight: bold; font-size: 0.8em; display:inline; margin-left : 0.1em;">보상금 ∙ 뉴스타트 패키지</div>

        <div style="margin-top: 70px;"></div>
        <div style="font-weight: bold; font-size: 1.4em;">보상금 지급 정보를 늦게 제출 했습니다. 어떻게 되나요?</div>
        <div style="margin-top: 35px;"></div>


        <div style="margin-top: 40px;"></div>

        <div
            style="font-size: 1.1em; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">
            지급 정보 제출하신 경우 빠른 시일내로 확인하고 있으며, 확인된 날짜 기준으로 가장 빠른 지급일에 맞춰 보상금 지급 대상자로 변경됩니다.</div>
        <div style="margin-top: 10px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
            보상금 지급 안내 메일을 받은 후 익월 3일까지 지급 정보 제출이 확인되지 않을 경우 익월 10일에 미지급 되고, </div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
            지급 정보 제출시에 채용일을 함께 기재해주셔야 가장 빠른 지급일에 해당하는 보상금 지급 대상자로 변경됩니다.</div>

        <div style="margin-top: 400px;"></div>

        <div style="font-size: 0.9em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">또 다른 질문이 있으십니까?</div>
        <div style="font-size: 0.9em; color: blue; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;"><a href="/help/inquiryForm"style="color: blue;""> 다른 문의등록하기＞</a></div>
        <div style="margin-top: 100px;"></div>
    </div>


</body>

</html>
<%@ include file="../layout/footer.jsp" %>