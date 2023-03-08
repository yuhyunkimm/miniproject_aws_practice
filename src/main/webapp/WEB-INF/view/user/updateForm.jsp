<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header-simple.jsp" %>

        <div style="display:flex;" class="my-5">
            <div class="mx-auto width-53 top-40">
        
                <div class="rounded-3 container border border-3 p-3 mt-5" style="width: 350px;">
                    <div class="form-group mb-3" style="text-align: center;">
        
                        <h4>개인 회원정보 수정</h4>
                    </div>
        
                    <div>
        
                        <div class="form-group mb-2">
                            <input type="password" name="password" class="form-control" placeholder="Enter password"
                                id="password">
                        </div>
        
                        <div class="form-group mb-2">
                            <input type="password" class="form-control" placeholder="Enter passwordCheck" id="passwordCheck">
                        </div>
        
                        <div class="form-group mb-2">
                            <input type="text" name="name" class="form-control" placeholder="Enter name" id="name"
                                value="${uDto.name}">
                        </div>
        
                        <div class="form-group mb-2">
                            <input type="date" name="birth" class="form-control" placeholder="Enter birth" id="birth"
                                value="${uDto.birth}">
                        </div>
        
                        <div class="form-group mb-2">
                            <input type="tel" name="tel" class="form-control" placeholder="Enter tel" id="tel"
                                value="${uDto.tel}">
                        </div>
                        <form name="form" id="form" method="post">
        
                            <input class="btn btn-outline-primary mb-2" type="button" onClick="goPopup();" value="도로명주소 검색">
                            <div id="list"></div>
                            <div id="callBackDiv">
                                <div class="form-group mb-4">
                                    <input class="form-control" type="text" id="address" readonly name="roadFullAddr"
                                        placeholder="${uDto.address}" />
                                        <input type="hidden"  id="siNm"  name="siNm" />
                                </div>
                            </div>
                        </form>
                        <div class="d-grid gap-2 mb-2">
                            <button onclick="updateUser(`${principal.userId}`)" class=" btn btn-primary">수정완료</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
        <script language="javascript">
            function goPopup() {
                var pop = window.open("/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
            }

            function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
                document.form.roadFullAddr.value = roadFullAddr;
                document.form.siNm.value = siNm;
                // document.form.sggNm.value = sggNm;
                // document.form.emdNm.value = emdNm;
            }

        </script>
        <script>
            // 회원 수정 update 버튼
            function updateUser(id) {
                let data = {
                    userId: id,
                    password: $("#password").val(),
                    name: $("#name").val(),
                    birth: $("#birth").val(),
                    tel: $("#tel").val(),
                    address: $("#siNm").val()
                };
                $.ajax({
                    type: "put",
                    url: "/user/update",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done((res) => {
                    alert(res.msg);
                    location.href = "/user/myhome";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>