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
    representative_name varchar not null,
    business_number varchar not null,
    photo varchar,
    -- employees int,
    -- establishment_date varchar,
    homepage varchar,
    created_at timestamp
);

create table resume_skill_tb (
    resume_skill_id int auto_increment primary key,
    resume_id int not null,
    skill varchar not null
);

create table jobs_tb (
    jobs_id int auto_increment primary key,
    title varchar not null,
    content longtext,
    position varchar not null,
    career varchar not null,
    education varchar not null,
    address varchar not null,
    end_date timestamp,
    comp_id int not null,
    -- homepage varchar,
    receipt varchar not null,
    created_at timestamp
);

create table required_skill_tb (
    required_skill_id int auto_increment primary key,
    jobs_id int not null,
    skill varchar not null

);

create table interest_tb (
    interest_id int auto_increment primary key,
    user_id int not null,
    interest_ct varchar not null
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
)