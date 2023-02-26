package shop.mtcoding.project.util;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import shop.mtcoding.project.model.Comp;
import shop.mtcoding.project.model.User;

public class MockSession {
    
    public static void mockComp(HttpSession session){
        Comp mockcomp = new Comp(
            1,
            "kakao@kakao.com",
            "1234",
            "카카오(주)",
            "제주 제주시 첨단로",
            "홍은택",
            "120-81-47521",
            "1577-3321",
            "/images/kakao.png",
            3600,
            "1995-02-16",
            "http://www.kakaocorp.com",
            new Timestamp(System.currentTimeMillis()));
        session.setAttribute("principal", mockcomp);
    }

    public static void mockUser(HttpSession session){
        User mockUser = new User(
            1,
            "ssar@nate.com",
            "1234",
            "ssar",
            "2000-01-01",
            "010-1234-1234",
            "/images/default_profile.png",
            "부산시 부산진구",
            new Timestamp(System.currentTimeMillis()));
        session.setAttribute("principal", mockUser);
    }
}
    