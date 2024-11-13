create database lab7;

create table countries(
    country_id serial primary key,
    country_name varchar(50)
);

insert into countries(country_name)
values ('uzbekistan'), ('turkey'), ('kazakhstan'), ('china');

select * from countries;

create table departments(
    department_id serial primary key,
    department_name varchar(50),
    budget integer
);

insert into departments(department_name, budget)
values ('finance', 4000),
       ('human resources', 2000),
       ('sales', 6000);

select * from departments;

create table employees(
    employee_id serial primary key,
    employee_name varchar(50),
    employee_surname varchar(50),
    employee_salary integer,
    department_id integer references departments
);

insert into employees(employee_name, employee_surname, employee_salary, department_id)
values ('ayaulim', 'lashimova', 5000, 1),
       ('danelya', 'mubarakova', 7000, 2),
       ('dias', 'alimkulov', 6000, 3);

select * from employees;

-- 1 создание индекса по имени страны для запроса select * from countries where name = 'string'
create index index_country_name on countries(country_name);

-- 2 создание индекса для запроса с именем и фамилией сотрудника
create index index_employee_full_name on employees(employee_name, employee_surname);

-- 3 создание индекса по зарплате сотрудника без уникальности
create index index_employees_salary on employees(employee_salary);

-- 4 индекс по подстроке имени первые 4 символа
create index employees_sub_name on employees(substring(employee_name from 1 for 4));

-- 5 индексы для запросов, включающих поиск по department_id и employee_salary
create index index_depts_budg_salary on employees(department_id, employee_salary);
create index index_depts_budg on departments(budget);

drop table countries cascade;
drop table departments cascade;
drop table employees cascade;