insert into user_tb (email, password, name, birth, tel, photo, address, created_at) 
values ('ssar@nate.com', '1234', 'ssar', '1994-12-14', '010-1234-1234', '/images/default_profile.png', '서울', now());
insert into user_tb (email, password, name, birth, tel, photo, address, created_at) 
values ('ssar1@nate.com', '1234', 'ssar1', '1994-02-22', '010-1234-1234', '/images/default_profile.png', '부산', now());
insert into user_tb (email, password, name, birth, tel, photo, address, created_at) 
values ('ssar2@nate.com', '1234', 'ssar2', '1994-04-21', '010-1234-1234', '/images/default_profile.png', '서울', now());
insert into user_tb (email, password, name, birth, tel, photo, address, created_at) 
values ('ssar3@nate.com', '1234', 'ssar3', '1994-03-17', '010-1234-1234', '/images/default_profile.png', '인천', now());
insert into user_tb (email, password, name, birth, tel, photo, address, created_at) 
values ('ssar4@nate.com', '1234', 'ssar4', '1994-10-23', '010-1234-1234', '/images/default_profile.png', '경기도', now());

insert into comp_tb (email, password, comp_name, comp_address, representative_name, business_number, tel, photo, employees, establishment_date, homepage, created_at)
values ('http://www.kakaocorp.com', '1234', '카카오(주)', '제주 제주시 첨단로', '홍은택', '120-81-47521', '1577-3321', '/images/kakao.png', 3600, '1999-01-01', 'www.kakao.com',now());
insert into comp_tb (email, password, comp_name, comp_address, representative_name, business_number, tel, photo, employees, establishment_date, homepage, created_at)
values ('http://www.namver.com', '1234', '네이버(주)', '경기도 성남시', '이해진', '451-23-15631', '1577-3321', '/images/kakao.png', 3600, '1999-06-12', 'www.naver.com',now());
insert into comp_tb (email, password, comp_name, comp_address, representative_name, business_number, tel, photo, employees, establishment_date, homepage, created_at)
values ('http://samsung.com', '1234', '삼성', '경기도 수원시', '이재용', '111-22-33333', '1577-3321', '/images/kakao.png', 3600, '1999-01-01', 'www.kakao.com',now());

insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (1, 'Vue.js', 'Java', 'React');
insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (2, 'JavaScript', 'Java', 'Oracle');
insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (3, 'HTML/CSS', 'Java', 'MySQL');
insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (4, 'JavaScript', 'jQuery', 'React');
insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (5, 'Spring', 'JavaScript', 'Oracle');
insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (6, 'Spring', 'Vue.js', 'MySQL');

insert into required_skill_tb ( jobs_id, skill_name1, skill_name2, skill_name3) values (1, 'Spring', 'jQuery', 'React');
insert into required_skill_tb ( jobs_id, skill_name1, skill_name2, skill_name3) values (2, 'JavaScript', 'Java', 'MySQL');
insert into required_skill_tb ( jobs_id, skill_name1, skill_name2, skill_name3) values (3, 'Spring', 'Java', 'Oracle');
insert into required_skill_tb ( jobs_id, skill_name1, skill_name2, skill_name3) values (4, 'Spring', 'Java', 'React');
insert into required_skill_tb ( jobs_id, skill_name1, skill_name2, skill_name3) values (5, 'HTML/CSS', 'Java', 'React');
insert into required_skill_tb ( jobs_id, skill_name1, skill_name2, skill_name3) values (6, 'JavaScript', 'Java', 'React');

insert into jobs_tb (title, content, position, career, education, address, scrap_count, end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용1' , '백엔드 개발자 채용하는 상세 내용1', '백엔드 개발자', '신입', '학력무관', '제주', 54,  '2023-03-07', 1, 'www.kakao.com', now());
insert into jobs_tb (title, content, position, career, education, address, scrap_count, end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용2' , '백엔드 개발자 채용하는 상세 내용2', '프로트엔드 개발자', '1년차 미만', '대졸', '서울', 54, '2023-03-07', 1, 'www.kakao.com', now());
insert into jobs_tb (title, content, position, career, education, address, scrap_count, end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용3' , '백엔드 개발자 채용하는 상세 내용3', '백엔드 개발자', '1년차', '대학원', '서울', 54, '2023-03-07', 1, 'www.kakao.com', now());
insert into jobs_tb (title, content, position, career, education, address, scrap_count, end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용4' , '백엔드 개발자 채용하는 상세 내용4', '서버 개발자', '3년차', '학력무관', '제주', 54, '2023-03-07', 1, 'www.kakao.com', now());
insert into jobs_tb (title, content, position, career, education, address, scrap_count, end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용5' , '백엔드 개발자 채용하는 상세 내용5', '안드로이드 개발자', '신입', '학력무관', '제주', 54, '2023-03-07', 1, 'www.kakao.com', now());
insert into jobs_tb (title, content, position, career, education, address, scrap_count,  end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용6' , '백엔드 개발자 채용하는 상세 내용6', '안드로이드 개발자', '1년차', '학력무관', '제주', 54, '2023-03-07', 1, 'www.kakao.com', now());


insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(1, '백엔드 개발자', 'Java', 'Spring');
insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(2, '서버 개발자', 'Java', 'Spring');
insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(3, '프론트엔드 개발자', 'Java', 'Spring');
insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(4, '안드로이드 개발자', 'Java', 'Spring');
insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(5, '백엔드 개발자', 'Java', 'Spring');
insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(6, '백엔드 개발자', 'Java', 'Spring');

insert into resume_tb (user_id, title, content, education, career, link, state, created_at) 
values (1, '벡엔드 이력서', '백엔드 이력서의 내용입니다.', '고졸', '신입', '블로그 주소', 1, now());
insert into resume_tb (user_id, title, content, education, career,  link, state, created_at) 
values (2, '벡엔드 이력서', '백엔드 이력서의 내용입니다.', '대졸', '2년차', '블로그 주소', 1, now());

insert into user_scrap_tb (user_scrap_id, user_id, jobs_id, created_at) values (1, 1, 1, now());

insert into comp_scrap_tb (comp_scrap_id, comp_id, resume_id, created_at) values (1, 1, 1, now());

insert into apply_tb (resume_id, jobs_id, state, created_at) values (1, 1, 1, now());

insert into suggest_tb (jobs_id, resume_id, state, created_at) values (1, 1, 1, now());

commit;