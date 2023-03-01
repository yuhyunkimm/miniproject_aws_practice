<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- d -->
    <div class="mx-auto width-53 top-80">
      <div class="container">
        <form>
          <div class="row">
            <div class="col-9">
              <br>
              이력서 작성<br>
              <hr />
              <div class="card border-light mb-3" style="max-width: 40rem;">
                <div class="card-header">기본 정보</div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-3">
                      프로필 사진
                    </div>
                    <div class="col-9">
                      <p>이름 ${uDto.name}</p>
                      <p>번호 ${uDto.tel}</p>
                      <p>email ${uDto.email}</p>
                      <p>주소 ${uDto.Address}</p>
                      <p>생년월일 ${uDto.birth}</p>
                    </div>
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
                  <div class="row my-3 my-border">
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

            <div class="col-3 p-6">
              <div id="rButton">
                <br>
                <div class="row mb-2">
                  <button type="button" class="btn btn-success w-100">미리보기</button>
                </div>
                <div id="resume-render">
                <div id="resume-remove">
                  <div class="row mb-2" >
                    <button id="resume-${rDto.resumeId}"
                      onclick="saveTempResume(`${principal.userId}`,`${rDto.resumeId}`)" type="button"
                      class="btn btn-success w-100">임시 저장</button>
                  </div>
                  <div class="row mb-2">
                  <button onclick="writeResume(`${principal.userId}`,`${rDto.resumeId}`)" type="button"
                    class="btn btn-success w-100">이력서 저장</button>
                </div>

                </div>
                  
                </div>
                
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>

    <script>

      let resumeId;
      let userId;



      function saveTempResume(id, resume) {
        resumeId = resume;
        userId = id;

        let data = {
          title: $("#title").val(),
          content: $("#content").val(),
          education: $("#education").val(),
          career: $("#career").val(),
          skillList: skillValues,
          link: $("#link").val(),
          state: $("#state").val(),
          userId: id,
          resumeId: resume
        };

        //이력서 id가 있을 때
        if (resume > 0) {
          $.ajax({
            type: "put",
            url: "/user/resume/update",
            data: JSON.stringify(data),
            headers: {
              "content-type": "application/json; charset=utf-8"
            },
            dataType: "json"
          }).done((res) => {
            resumeId = res.data;
            alert('임시저장 완료!');
          }).fail((err) => {
            alert(err.responseJSON.msg);
          });

        } else {
          $.ajax({
            type: "post",
            url: "/user/resume/write",
            data: JSON.stringify(data),
            headers: {
              "content-type": "application/json; charset=utf-8"
            },
            dataType: "json"
          }).done((res) => {
            resumeId = res.data;
            console.log(resumeId);
            changeResume();
            alert('임시저장 완료!');
          }).fail((err) => {
            alert(err.responseJSON.msg);
          });
        }
      }

      function changeResume() {
        $('#resume-remove').remove();
        renderResume();
      }

      function renderResume() {
        let el = `
        <div id="resume-remove">
                  <div class="row mb-2" >
                    <button id="resume-`+resumeId+`"
                      onclick="saveTempResume(`+userId+`,`+resumeId+`)" type="button"
                      class="btn btn-success w-100">임시 저장</button>
                  </div>
                  <div class="row mb-2">
                  <button onclick="writeResume(`+userId+`,`+resumeId+`)" type="button"
                    class="btn btn-success w-100">이력서 저장</button>
                </div>
        `;

        $('#resume-render').append(el);
      }


      function writeResume(id, resume) {
        resumeId = resume;
        userId = id;

        let data = {
          title: $("#title").val(),
          content: $("#content").val(),
          education: $("#education").val(),
          career: $("#career").val(),
          skillList: skillValues,
          link: $("#link").val(),
          state: $("#state").val(),
          userId: id,
          resumeId: resume
        };
        
        if ( resume > 0){
          $.ajax({
            type: "put",
            url: "/user/resume/update",
            data: JSON.stringify(data),
            headers: {
              "content-type": "application/json; charset=utf-8"
            },
            dataType: "json"
          }).done((res) => {
            alert(res.msg);
            location.href = "/user/resume";
          }).fail((err) => {
            alert(err.responseJSON.msg);
          });

        }else{
        $.ajax({
          type: "post",
          url: "/user/resume/write",
          data: JSON.stringify(data),
          contentType: "application/json; charset=utf-8", 
          dataType: "json" 
        }).done((res) => { 
          alert(res.msg);
          location.href = "/user/resume";
        }).fail((err) => { 
          alert(err.responseJSON.msg);
        });
        }
      }

       function getCheckedValues(name) {
            var checkedValues = [];
            var checkboxes = document.getElementsByName(name);
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    checkedValues.push(checkboxes[i].value);
                }
            }
            return checkedValues;
        };

        let skillValues;

        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener('click', function () {
                skillValues = getCheckedValues("skill");
            })
        });

    </script>
    <%@ include file="../layout/footer.jsp" %>