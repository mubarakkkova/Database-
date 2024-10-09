-- Task 1
create database lab4;

-- Task 2
create table Warehouses (
	code integer,
	location varchar(255),
	capacity integer
);

create table Boxes (
	code char(4),
	contents varchar(255),
	value real,
	warehouse integer
);

-- Task 3
insert into warehouses values
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);

insert into boxes values
('0MN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);

-- Task 4
select * from warehouses;

-- Task 5
select * from boxes where value > 150;

-- Task 6
select distinct on (contents) * from boxes;

-- Task 7
select warehouse, count(*) as number_of_boxes from boxes group by warehouse;

-- Task 8
select warehouse, count(*) as number_of_boxes from boxes group by warehouse having count(*) > 2;

-- Task 9
insert into warehouses values (6, 'New York', 3);

-- Task 10
insert into boxes values ('H5RT', 'Papers', 200, 2);

-- Task 11
update boxes set value = value * 0.75 where code = (select distinct on (value) code from boxes order by value desc limit 1 offset 2);

-- Task 12
delete from boxes where value < 150;

-- Task 13
delete from boxes using warehouses where boxes.warehouse = warehouses.code and location = 'New York' returning *;