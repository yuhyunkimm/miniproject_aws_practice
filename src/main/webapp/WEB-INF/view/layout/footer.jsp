<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="p-3 bg-light text-black rounded " style="margin-bottom: 0">
    <div class="width-53 mx-auto">
        <div class="d-flex justify-content-around text-center">
            <div>
                회사소개
            </div>
            <div>
                이용약관
            </div>
            <div>
                개인정보처리방침
            </div>
            <div>
                <a href="/help">
                    고객센터
                </a>
            </div>
        </div>
        <div class=" d-flex justify-content-between p-5">
            <div class="p-5">
                <i class="fa-solid fa-house" style="font-size: 4em; "></i>
            </div>
            <div class="ms-5 mt-4" style="font-size: 14px; line-height: 0.6 ;">
                <p> 사람인 고객센터 02-2025-4733 (평일 09:00~19:00, 주말·공휴일 휴무)</p>
                <p>이메일 : help@saramin.co.kr, Fax : 02-6937-0039(대표), 02-6937-0035(세금계산서) </p></br>
                <p>(주)사람인HR, 우 : 08378, 서울특별시 구로구 디지털로34길 43 2층, 대표 : 김용환</p>
                <p>사업자등록 : 113-86-00917, 직업정보제공사업 : 서울 관악 제 2005-6호, 통신판매업 : 제 2005-02339호</p></br>
                <p>Copyright (c) (주)사람인HR. All rights reserved.</p></br>
            </div>
        </div>
    </div>
</div>
<script>
    function searchBox() {
        $('#search-header').css('display')
        const searchHeader = document.getElementById("search-header");
        if (searchHeader.style.display === "none") {
            searchHeader.style.display = "block";
            searchHeader.focus();
        }
    }
    function searchEvt() {
        const keyword = $('#search-header').val();
        location.href = "/jobs/info/search?keyword=" + keyword;
    }
</script>
</body>

</html>