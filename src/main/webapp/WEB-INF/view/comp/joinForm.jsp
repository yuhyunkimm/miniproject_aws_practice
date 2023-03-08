<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header-simple.jsp" %>
<div style="display:flex;" class="my-5">
    <div class="mx-auto width-53 top-40">
        <div class="rounded-3 container all-form border border-3 p-3 mt-5" style="width: 400px;">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item fs-4">
                    <a class="nav-link text-muted" href="/comp/login">기업로그인</a>
                </li>
                <li class="nav-item fs-4">
                    <a class="nav-link" href="/comp/join">기업회원가입</a>
                </li>
            </ul>

            <form action="/comp/join" method="post" onsubmit="return valid()">
                <div class="d-flex form-group mt-2 mb-2">
                    <input type="email" name="email" class="form-control" placeholder="Enter email" id="email">
                    <button type="button" class="badge bg-secondary ms-2" onclick="emailCheckBtn()">중복확인</button>
                </div>

                <div class="form-group mb-2">
                    <input type="password" name="password" class="form-control" placeholder="Enter password"
                        id="password">
                </div>

                <div class="form-group mb-2">
                    <input type="password" class="form-control" placeholder="Enter passwordCheck" id="passwordCheck">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="compName" class="form-control" placeholder="Enter companyName"
                        id="compName">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="representativeName" class="form-control"
                        placeholder="Enter representativeName" id="representativeName">
                </div>

                <div class="form-group mb-2">
                    <input type="text" name="businessNumber" class="form-control" placeholder="Enter businessNumber"
                        id="businessNumber">
                </div>



                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="flexCheckChecked1">
                    <label class="form-check-label" for="flexCheckChecked">
                        (필수) 이용약관 동의
                    </label>
                </div>
                <div class="form-check mb-4">
                    <input class="form-check-input" type="checkbox" id="flexCheckChecked2">
                    <label class="form-check-label" for="flexCheckChecked">
                        (필수) 개인정보 수집 및 이용 동의
                    </label>
                </div>

                <div class="d-grid gap-2 mb-4">
                    <input id="button" class=" btn btn-primary" type="submit" value="회원가입" onclick="submitForm()">
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script>
    // 회원가입 버튼 클릭 이벤트
    function submitForm() {
        let agreeCheckbox1 = document.getElementById("flexCheckChecked1");
        let agreeCheckbox2 = document.getElementById("flexCheckChecked2");
        if (!agreeCheckbox1.checked || !agreeCheckbox2.checked) {
            alert("약관에 동의해주세요.");
            return;
        }
    }

    let submitCheck = false;

    function valid() {
        if (submitCheck) { // true 가 되면 회원가입 버튼 동작함
            return true;
        } else {
            alert('중복확인이 필요합니다.');
            // 회원가입 버튼누르면 뜬다
            return false; // 회원가입 버튼을 막는다
        }
    }



    // 이메일 중복 확인 버튼
    function emailCheckBtn() {
        let email1 = $("#email").val();
        $.ajax({
            type: "get",
            url: "/user/emailCheck?email=" + email1,
            datatype: "json"
        }).done((res) => {
            if (res.code === 1) {
                alert(res.msg);
                submitCheck = true; // 중복 체크 완료
            } else {
                alert(res.msg);
                submitCheck = false;
            }
        }).fail((err) => {
            alert(err.responseJSON.msg);
        });
    }
</script>
<%@ include file="../layout/footer.jsp" %>