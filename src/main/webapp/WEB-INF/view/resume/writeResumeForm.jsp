<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <!-- d -->
    <div class="mx-auto width-53">

      <div class="container">
        <form action="/write" method="post">
          <div class="row">
            <div class="col-10">
              <fieldset>
                <br>
                <legend>이력서 작성</legend><br>
                <hr />
                <div class="card border-light mb-3" style="max-width: 40rem;">
                  <div class="card-header">기본 정보</div>
                  <div class="card-body">
                    <div class="form-group">
                      <label for="inputPhoto" class="form-label mt-1">프로필 사진</label>
                      <input type="image" name="photo" class="form-control" src="#" placeholder="Enter photo">
                    </div>
                    <div class="form-group">
                      <label for="inputName" class="form-label mt-1">이름</label>
                      <input type="text" name="name" class="form-control" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                      <label for="inputTel" class="form-label mt-1">번호</label>
                      <input type="tel" name="tel" class="form-control" placeholder="Enter tel">
                    </div>
                    <div class="form-group">
                      <label for="inputEmail" class="form-label mt-1">Email</label>
                      <input type="email" name="email" class="form-control" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                      <label for="inputAddress" class="form-label mt-1">주소</label>
                      <input type="text" name="userAddress" class="form-control" placeholder="Enter address">
                    </div>
                    <div class="form-group">
                      <label for="inputBirth" class="form-label mt-1">생년월일</label>
                      <input type="date" name="birth" class="form-control" placeholder="Enter birth">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="SelectEducation" class="form-label mt-4">학력 사항</label>
                  <hr>
                  <select class="form-select">
                    <option selected disabled>학력 사항을 선택해주세요</option>
                    <option>초졸</option>
                    <option>중졸</option>
                    <option>고졸</option>
                    <option>대졸</option>
                    <option>대학원 이상</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="SelectCareer" class="form-label mt-4">경력 사항</label>
                  <hr>
                  <select class="form-select">
                    <option selected disabled>경력 사항을 선택해주세요</option>
                    <option>신입</option>
                    <option>1년</option>
                    <option>2년</option>
                    <option>3년</option>
                    <option>4년</option>
                    <option>5년 이상</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleTextarea" class="form-label mt-4">자기소개서</label>
                  <hr>
                  <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                </div>
                <fieldset class="form-group">
                  <div class="mt-4">공개 여부</div>
                  <hr>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios1"
                      value="option1" checked="">
                    <label class="form-check-label" for="optionsRadios1">
                      공개
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2"
                      value="option2">
                    <label class="form-check-label" for="optionsRadios2">
                      비공개
                    </label>
                  </div>
                </fieldset>

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
                  <button type="submit" class="btn btn-success w-70">이력서 저장</button>
                </div>
              </div>
            </div>

          </div>
      </div>
      </form>
    </div>

    </div>

    <%@ include file="../layout/footer.jsp" %>