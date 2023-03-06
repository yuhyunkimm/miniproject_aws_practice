<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
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
                .container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                h2 {
                    margin-top: 2rem;
                }

                form {
                    width: 40%;
                    margin-top: 2rem;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    border: 1px solid gray;
                    padding: 1rem;
                    border-radius: 10px;
                }

                .form-group {
                    margin-bottom: 1rem;
                    text-align: center;
                }

                .form-group img {
                    width: 200px;
                    height: 200px;
                    border-radius: 10px;
                    margin-top: 1rem;
                    margin-bottom: 1rem;
                    /* border: 1px solid gray; */
                }

                .btn {
                    margin-top: 1rem;
                }
            </style>
        </head>

        <body>
            <div class="mx-auto width-53 top-80">

                <div class="container">
                    <h2 class="text-center">프로필 사진 변경</h2>
                    <form id="profileForm">
                        <div class="form-group">
                            <img src="${principal.photo == null ? 'default_profile.png' : principal.photo}"
                                alt="Current Photo" class="img-fluid" id="imagePreview">
                        </div>
                        <div class="form-group">
                            <input type="file" class="form-control" id="photo" name="photo"
                                onchange="chooseImage(this)">
                        </div>
                        <button type="button" class="btn btn-success" onclick="updateImage()">사진
                            변경</button>
                    </form>
                </div>

            </div>

            <script>
                function chooseImage(obj) {
                    // console.log(obj);  // 태그 전체를 나오게함
                    // console.log(obj.files);
                    let f = obj.files[0];
                    console.log(f); // 메타데이터만 출력 / 빠르게 읽었음
                    if (!f.type.match("image.*")) {
                        alert("이미지를 등록해야 합니다.")
                        return;
                    }
                    let reader = new FileReader(); // 파일읽는 객체
                    reader.readAsDataURL(f); // 넌 왜 void 로 되어 있는걸까 비동기 처리가 나오기 전에 나와서 void 로 되어 있는걸까 ?
                    // 서버의 하드디스크에서 (지금은 c드라이브) 파일을 읽어오기 때문에 엄청 느리다 !!!! return 타입을 정해놓으면 return을 기다려야 하기 때문에 
                    // i/o로 접근하는 모든것들은 이벤트큐에 등록한다. -> `chooseImage`함수의 코드들이 콜스택에 등록됨 ... 
                    // `readAsDataURL` 만 이벤트큐에 등록됨.. 이벤트 루프가 돌면서 파일을 다운받을때까지 기다리다가 읽는게 내부적으로 구현되어 있음

                    reader.onload = function (e) {       // 콜백함수를 등록 -onload() => readAsDataURL 끝나면 다음 함수를 실행해라 !
                        // console.log(e);
                        // 사진을 바꿔치기해야함
                        $('#imagePreview').attr("src", e.target.result);

                    }
                    let profileForm = $('#profileForm')[0];  // 배열로 리턴한다더라
                    // console.log(profileForm);
                    let formData = new FormData(profileForm);  // 폼의 모든 데이터를 가지고 있다.
                }

                function updateImage() {
                    let profileForm = $('#profileForm')[0];  // 배열로 리턴한다더라
                    console.log(profileForm);
                    let formData = new FormData(profileForm);  // 폼의 모든 데이터를 가지고 있다.
                    // console.log();
                    $.ajax({
                        type: "put",
                        url: "/user/profileUpdate",
                        contentType: false,  // x-www 으로 파싱하지 마라   // 순서도 중요 contentType 부터 순서 바꿔서 테스트 해봐
                        processData: false, // contentType 이 false가 되면 자동으로 쿼리스트링으로 파싱하련느데 이걸 해제 시켜야함
                        data: formData,
                        enctype: "multipart/form-data",

                        dataType: "json"
                    }).done((res) => {
                        alert(res.msg);
                        opener.parent.location.reload();
                        window.close();
                        // location.href = "/user/myhome"
                    }).fail((err) => {
                        alert(err.responseJSON.msg);
                    });
                }
            </script>


        </html>