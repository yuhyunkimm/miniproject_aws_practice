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
                    width: 50%;
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
                    <form id="profileForm" action="/user/profileUpdate" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <img src="${user.photo == null ? 'default_profile.png' : user.photo}" alt="Current Photo"
                                class="img-fluid" id="imagePreview">
                        </div>
                        <div class="form-group">
                            <input type="file" class="form-control" id="photo" name="photo"
                                onchange="chooseImage(this)">
                        </div>
                        <button type="submit" class="btn btn-success">사진변경</button>
                    </form>
                </div>

            </div>

        </body>

        </html>