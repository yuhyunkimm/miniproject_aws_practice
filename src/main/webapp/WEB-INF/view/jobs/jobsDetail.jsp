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
        .my-grid {
            /* display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 10px; */
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

        .view-right {
            top: 5em;
            right: 24em;
            width: 270px;
            height: 200px;
            border: 1px solid rgb(0, 0, 0);
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
            border: 1px solid rgb(0, 0, 0);
            padding: 40px;
            padding-top: 0;
        }

        .border {
            border: 1px solid rgb(0, 0, 0);
        }

        header {
            position: sticky;
            top: 0px;
            /* 도달했을때 고정시킬 위치 */
            padding: 5px;
            padding-top: 25px;
            border-bottom: 1px solid #000;
            padding-bottom: 25px;
            background-color: white;
            /* border: 1px solid rgb(0, 0, 0); */
            z-index: 10;
        }
    </style>
</head>

<body>
    <div class="mx-auto width-53 top-80">
        <div class="relative">
            <div class="width-l my-border relative my-5">
                <header>
                    <div class="view-up row py-0 my-0">
                        <div class="col-1  my-auto">
                        <img src="${jDto.photo}" alt="" srcset="">
                        </div>
                        <div class="col-2 fs-5  my-auto">
                            ${jDto.compName}
                        </div>
                        <div class="col-9 fs-4  my-auto">
                            ${jDto.title}
                        </div>
                    </div>
                </header>
                <div class="">
                    <!-- 상세 공고 위치 -->
                    <div class="my-4">
                        <div class="row mb-3">
                            <!-- 회사정보 -->
                            <div class="col-3">
                                <div class="">
                                    <span class="me-5">
                                        경력
                                    </span>
                                    <span class="me-5">
                                        학력
                                    </span>
                                    <span class="me-5">
                                        개발직무
                                    </span>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="">
                                    <span>
                                        ${jDto.career}
                                    </span>
                                    <span>
                                        ${jDto.education}
                                    </span>
                                    <span>
                                        ${jDto.position}
                                    </span>
                                </div>
                            </div>
                            <div class="col-2">
                                <div>필요기술</div>
                                <div>근무지역</div>
                            </div>
                            <div class="col-4">
                                <div>
                                    ${jDto.skillName1} ${jDto.skillName2} ${jDto.skillName3}
                                </div>
                                <div>
                                    ${jDto.address}
                                </div>
                            </div>


                            
                        </div>
                        <div class="relative">
                        ${jDto.content}
                            <img class="w-100"
                                src="https://www.saraminimage.co.kr/recruit/bbs_recruit7/35_bm_img_230217.png">
                        </div>
                        <div class="fs-4 mt-5">
                            접수방법
                        </div>

                        <div class="border row">
                            <!-- 남은 날짜 -->
                            <div class="col-4">
                                <span class="fs-1">d-day 계산.. ${jDto.endDate}</span> 
                            </div>
                            <div class="col-8">
                                홈페이지 지원 ${jDto.homepage}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-r">
                <div class="view-fix d-grid  view-right p-4">
                    <!-- 뷰포트 -->
                    <div class="d-flex justify-content-between">
                        <div>
                            <img class="" src="${jDto.photo}"
                                style="height: 20px;">
                        </div>
                        <div class="me-2"><i id=`scrap-${jDto.jobsId}` class=" fa-regular fa-star"
                                onclick="scrap(`${jDto.jobsId}`)"></i>
                        </div>
                    </div>
                    <div class="fs-4">
                        <div class="my-1">

                        </div>
                        <div class="my-1 fs-5">
                            ${jDto.title}
                        </div>
                    </div>
                    <div class="align-self-end border">
                        <button type="button" class="btn btn-success w-100">지원하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>