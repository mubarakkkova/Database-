-- 1
create database lab8;

-- 2
create table salesman (
    salesman_id integer primary key,
    name varchar(255),
    city varchar(255) default 'unknown',
    commission decimal(3, 2)
);


insert into salesman
values (5001, 'james hoog', 'new york', 0.15),
       (5002, 'nail knite', 'paris', 0.13),
       (5005, 'pit alex', 'london', 0.11),
       (5006, 'mc lyon', 'paris', 0.14),
       (5003, 'lauson hen', default, 0.12),
       (5007, 'paul adam', 'rome', 0.13);


create table customers (
    customer_id integer primary key,
    cust_name varchar(255),
    city varchar(255),
    grade integer,
    salesman_id integer,
    foreign key (salesman_id) references salesman(salesman_id)
);

insert into customers
values (3002, 'nick rimando', 'new york', 100, 5001),
       (3005, 'graham zusi', 'california', 200, 5002),
       (3001, 'brad guzan', 'london', default, 5005),
       (3004, 'fabian johns', 'paris', 300, 5006),
       (3007, 'brad davis', 'new york', 200, 5001),
       (3009, 'geoff camero', 'berlin', 100, 5003),
       (3008, 'julian green', 'london', 300, 5002);


create table orders (
    ord_no integer primary key,
    purch_amt decimal(10, 2),
    ord_date date,
    customer_id integer,
    salesman_id integer,
    foreign key (customer_id) references customers(customer_id),
    foreign key (salesman_id) references salesman(salesman_id)
);


insert into orders
values (70001, 150.5, '2012-10-05', 3005, 5002),
       (70009, 270.65, '2012-09-10', 3001, 5005),
       (70002, 65.26, '2012-10-05', 3002, 5001),
       (70004, 110.5, '2012-08-17', 3009, 5003),
       (70007, 948.5, '2012-09-10', 3005, 5002),
       (70005, 2400.6, '2012-07-27', 3007, 5001),
       (70008, 5760, '2012-09-10', 3002, 5001);

-- 3
create role junior_dev login;

-- 4
create view ny_salesman as
    select * from salesman
    where city = 'New York';
select * from ny_salesman;

-- 5
create view order_by_name as
    select o.ord_no, o.purch_amt, o.ord_date, c.cust_name, s.name as salesman_name
    from orders o
    join salesman s on o.salesman_id = s.salesman_id
    join customers c on o.customer_id = c.customer_id;
select * from order_by_name;

grant all privileges on order_by_name to junior_dev;

-- 6
create view high_grade_customers as
    select * from customers
    where grade = (select max(grade) from customers);
select * from high_grade_customers;

grant select on high_grade_customers to junior_dev;

-- 7
create view salesmans_in_cities as
    select count(*) as salesman_count, city
    from salesman
    group by city;
select * from salesmans_in_cities;

-- 8
create view salesman_with_multiple_cust as
    select s.salesman_id, s.name, count(c.customer_id) as customer_count
    from salesman s
    join customers c on s.salesman_id = c.salesman_id
    group by s.salesman_id, s.name
    having count(c.customer_id) > 1;
select * from salesman_with_multiple_cust;

-- 9
create role intern;
grant junior_dev to intern;

drop table salesman cascade;
drop table customers cascade;
drop table orders cascade;