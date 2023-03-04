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

insert into comp_tb (email, password, comp_name, representative_name, business_number, photo,  homepage, created_at)
values ('kakao@nate.com', '1234', '카카오(주)', '홍은택', '120-81-47521', '/images/kakao.png', 'www.kakao.com',now());
insert into comp_tb (email, password, comp_name, representative_name, business_number, photo,  homepage, created_at)
values ('naver@nate.com', '1234', '다이소', '안현민', '451-23-15631', '/images/daiso1.png', 'www.naver.com',now());
insert into comp_tb (email, password, comp_name, representative_name, business_number, photo,  homepage, created_at)
values ('samsung@nate.com', '1234', '삼성', '이재용', '111-22-33333', '/images/kakao.png', 'www.kakao.com',now());

insert into resume_skill_tb (resume_id, skill) values (1, 'Vue.js');
insert into resume_skill_tb (resume_id, skill) values (1, 'JavaScript');
insert into resume_skill_tb (resume_id, skill) values (1, 'HTML/CSS');
insert into resume_skill_tb (resume_id, skill) values (1, 'JavaScript');
insert into resume_skill_tb (resume_id, skill) values (1, 'Spring');
insert into resume_skill_tb (resume_id, skill) values (2, 'JavaScript');
insert into resume_skill_tb (resume_id, skill) values (2, 'HTML/CSS');
insert into resume_skill_tb (resume_id, skill) values (2, 'JavaScript');
insert into resume_skill_tb (resume_id, skill) values (2, 'Spring');
insert into resume_skill_tb (resume_id, skill) values (2, 'Oracle');
insert into resume_skill_tb (resume_id, skill) values (3, 'Spring');
insert into resume_skill_tb (resume_id, skill) values (3, 'React');

insert into required_skill_tb ( jobs_id, skill) values (1, 'Spring');
insert into required_skill_tb ( jobs_id, skill) values (1, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (1, 'HTML/CSS');
insert into required_skill_tb ( jobs_id, skill) values (1, 'jQuery');
insert into required_skill_tb ( jobs_id, skill) values (2, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (2, 'Oracle');
insert into required_skill_tb ( jobs_id, skill) values (2, 'React');
insert into required_skill_tb ( jobs_id, skill) values (2, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (3, 'Spring');
insert into required_skill_tb ( jobs_id, skill) values (3, 'Oracle');
insert into required_skill_tb ( jobs_id, skill) values (3, 'React');
insert into required_skill_tb ( jobs_id, skill) values (4, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (4, 'Spring');
insert into required_skill_tb ( jobs_id, skill) values (4, 'Oracle');
insert into required_skill_tb ( jobs_id, skill) values (4, 'React');
insert into required_skill_tb ( jobs_id, skill) values (5, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (5, 'Spring');
insert into required_skill_tb ( jobs_id, skill) values (5, 'Oracle');
insert into required_skill_tb ( jobs_id, skill) values (5, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (6, 'React');
insert into required_skill_tb ( jobs_id, skill) values (6, 'Oracle');
insert into required_skill_tb ( jobs_id, skill) values (6, 'JavaScript');
insert into required_skill_tb ( jobs_id, skill) values (6, 'Spring');

insert into jobs_tb (title, content, position, career, education, address, end_date, comp_id, receipt, created_at)
values ('백엔드 개발자 채용1' , '백엔드 개발자 채용하는 상세 내용1', '백엔드 개발자', '신입', '학력무관', '제주',  '2023-03-07', 1, '홈페이지 접수', now());
insert into jobs_tb (title, content, position, career, education, address, end_date, comp_id, receipt, created_at)
values ('백엔드 개발자 채용2' , '백엔드 개발자 채용하는 상세 내용2', '프로트엔드 개발자', '1년차 미만', '대졸', '서울', '2023-03-07', 2, '홈페이지 접수', now());
insert into jobs_tb (title, content, position, career, education, address, end_date, comp_id, receipt, created_at)
values ('백엔드 개발자 채용3' , '백엔드 개발자 채용하는 상세 내용3', '백엔드 개발자', '1년차', '대학원 이상', '서울', '2023-03-07', 1, '홈페이지 접수', now());
insert into jobs_tb (title, content, position, career, education, address, end_date, comp_id, receipt, created_at)
values ('백엔드 개발자 채용4' , '백엔드 개발자 채용하는 상세 내용4', '서버 개발자', '3년차', '학력무관', '제주', '2023-03-07', 1, '홈페이지 접수', now());
insert into jobs_tb (title, content, position, career, education, address, end_date, comp_id, receipt, created_at)
values ('백엔드 개발자 채용5' , '백엔드 개발자 채용하는 상세 내용5', '안드로이드 개발자', '신입', '학력무관', '제주', '2023-03-07', 1, '홈페이지 접수', now());
insert into jobs_tb (title, content, position, career, education, address,  end_date, comp_id, receipt, created_at)
values ('백엔드 개발자 채용6' , '백엔드 개발자 채용하는 상세 내용6', '안드로이드 개발자', '1년차', '학력무관', '제주', '2023-03-07', 1, '홈페이지 접수', now());


insert into interest_tb (user_id, interest_ct) values(1, '백엔드 개발자');
insert into interest_tb (user_id, interest_ct) values(1, '서버 개발자');
insert into interest_tb (user_id, interest_ct) values(2, '프론트엔드 개발자');
insert into interest_tb (user_id, interest_ct) values(2, '안드로이드 개발자');
insert into interest_tb (user_id, interest_ct) values(3, '백엔드 개발자');
insert into interest_tb (user_id, interest_ct) values(3, '안드로이드 개발자');

insert into resume_tb (user_id, title, content, education, career, link, state, created_at) 
values (1, '백엔드 이력서', '백엔드 이력서의 내용입니다.', '고졸', '신입', '블로그 주소', 1, now());

insert into resume_tb (user_id, title, content, education, career, link, state, created_at) 
values (1, '백엔드 이력서22', '백엔드 이력서의 내용입니다.', '고졸', '신입', '블로그 주소', 1, now());

insert into resume_tb (user_id, title, content, education, career, link, state, created_at) 
values (2, '백엔드 이력서33', '백엔드 이력서의 내용입니다.', '고졸', '신입', '블로그 주소', 1, now());

insert into resume_tb (user_id, title, content, education, career,  link, state, created_at) 
values (3, '백엔드 이력서44', '백엔드 이력서의 내용입니다.', '대졸', '2년차', '블로그 주소', 1, now());


insert into user_scrap_tb (user_id, jobs_id, created_at) values (1, 1, now());
insert into user_scrap_tb (user_id, jobs_id, created_at) values (1, 2, now());
insert into user_scrap_tb (user_id, jobs_id, created_at) values (1, 3, now());

insert into comp_scrap_tb (comp_id, resume_id, created_at) values (1, 1, now());
insert into comp_scrap_tb (comp_id, resume_id, created_at) values (1, 3, now());

insert into apply_tb (resume_id, jobs_id, state, created_at) values (1, 1, 0, now());
insert into apply_tb (resume_id, jobs_id, state, created_at) values (2, 2, 0, now());
insert into apply_tb (resume_id, jobs_id, state, created_at) values (3, 3, 0, now());
insert into apply_tb (resume_id, jobs_id, state, created_at) values (4, 4, 0, now());
insert into apply_tb (resume_id, jobs_id, state, created_at) values (1, 3, 0, now());
insert into apply_tb (resume_id, jobs_id, state, created_at) values (3, 2, 0, now());

insert into suggest_tb (jobs_id, resume_id, state, created_at) values (1, 1, 0, now());
insert into suggest_tb (jobs_id, resume_id, state, created_at) values (2, 3, 0, now());
insert into suggest_tb (jobs_id, resume_id, state, created_at) values (3, 2, 0, now());
insert into suggest_tb (jobs_id, resume_id, state, created_at) values (4, 1, 0, now());
insert into suggest_tb (jobs_id, resume_id, state, created_at) values (5, 3, 0, now());

commit;