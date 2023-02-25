create table user_tb (
    user_id int auto_increment primary key,
    email varchar unique not null,
    password varchar not null,
    name varchar not null,
    birth varchar not null,
    tel varchar not null,
    photo varchar,
    address varchar,
    created_at timestamp
);

create table comp_tb (
    comp_id int auto_increment primary key,
    email varchar unique not null,
    password varchar not null,
    comp_name varchar not null,
    comp_address varchar not null,
    representative_name varchar not null,
    business_number varchar not null,
    tel varchar not null,
    photo varchar,
    employees int,
    establishment_date varchar,
    homepage varchar,
    created_at timestamp
);

create table user_skill_tb (
    user_skill_id int auto_increment primary key,
    user_id int not null,
    skill_name1 varchar,
    skill_name2 varchar,
    skill_name3 varchar
);

create table jobs_tb (
    jobs_id int auto_increment primary key,
    title varchar not null,
    content longtext,
    position varchar,
    career varchar not null,
    education varchar not null,
    address varchar not null,
    scrap_count int,
    end_date timestamp,
    comp_id int not null,
    homepage varchar,
    created_at timestamp
);

create table required_skill_tb (
    required_skill_id int auto_increment primary key,
    jobs_id int not null,
    skill_name1 varchar,
    skill_name2 varchar,
    skill_name3 varchar
);

create table interest_tb (
    interest_id int auto_increment primary key,
    user_id int not null,
    interest_ct1 varchar,
    interest_ct2 varchar,
    interest_ct3 varchar
);

create table resume_tb (
    resume_id int auto_increment primary key,
    user_id int not null,
    title varchar not null,
    content varchar,
    education varchar not null,
    career varchar not null,
    link varchar,
	state number(1) not null,
    created_at timestamp
);

create table user_scrap_tb (
    user_scrap_id int auto_increment primary key,
    user_id int not null,
    jobs_id int not null,
    created_at timestamp
);

create table comp_scrap_tb (
    comp_scrap_id int auto_increment primary key,
    comp_id int not null,
    resume_id int not null,
    created_at timestamp
);

create table apply_tb (
    apply_id int auto_increment primary key,
    resume_id int not null,
    jobs_id int not null,
    state varchar,
    created_at timestamp
);

create table suggest_tb (
    suggest_id int auto_increment primary key,
    jobs_id int not null,
    resume_id int not null,
    state varchar,
    created_at timestamp
);