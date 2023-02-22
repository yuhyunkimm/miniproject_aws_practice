 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <div class="p-3 bg-light text-black rounded text-center" style="margin-bottom: 0">
        <div class="width-53 mx-auto">
            <div class="d-flex justify-content-around ">
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
                    고객센터
                </div>
            </div>
            <div class="width-53 d-flex mx-auto justify-content-between p-5">
                <div>
                    <i class="fa-solid fa-house" style="font-size: 4em;"></i>
                </div>
                <div>
                    <p>Created by MetaCoding</p>
                    <p>📞 010-2222-7777</p>
                    <p>🏴 부산 수영구 XX동</p>
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
            console.log(keyword);
            location.href = "/search?keyword=" + keyword;
        }
    </script>
</body>

</html>