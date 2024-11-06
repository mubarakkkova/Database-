--1
create database lab6;

--2
create table locations (
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments (
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);


create table employees (
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

insert into locations (street_address, postal_code, city, state_province)
values
    ('A St', '12345', 'New York', 'NY'),
    ('B St', '54321', 'Almaty', 'AL'),
    ('C St', '55112', 'Shanghai', 'SH');

insert into departments (department_id, department_name, budget, location_id)
values
    (80, 'HR', 100000, 1),
    (40, 'Engineering', 250000, 2),
    (20, 'Marketing', 150000, 3);

insert into departments (department_id, department_name, budget, location_id)
values
    (50, 'PR', 130000, 1);
INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('A', '1', 'A1@example.com', '555-1234', 60000, 80),
    ('B', '2', 'B2@example.com', '555-5678', 75000, 40),
    ('C', '3', 'C3@example.com', '555-8765', 55000, 20);

INSERT INTO employees (first_name, last_name, email, phone_number, salary)
VALUES
    ('D', '4', 'D4@example.com', '555-1114', 40000 );

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('E', '5', 'E5@example.com', '555-1214', 90000, 80);

--3
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
from employees join departments on departments.department_id = employees.department_id;

--4
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
from employees join departments on departments.department_id = employees.department_id where employees.department_id = 40 or employees.department_id = 80;

--5
select employees.first_name, employees.last_name, employees.department_id, locations.city, locations.state_province
from employees left join departments  on departments.department_id = employees.department_id left join locations  on locations.location_id = departments.location_id;


--6
select departments.department_id, departments.department_name, count(employees)
from departments left join employees  on departments.department_id = employees.department_id group by departments.department_id;

select departments.department_id, departments.department_name, employees.employee_id, employees.first_name, employees.last_name
from departments left join employees  on departments.department_id = employees.department_id;

--7
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
from employees left join departments on departments.department_id = employees.department_id;