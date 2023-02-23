<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="mx-auto width-53 mx-5 px-3 my-3">
    <div class="mb-4">
    <ul class="nav nav-pills nav-justified">
        <li class="nav-item mx-2">
          <button class="nav-link active tap-btn"  id="btn1" onclick="openTab(event, 'tab1')">지역별</button>
        </li>
        <li class="nav-item mx-2">
            <button class="nav-link tap-btn" " id="btn2" onclick="openTab(event, 'tab2')">기술별</button>
        </li>
        <li class="nav-item mx-2">
            <button class="nav-link tap-btn"  id="btn3" onclick="openTab(event, 'tab3')">직무별</button>
        </li>
        <li class="nav-item mx-2">
            <button class="nav-link tap-btn"  id="btn4" onclick="openTab(event, 'tab4')">경력별</button>
        </li>
      </ul>
    </div>
      <table class="my-table table table-bordered">
        <tbody id="my-table-body1">
            <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="서울">서울
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="경기도"> 경기도
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="인천"> 인천
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="부산"> 부산
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="대구"> 대구
                        </label>
                     </div>
                </td>
              </tr>
              <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="대전"> 대전
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="광주"> 광주
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="제주"> 제주
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="지역"> 지역
                        </label>
                     </div>

                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="지역 2"> 지역 2
                        </label>
                     </div>
                </td>
              </tr>
          </tbody>
          
      </table>
      <div id="selected">

      </div>
      <div >
        여기 줄 긋고
      </div>

<!-- 공고들 -->
<div class="row my-3 ">
    <c:forEach items="${jDtos}" var="jDto">
        <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${jDto.title}</h5>
                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                    the card's content.</p>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
    </div>
    </c:forEach>


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

    // $('input[type="checkbox"]').on('click', ()=>{
    //     let temp = $('input[type="checkbox"]').val()
    //     $('#selected').append(temp);
    // })
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');

    checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener('click', function() {
      // 클릭한 체크박스의 값을 가져옵니다.
      const checkedValues = [];
      checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            console.log(checkbox.value);
        }
      });
    //   console.log(checkedValues);
    });
  });

    // 테이블 데이터 변경
    function updateTableData(buttonId) {
        var tableBody = document.getElementById("my-table-body1");
        tableBody.innerHTML = ""; // 테이블 데이터 초기화

        // 버튼에 따라 다른 데이터를 보여줌
        if (buttonId === "btn1") {
            let el = `
            <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="서울">서울
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="경기도"> 경기도
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="인천"> 인천
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="부산"> 부산
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="대구"> 대구
                        </label>
                     </div>
                </td>
              </tr>
              <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="대전"> 대전
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="광주"> 광주
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="제주"> 제주
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="지역"> 지역
                        </label>
                     </div>

                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="지역2"> 지역2
                        </label>
                     </div>
                </td>
              </tr>
            `;
            $('#my-table-body1').append(el);
        } else if (buttonId === "btn2") {
            let el = `
            
            <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="Java">Java
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="JavaScript"> JavaScript
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="Spring"> Spring
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="HTML">  HTML
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="jQuery"> jQuery
                        </label>
                     </div>
                </td>
              </tr>
              <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="JSP"> JSP
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="Vue.js"> Vue.js
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="Oracle"> Oracle
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="MySQL"> MySQL
                        </label>
                     </div>

                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="React"> React
                        </label>
                     </div>
                </td>
              </tr>
            `;
            $('#my-table-body1').append(el);
        } else if (buttonId === "btn3") {
            let el = `
            <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="서버 개발자">서버 개발자
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="백엔드 개발자"> 백엔드 개발자
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="프론트엔드 개발자"> 프론트엔드 개발자
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="안드로이드 개발자"> 안드로이드 개발자
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="IOS 개발자"> IOS 개발자
                        </label>
                     </div>
                </td>
              </tr>
              <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="풀스택 개발자"> 풀스택 개발자
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="빅데이터 엔지니어"> 빅데이터 엔지니어
                        </label>
                     </div>
                </td>
      
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="임베디드 개발자"> 임베디드 개발자
                        </label>
                     </div>

                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="devops 개발자"> devops 개발자
                        </label>
                     </div>
                </td>

                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="비엇음"> 비엇음
                        </label>
                     </div>
                </td>
              </tr>
            `;
            $('#my-table-body1').append(el);
        } else if (buttonId === "btn4") {
            let el = `
            <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="신입">신입
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="1년차 미만"> 1년차 미만
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="1년차"> 1년차
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="2년차"> 2년차
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="3년차"> 3년차
                        </label>
                     </div>
                </td>
              </tr>
              <tr>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="4년차"> 4년차
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="5년차"> 5년차
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="6년차"> 6년차
                        </label>
                     </div>
                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="7년차"> 7년차
                        </label>
                     </div>

                </td>
                <td>
                    <div class="form-check text-center">
                        <label class="form-check-label">
                           <input class="form-check-input" type="checkbox" name="remember" value="8년차 이상"> 8년차 이상
                        </label>
                     </div>
                </td>
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

    function btnClick(btn){
        // active 라면 active 제거
        console.log(btn.getAttribute("class"));
        if(btn.getAttribute("class") === "btn btn-success"){
            console.log(btn.target);
            btn.target.attr('class', 'active');
            // btn.currentTarget.classList.add("active");
            console.log('zzz')
        }else{
            // evt.currentTarget.classList.add("active");
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>  