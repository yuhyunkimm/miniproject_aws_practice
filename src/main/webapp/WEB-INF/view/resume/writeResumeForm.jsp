<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- d -->
    <div class="mx-auto width-53">
      <div class="container">
        <form>
          <div class="row">
            <div class="col-10">
              <br>
              이력서 작성<br>
              <hr />
              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">기본 정보</div>
                <div class="card-body">
                  <div class="form-group">
                    <label for="inputPhoto" class="form-label mt-1">프로필 사진</label>
                    <input type="image" name="photo" class="form-control" src="#" value="${user.photo}" readonly>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="form-label mt-1">이름</label>
                    <input type="text" name="name" class="form-control" value="${user.name}" readonly>
                  </div>
                  <div class="form-group">
                    <label for="inputTel" class="form-label mt-1">번호</label>
                    <input type="tel" name="tel" class="form-control" value="${user.tel}" readonly>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="form-label mt-1">Email</label>
                    <input type="email" name="email" class="form-control" value="${user.email}" readonly>
                  </div>
                  <div class="form-group">
                    <label for="inputAddress" class="form-label mt-1">주소</label>
                    <input type="text" name="Address" class="form-control" value="${user.Address}" readonly>
                  </div>
                  <div class="form-group">
                    <label for="inputBirth" class="form-label mt-1">생년월일</label>
                    <input type="date" name="birth" class="form-control" value="${user.birth}" readonly>
                  </div>
                </div>
              </div>

              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">학력 사항</div>
                <div class="card-body">
                  <div class="form-group">
                    <select class="form-select" name="education" id="education">
                      <option selected disabled>학력 사항을 선택해주세요</option>
                      <option value="초졸">초졸</option>
                      <option value="중졸">중졸</option>
                      <option value="고졸">고졸</option>
                      <option value="대졸">대졸</option>
                      <option value="대학원 이상">대학원 이상</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">경력 사항</div>
                <div class="card-body">
                  <div class="form-group">
                    <select class="form-select" name="career" id="career">
                      <option selected disabled>경력 사항을 선택해주세요</option>
                      <option value="신입">신입</option>
                      <option value="1년차 미만">1년차 미만</option>
                      <option value="1년">1년</option>
                      <option value="2년">2년</option>
                      <option value="3년">3년</option>
                      <option value="4년">4년</option>
                      <option value="5년">5년</option>
                      <option value="6년">6년</option>
                      <option value="7년">7년</option>
                      <option value="8년차 이상">8년차 이상</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">보유 기술</div>
                <div class="card-body">
                  <div class="form-group">
                    <select class="form-select" name="skillName1" id="skillName1">
                      <option selected disabled>보유 기술을 선택해주세요</option>
                      <option value="Java">Java</option>
                      <option value="JavaScript">JavaScript</option>
                      <option value="Spring">Spring</option>
                      <option value="HTML/CSS">HTML/CSS</option>
                      <option value="jQuery">jQuery</option>
                      <option value="JSP">JSP</option>
                      <option value="Vue.js">Vue.js</option>
                      <option value="Oracle">Oracle</option>
                      <option value="MySQL">MySQL</option>
                      <option value="React">React</option>
                    </select>
                    <select class="form-select" name="skillName2" id="skillName2">
                      <option selected disabled>보유 기술을 선택해주세요</option>
                      <option value="Java">Java</option>
                      <option value="JavaScript">JavaScript</option>
                      <option value="Spring">Spring</option>
                      <option value="HTML/CSS">HTML/CSS</option>
                      <option value="jQuery">jQuery</option>
                      <option value="JSP">JSP</option>
                      <option value="Vue.js">Vue.js</option>
                      <option value="Oracle">Oracle</option>
                      <option value="MySQL">MySQL</option>
                      <option value="React">React</option>
                    </select>
                    <select class="form-select" name="skillName3" id="skillName3">
                      <option selected disabled>보유 기술을 선택해주세요</option>
                      <option value="Java">Java</option>
                      <option value="JavaScript">JavaScript</option>
                      <option value="Spring">Spring</option>
                      <option value="HTML/CSS">HTML/CSS</option>
                      <option value="jQuery">jQuery</option>
                      <option value="JSP">JSP</option>
                      <option value="Vue.js">Vue.js</option>
                      <option value="Oracle">Oracle</option>
                      <option value="MySQL">MySQL</option>
                      <option value="React">React</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">자기소개서</div>
                <div class="card-body">
                  <div class="form-group">
                    <!-- <label for="exampleTextarea" class="form-label mt-4">자기소개서</label>
                          <hr> -->
                    <textarea class="form-control" name="content" id="content" rows="3"></textarea>
                  </div>
                </div>
              </div>

              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">링크</div>
                <div class="card-body">
                  <div class="form-group">
                    <input type="text" name="link" id="link" class="form-control">
                  </div>
                </div>
              </div>


              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">제목</div>
                <div class="card-body">
                  <div class="form-group">
                    <div class="form-group">
                      <input type="text" name="title" id="title" class="form-control">
                    </div>
                  </div>
                </div>
              </div>

              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">이력서 공개 여부</div>
                <div class="card-body">
                  <fieldset class="form-group">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="state" id="state" value=1 checked="">
                      <label class="form-check-label" for="optionsRadios1">
                        공개
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="state" id="state" value="0">
                      <label class="form-check-label" for="optionsRadios2">
                        비공개
                      </label>
                    </div>
                  </fieldset>
                </div>
              </div>
            </div>

            <div class="col-2 p-6">
              <div id="rButton">
                <br>
                <div class="row p-1">
                  <button type="button" class="btn btn-success w-70">미리보기</button>
                </div>
                <div class="row p-1">
                  <button type="button" class="btn btn-success w-70">임시 저장</button>
                </div>
                <div class="row p-1">
                  <button onclick="writeResume()" type="button" class="btn btn-success w-70">이력서 저장</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>

    <script>

      function writeResume() {
        let data = {
          title: $("#title").val(),
          content: $("#content").val(),
          education: $("#education").val(),
          career: $("#career").val(),
          skillName1: $("#skillName1").val(),
          link: $("#link").val(),
          state: $("#state").val()
        };

        $.ajax({
          type: "post",
          url: "/user/resume/write",
          data: JSON.stringify(data),
          contentType: "application/json; charset=utf-8", // 바디데이터가 뭔지 알려줌
          dataType: "json" // default : 응답의 mime 타입으로 유추함
        }).done((res) => { // 20X 일때
          alert(res.msg);
          location.href = "/user/resume";
        }).fail((err) => { // 40X, 50X 일때
          alert(err.responseJSON.msg);
        });
      }

    </script>
    <%@ include file="../layout/footer.jsp" %>