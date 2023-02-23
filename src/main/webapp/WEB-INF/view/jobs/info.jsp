<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="mx-auto width-53 mx-5 px-3 my-3">
    <div class="mb-4">
    <ul class="nav nav-pills nav-justified">
        <li class="nav-item mx-2">
          <button class="nav-link active tap-btn" aria-current="page" id="btn1" onclick="openTab(event, 'tab1')">지역별</button>
        </li>
        <li class="nav-item mx-2">
            <button class="nav-link tap-btn" aria-current="page" id="btn2" onclick="openTab(event, 'tab2')">기술별</button>
        </li>
        <li class="nav-item mx-2">
            <button class="nav-link tap-btn" aria-current="page" id="btn3" onclick="openTab(event, 'tab3')">직무별</button>
        </li>
        <li class="nav-item mx-2">
            <button class="nav-link tap-btn" aria-current="page" id="btn4" onclick="openTab(event, 'tab4')">경력별</button>
        </li>
      </ul>
    </div>

      <table class="my-table table table-striped">
        <tbody id="my-table-body1">
            <tr>
                <td>서울</td>
                <td>경기도</td>
                <td>인천</td>
                <td>부산</td>
                <td>대구</td>
              </tr>
              <tr>
                <td>광주</td>
                <td>대전</td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
          </tbody>
          
      </table>

<!-- 가운데 -->


<!-- 공고들 -->
<div class="row my-3 ">
    
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                    the card's content.</p>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
    </div>

</div>
</div>
<script>
    document.getElementById("btn1").addEventListener("click", function () {
        updateTableData("btn1");
    });
    document.getElementById("btn2").addEventListener("click", function () {
        updateTableData("btn2");
    });
    document.getElementById("btn3").addEventListener("click", function () {
        updateTableData("btn3");
    });
    document.getElementById("btn4").addEventListener("click", function () {
        updateTableData("btn4");
    });

    // 테이블 데이터 변경
    function updateTableData(buttonId) {
        var tableBody = document.getElementById("my-table-body1");
        tableBody.innerHTML = ""; // 테이블 데이터 초기화

        // 버튼에 따라 다른 데이터를 보여줌
        if (buttonId === "btn1") {
            let el = `
            <tr>
              <td>서울</td>
              <td>경기도</td>
              <td>인천</td>
              <td>부산</td>
              <td>대구</td>
            </tr>
            <tr>
              <td>광주</td>
              <td>대전</td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            `;
            $('#my-table-body1').append(el);
        } else if (buttonId === "btn2") {
            let el = `
            <tr>
              <td>Java</td>
              <td>JavaScript</td>
              <td>Spring</td>
              <td>HTML/CSS</td>
              <td>jQuery</td>
            </tr>
            <tr>
              <td>JSP</td>
              <td>Vue.js</td>
              <td>Oracle</td>
              <td>MySQL</td>
              <td>React</td>
            </tr>
            `;
            $('#my-table-body1').append(el);
        } else if (buttonId === "btn3") {
            let el = `
            <tr>
              <td>서버 개발자</td>
              <td>백엔드 개발자</td>
              <td>프론트엔드 개발자</td>
              <td>안드로이드 개발자/CSS</td>
              <td>IOS 개발자</td>
            </tr>
            <tr>
              <td>풀스택 개발자</td>
              <td>빅데이터 엔지니어</td>
              <td>임베디드 개발자</td>
              <td>devops 개발자 </td>
              <td></td>
            </tr>
            `;
            $('#my-table-body1').append(el);
        } else if (buttonId === "btn4") {
            let el = `
            <tr>
              <td>신입</td>
              <td>1년 미만</td>
              <td>1년차</td>
              <td>2년차/CSS</td>
              <td>3년차</td>
            </tr>
            <tr>
              <td>4년차</td>
              <td>5년차</td>
              <td>6년차</td>
              <td>7년차</td>
              <td>8년차이상</td>
            </tr>
            `;
            $('#my-table-body1').append(el);
        }
    }


    function openTab(evt, tabName) {
        let tablinks;
        // 모든 탭 버튼에서 active 클래스를 제거
        tablinks = document.getElementsByClassName("tap-btn");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].classList.remove("active");
        }
        evt.currentTarget.classList.add("active");
    }
</script>
<%@ include file="../layout/footer.jsp" %>  