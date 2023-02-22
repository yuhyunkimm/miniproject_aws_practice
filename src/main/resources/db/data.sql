insert into user_tb (email, password, name, birth, tel, photo, user_address, created_at) 
values ('ssar@nate.com', '1234', '박인우', '1994-03-17', '010-1234-1234', '/images/default_profile.png', '연제구', now());

insert into comp_tb (email, password, comp_name, comp_address, representative_name, business_number, tel, photo, employees, establishment_date, homepage, created_at)
values ('http://www.kakaocorp.com', '1234', '카카오(주)', '제주 제주시 첨단로', '홍은택', '120-81-47521', '1577-3321', '/images/default_profile.png', 3600, '1999-01-01', 'www.kakao.com',now());

insert into user_skill_tb (user_id, skill_name1, skill_name2, skill_name3) values (1, '스프링', '자바', '리액트');

insert into required_skill_tb (required_skill_id, comp_id, skill_name1, skill_name2, skill_name3) values (1, 1, '스프링', '자바', '리액트');

insert into jobs_tb (title, content, position, career, education, scrap_count, required_skill_id, end_date, comp_id, homepage, created_at)
values ('백엔드 개발자 채용' , '백엔드 개발자 채용하는 상세 내용', '백엔드', '신입', '학력무관', 54, 1, '2023-03-07', 1, 'www.kakao.com', now());

insert into interest_tb (user_id, interest_ct1, interest_ct2, interest_ct3) values(1, '백엔드', '자바', '스프링');

insert into resume_tb (user_id, title, content, education, career, user_skill_id, link, state, created_at) 
values (1, '벡엔드 이력서', '백엔드 이력서의 내용입니다.', '고졸', '신입', 1, '블로그 주소', 1, now());

insert into user_scrap_tb (user_scrap_id, user_id, jobs_id, created_at) values (1, 1, 1, now());

insert into comp_scrap_tb (comp_scrap_id, comp_id, resume_id, created_at) values (1, 1, 1, now());

insert into apply_tb (resume_id, jobs_id, state, created_at) values (1, 1, 1, now());

insert into suggest_tb (jobs_id, resume_id, state, created_at) values (1, 1, 1, now());

commit;