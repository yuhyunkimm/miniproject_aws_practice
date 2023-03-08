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
        <div style="font-weight: bold; font-size: 0.8em; display:inline; margin-left : 0.1em;">보상금ㆍ뉴스타트 패키지</div>

        <div style="margin-top: 70px;"></div>
        <div style="font-weight: bold; font-size: 1.4em;">추천·채용 보상은 어떻게 지급되나요?</div>
        <div style="margin-top: 30px;"></div>
        <div style="font-size: 1.6em; font-weight: bold; display:inline;">더 쉬운</div>
        <div style="font-size: 1.6em; font-weight: bold; color: blue; display:inline;">추천</div>
        <div style="font-size: 1.6em; font-weight: bold; display:inline;">, 강력한</div>
        <div style="font-size: 1.6em; font-weight: bold; color: blue; display:inline;">보상</div>


        <h3 style="font-size: 1.1em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
            지인의 추천은 늘 힘이 됩니다</h3>
        <h3 style="font-size: 1.1em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">
            합격자와 추천인</h3>
        <h3 style="font-size: 1.1em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bold; 
            display:inline;">
            각각 50만원의 보상금</h3>
        <h3 style="font-size: 1.1em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">
            을 드려요</h3>

        <div style="margin-top: 25px;"></div>
        <div style="font-weight: bold; font-size: 1.0em; display:inline;">① 추천인과 합격자가 있을 경우 : </div>
        <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline; ">
            각 50만원 지급</div>
        <br>
        <div style="font-weight: bold; font-size: 1.0em; display:inline;">② 추천인없이 합격했을 경우 : </div>
        <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">합격자에 한해 50만원 지급</div>
        <br>
        <div style="font-weight: bold; font-size: 1.0em; display:inline;">③ 매치업을 통해 합격했을 경우 : </div>
        <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">합격자에 한해 50만원 지급</div>

        <div style="margin-top: 25px;"></div>
        <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
            기업에서 최종 합격 통보를 받으셨다면, 보상금 지급 버튼을 클릭해주세요.</div>
        <div style="margin-top: 12px;"></div>
        <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
            3개월(93일) 초과 근무일에 맞춰 보상금 지급 안내 메일을 보내드립니다 !</div>

        <div style="margin-top: 30px;"></div>
        <div style="font-size: 1.6em; font-weight: bold; color: blue; display:inline;">지급 방법</div>
        <div style="font-size: 1.6em; font-weight: bold;display:inline;">은 어떻게 되나요?</div>
        <br>
        <div style="font-size: 1.1em; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">합격자 입사일 기준 3개월(93일) 초과 근무 및 재직 여부가 확인</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: inline;">
            되면 보상금 지급 대상자로 선정 됩니다.</div>

        <div style="margin-top: 25px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">입사 후 3개월(93일 초과 재직) 초과 근무 시, </div>
        <div style="font-size: 1.0em; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;"> 해당 월</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">에 맞춰 보상금 지급 안내 메일이 전달되며, 지급에 필요한</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">정보를</div>
        <div style="font-size: 1.0em; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">익월 3일까지</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">제출해주시면 </div>
        <div style="font-size: 1.0em; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">같은 달 10일</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">에 지원자와 추천인에게 각각 50만원의 보상금이 지급됩니다.</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">(ex. 3/1일 입사자는 6/2일까지 근무 시, 7/10일에 보상금 지급)</div>
        <div style="margin-top: 15px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">※ 보상금 지급일이 주말 또는 공휴일일 경우, 해당일 전 보상금이 지급됩니다.</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">(ex.</div>
        <div style="font-size: 1.6em; font-weight: bold; font-size: 1.0em; color: red; 
            display:inline;">2021-04-10 토요일 → 2021-04-09 금요일</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">)</div>


        <div style="margin-top: 50px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">
            위 안내된 기간 이후 지급 정보 제출를 제출하셨을 경우, 제출 여부를 문의사항으로 남겨주시면 확인 후 가장 빠른</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display:inline;">
            지급일에 보상금이 지급됩니다.</div>

        <div style="margin-top: 50px;"></div>
        <div style="font-size: 1.6em; font-weight: bold; font-size: 1.0em; display:inline;">[예시]</div>
        <br>
        <div style="margin-top: 20px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">① 3/1일 입사자는 6/2일까지 근무 시, 7/10일 보상금 지급을 위해</div>
        <div style="font-size: 1.6em; font-weight: bold; font-size: 1.0em; display:inline;">7/3일 까지</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">지급 정보를 제출해야 함</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">② 위 기한이 지난 7/4일 지급 정보를 제출할 시,</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">문의사항으로 제출이 늦었음을 전달</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">③ 전달 받은 날로부터 가장 빠른</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display:inline;">③ 전달 받은 날로부터 가장 빠른</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">에 맞춰 8/10일 보상금 지급</div>
        <div style="margin-top: 50px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">외국인의 경우,</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">[외국인등록증]</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">또는</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">[외국국적동포 국내거소신고증]</div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">을 보상금 지급 안내 메일을 받은 해당 월 말</div>
        <br>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">일까지 보내주시기 바랍니다.</div>
        <br>
        <div style="margin-top: 30px;"></div>
        <div style="font-size: 1.0em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">보상금 정책은 합격자 50만원, 추천인 50만원으로 공고에 따라 지급 금액이 상이할 수 있는 점 참고 바랍니다.</div>
        <br>
        <div style="margin-top: 10px;"></div>
        <div style="font-size: 1.6em; font-weight: bold; color: blue; font-size: 1.0em; display:inline;">
            ※ 보상금 지급 시, 소득세법에 따라 기타소득세(8.8%)가 원천징수 됩니다.</div>
        <br>
        <div style="margin-top: 50px;"></div>
        <div style="font-size: 0.8em; color: red; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">※ 입사일로부터 3개월 이내(92일) 에 퇴사할 예정이거나 이미 퇴사한 경우 보상금 수령 대상에서 제외되며,
            퇴사 이후 보상금을 수령 하였을 시</div>
        <br>
        <div style="font-size: 0.8em; color: red; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">전액 환불 조치 되니, 이미 퇴사하였거나 퇴사 예정인 분께서는 고객센터로 퇴사일자를 전달 주시기 바랍니다.</div>
        <div style="margin-top: 160px;"></div>

        <div style="font-size: 0.9em; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;">또 다른 질문이 있으십니까?</div>
        <div style="font-size: 0.9em; color: blue; font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display:inline;"><a href="/help/inquiryForm"style="color: blue;"> 다른 문의등록하기＞</a></div>
        <div style="margin-top: 100px;"></div>
    </div>


</body>

</html>
<%@ include file="../layout/footer.jsp" %>