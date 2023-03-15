create table user_tb (
    user_id int auto_increment primary key,
    email varchar(30) unique not null,
    password varchar(100) not null,
    name varchar(20) not null,
    birth varchar(10) not null,
    tel varchar(20) not null,
    photo varchar(100),
    address varchar(50),
    created_at timestamp
);


create table comp_tb (
    comp_id int auto_increment primary key,
    email varchar(30) unique not null,
    password varchar(100) not null,
    comp_name varchar(20) not null,
    representative_name varchar(20) not null,
    business_number varchar(20) not null,
    photo varchar(100),
    -- employees int,
    -- establishment_date varchar,
    homepage varchar(30),
    created_at timestamp
);


create table resume_skill_tb (
    resume_skill_id int auto_increment primary key,
    resume_id int not null,
    skill varchar(20) not null
);

create table jobs_tb (
    jobs_id int auto_increment primary key,
    title varchar(30) not null,
    content longtext,
    position varchar(20) not null,
    career varchar(20) not null,
    education varchar(10) not null,
    address varchar(50) not null,
    end_date timestamp,
    comp_id int not null,
    -- homepage varchar,
    receipt varchar(20) not null,
    created_at timestamp
);

create table required_skill_tb (
    required_skill_id int auto_increment primary key,
    jobs_id int not null,
    skill varchar(20) not null
);

create table interest_tb (
    interest_id int auto_increment primary key,
    user_id int not null,
    interest_ct varchar(20) not null
);

create table resume_tb (
    resume_id int auto_increment primary key,
    user_id int not null,
    title varchar(30) not null,
    content varchar(200),
    education varchar(20) not null,
    career varchar(20) not null,
    link varchar(30),
	state tinyint not null,
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
    state int not null,
    created_at timestamp
);

create table suggest_tb (
    suggest_id int auto_increment primary key,
    jobs_id int not null,
    resume_id int not null,
    state int not null,
    created_at timestamp
);

create table notify_tb(
    notify_id int auto_increment primary key,
    apply_id int,
    suggest_id int,
    state int not null,
    created_at timestamp
);