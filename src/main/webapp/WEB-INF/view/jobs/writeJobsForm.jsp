<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .width-53 {
            width: 53%;
        }

        a {
            color: #000;
            text-decoration: none;
        }

        .view-fix {
            position: fixed;
        }

        .view-up {
            width: 64em;
        }

        .view-right2 {
            top: 5em;
            right: 24em;
            width: 270px;
            height: 200px;
            background-color: white;
        }

        .relative {
            position: relative;
        }

        .width-l {
            width: 77%;
            position: absolute;
        }

        .width-r {
            width: 23%;
            position: absolute;

        }

        .my-border {
            background-color: #f8f8f8;
            padding: 20px;
        }

        .border {
            border: 1px solid rgb(0, 0, 0);
        }

        .header {
            position: fixed;
            top: 0px;
            padding: 5px;
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
        <!-- 헤더 추가 요망 -->
        <div class="mx-auto width-53 mb-5">
            <div class="relative">
                <div class="width-l  my-5">
                    <div class="mb-5">
                        <!-- 회사 정보  -->
                        <div class="d-flex justify-content-between">
                            <div>
                                <h4>회사정보</h4>
                            </div>
                            <div>
                                <button type="button" class="btn btn-success mb-2">회사 정보 수정</button>
                            </div>
                        </div>
                        <div class="row justify-content-between my-border ">
                            <div class="my-border col-3">
                                <img class="" src="${cDto.photo}" alt="" srcset="" style="">
                            </div>

                            <div class="col-2 mt-3 ">
                                <div>
                                    회사명
                                </div>
                                <div>
                                    대표자명
                                </div>
                                <div>
                                    홈페이지
                                </div>
                            </div>
                            <div class="col-7 mt-3">
                                <div>
                                    ${cDto.compName}
                                </div>
                                <div>
                                    ${cDto.representativeName}
                                </div>
                                <div>
                                    ${cDto.homepage}
                                </div>
                            </div>
                        </div>

                        <!-- 공고등록 -->
                        <div class="row my-3 my-border">
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>공고 제목</h5>
                                </div>
                                <div class="col-10">
                                    <input type="text" name="title" class="form-control" value="" id="title">
                                </div>
                            </div>
                        </div>

                        <div class="row my-3 my-border">
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>학력</h5>
                                </div>
                                <div class="col-4">
                                    <select class="form-select" aria-label="Default select example" id="education" name="education">
                                        <option value="학력무관">학력무관</option>
                                        <option value="대졸">대졸</option>
                                        <option value="대학원 이상">대학원 이상</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>경력</h5>
                                </div>
                                <div class="col-4">
                                    <select class="form-select" aria-label="Default select example">
                                        <option id="title" value="title">신입</option>
                                        <option id="title" value="title">1년차 미만</option>
                                        <option id="title" value="title">1년차</option>
                                        <option id="title" value="title">2년차</option>
                                        <option id="title" value="title">3년차</option>
                                        <option id="title" value="title">4년차</option>
                                        <option id="title" value="title">5년차</option>
                                        <option id="title" value="title">6년차</option>
                                        <option id="title" value="title">7년차</option>
                                        <option id="title" value="title">8년차 이상</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>희망 직무</h5>
                                </div>
                                <div class="col-4">
                                    <select class="form-select" aria-label="Default select example">
                                        <option id="writer" value="username">서버 개발자</option>
                                        <option id="writer" value="username">백엔드 개발자</option>
                                        <option id="writer" value="username">프론트엔드 개발자</option>
                                        <option id="writer" value="username">안드로이드 개발자</option>
                                        <option id="writer" value="username">IOS 개발자</option>
                                        <option id="writer" value="username">풀스택 개발자</option>
                                        <option id="writer" value="username">빅데이터 엔지니어</option>
                                        <option id="writer" value="username">임베디드 개발자</option>
                                        <option id="writer" value="username">devops 개발자</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>근무지역</h5>
                                </div>
                                <div class="col-4">
                                    <select class="form-select" aria-label="Default select example">
                                        <option id="title" value="title">서울</option>
                                        <option id="title" value="title">부산</option>
                                        <option id="content" value="content">경기도</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>마감일</h5>
                                </div>
                                <div class="col-4">
                                    <input type="date" class="form-control">
                                </div>
                            </div>
                            <div class="d-flex my-2">
                                <div class="col-2 my-auto">
                                    <h5>접수방법</h5>
                                </div>
                                <div class="col-6">
                                    <table class="my-table table table-bordered" style="background-color: white;">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-check text-center">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox" name="skill"
                                                                value="Java">홈페이지 접수
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check text-center">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox" name="skill"
                                                                value="JavaScript">
                                                            공고 접수
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- 공고 조건 / 공고 내용 -->
                        <div class="row my-3 my-border">

                            <h5>필요 기술 ( 최대 3개 )</h5>
                            <div id="my-table-body2">
                                <table class="my-table table table-bordered" style="background-color: white;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="Java">Java
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="JavaScript">
                                                        JavaScript
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="Spring"> Spring
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="HTML"> HTML
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="jQuery"> jQuery
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="JSP"> JSP
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="Vue.js"> Vue.js
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="Oracle"> Oracle
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="MySQL"> MySQL
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-check text-center">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="React"> React
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="row my-3 my-border">
                            <div>
                                <h5>공고 상세 내용</h5>
                                <div class="form-group" style="background-color: white;">
                                    <textarea class="form-control summernote" id="content" rows="5" name="content"
                                        placeholder="글 내용을 입력해주세요"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="width-r">
                    <div class="view-fix d-grid view-right2 p-4">
                        <!-- 뷰포트 -->
                        <div class="align-self-end ">
                            <button type="button" class="btn btn-success w-100" onclick="test()" >미리보기</button>
                        </div>
                        <div class="align-self-end ">
                            <button type="button" class="btn btn-success w-100">임시저장</button>
                        </div>
                        <div class="align-self-end ">
                            <button type="button" class="btn btn-success w-100">공고등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('.summernote').summernote({
                tabsize: 2,
                height: 400
            });

            $('input:checkbox[name=skill]').click(function () {
                let count = $('input:checkbox[name=skill]:checked').length;
                if (count > 3) {
                    alert('기술은 3개까지 선택 가능')
                    $(this).prop('checked', false);
                }
            });

            function test(){
                let test = $('#education').val()
                console.log(test);
            }
        </script>
    </body>

</html>