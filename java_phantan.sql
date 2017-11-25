create schema `foodmanagement` ;
use foodmanagement

create table DISH_DIRECTORY (
id INT not null auto_increment,
name NVARCHAR(128) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP ,
del_flag INT not null default 0,
primary key (id)
);

create table DISH (
id INT not null auto_increment,
branch_id INT not null,
dish_directory_id INT not null,
description NVARCHAR (256) not null,
name NVARCHAR(128) not null,
img_url NVARCHAR(128) not null,
price DECIMAL(10,2) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;


create table BRANCH (
id INT not null auto_increment,
name  NVARCHAR(128) not null,
address NVARCHAR(128) not null,
directory_id INT not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table BRANCH_TABLE (
id INT not null auto_increment,
branch_id INT not null,
status INT not null,
name NVARCHAR(128) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;


create table ORDER_BILL (
id INT not null auto_increment,
customer_id INT not null,
branch_id INT not null,
status INT not null,  #1: da thanh toan, 0: chua thanh toan
order_type  INT not null, ### 1: tai quan, 2: giao di, 3: tong dai
sum_money DECIMAL(10,2) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table ORDER_DETAIL (
id INT not null auto_increment,
order_id INT not null,
dish_id INT not null,
quanlity INT not null,  
price DECIMAL(10,2) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table EMPLOYEE (
id INT not null auto_increment,
name NVARCHAR(128) not null,
address NVARCHAR(128) not null,
phone  NVARCHAR(128) not null,
salary DECIMAL(10,2) not null,
position NVARCHAR(128) not null, # Thu ngan, Giam doc, Nhan vien don ve sinh, Nhan vien phuc vu
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table TABLE_DETAIL (
id INT not null auto_increment,
customer_id INT not null,
table_id INT not null,  
time DATETIME not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table CUSTOMER (
id INT not null auto_increment,
name NVARCHAR(128) not null,
address NVARCHAR(128) not null,  
phone NVARCHAR(128) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table BRANCH_DIRECTORY (
id INT not null auto_increment,
name NVARCHAR(128) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table UNEXPECTED_COST (
id INT not null auto_increment,
content NVARCHAR(128) not null,
cost DECIMAL(10,2) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table MENU(
id INT not null auto_increment,
branch_id INT not null,
menu_name NVARCHAR(128) not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;

create table MENU_DETAIL(
id INT not null auto_increment,
menu_id INT not null,
id_dish INT not null,
created_at TIMESTAMP not null default CURRENT_TIMESTAMP(),
del_flag INT not null default 0,
primary key (id)
) ;


### select * from branch_directory
insert into branch_directory(name) values ('Quan 5');
insert into branch_directory(name) values ('Quan 1');
insert into branch_directory(name) values ('Quan Tan Binh');

### select * from branch
### drop table branch
insert into branch(name,address,directory_id) values ('Chi nhanh An Duong Vuong','271 An Duong Vuong, Phuong 3, Quan 5, Ho Chi Minh',1);
insert into branch(name,address,directory_id) values ('Chi nhanh Tran Binh Trong','271 Tran Binh Trong, Phuong 3, Quan 5, Ho Chi Minh',1);
insert into branch(name,address,directory_id) values ('Chi nhanh Nguyen Thi Minh Khai','271 An Duong Vuong, Phuong 3, Quan 1, Ho Chi Minh',2);
insert into branch(name,address,directory_id) values ('Chi nhanh Le Van Si','271 Le Van Si, Quan Tan Binh, Ho Chi Minh',3);
insert into branch(name,address,directory_id) values ('Chi nhanh Hung Vuong','271 Hung Vuoung, Phuong 3, Quan 1, Ho Chi Minh',2);


insert into branch_table(branch_id,status,name) values (1, 0, 'Ban 1');
insert into branch_table(branch_id,status,name) values (1, 0, 'Ban 2');
insert into branch_table(branch_id,status,name) values (1, 0, 'Ban 3');
insert into branch_table(branch_id,status,name) values (2, 0, 'Ban 1');
insert into branch_table(branch_id,status,name) values (2, 0, 'Ban 2');
insert into branch_table(branch_id,status,name) values (2, 0, 'Ban 3');
insert into branch_table(branch_id,status,name) values (3, 0, 'Ban 1');
insert into branch_table(branch_id,status,name) values (3, 0, 'Ban 2');
insert into branch_table(branch_id,status,name) values (3, 0, 'Ban 3');
insert into branch_table(branch_id,status,name) values (4, 0, 'Ban 1');
insert into branch_table(branch_id,status,name) values (4, 0, 'Ban 2');
insert into branch_table(branch_id,status,name) values (4, 0, 'Ban 3');
insert into branch_table(branch_id,status,name) values (5, 0, 'Ban 1');
insert into branch_table(branch_id,status,name) values (5, 0, 'Ban 2');
insert into branch_table(branch_id,status,name) values (5, 0, 'Ban 3');

insert into customer(name,address,phone) values ('Hien Ho', '271/4 An Duong Vuong, P3, Q5, HCM', '0964626301');
insert into customer(name,address,phone) values ('Duc Hai', '272/4 An Duong Vuong, P3, Q5, HCM', '0964626302');
insert into customer(name,address,phone) values ('Anh Tu', '273/4 An Duong Vuong, P3, Q5, HCM', '0964626303');
insert into customer(name,address,phone) values ('Quoc Trung', '271/4 An Duong Vuong, P3, Q5, HCM', '0964626304');
insert into customer(name,address,phone) values ('Nguyen Quan', '271/5 An Duong Vuong, P3, Q5, HCM', '0964626305');

insert into dish_directory(name) values ('Do an chay');
insert into dish_directory(name) values ('Do an man');
insert into dish_directory(name) values ('Do an ngot');

insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (1, 1, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Dau hu xao dau que1', 'Hinh1', 30000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (1, 2, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Canh chua1', 'Hinh1',25000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (1, 3, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Tra sua1', 'Hinh1',20000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (2, 1, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Dau hu xao dau que2', 'Hinh1', 30000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (2, 2, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Canh chua2', 'Hinh1',25000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (2, 3, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Tra sua2', 'Hinh1',20000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (3, 1, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Dau hu xao dau que3', 'Hinh1', 30000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (3, 2, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Canh chua3', 'Hinh1',25000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (3, 3, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Tra sua3', 'Hinh1',20000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (4, 1, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Dau hu xao dau que4', 'Hinh1', 30000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (4, 2, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Canh chua4', 'Hinh1',25000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (4, 3, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Tra sua4', 'Hinh1',20000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (5, 1, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Dau hu xao dau que5', 'Hinh1', 30000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (5, 2, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Canh chua5', 'Hinh1',25000);
insert into dish(branch_id, dish_directory_id, description, name, img_url, price) values (5, 3, 'However if I enter anything in it, then the response.jsp code is displayed? Please suggest changes in my code.', 'Tra sua5', 'Hinh1',20000);

insert into employee(name, address, phone, salary, position) values ('Hien Ho', '271/4 An Duong Vuong', '0964626302', 3000000, 'Thu ngan');
insert into employee(name, address, phone, salary, position) values ('Ngoc Lan', '271/4 An Duong Vuong', '0964626302', 3000000, 'Nhan vien phuc vu');
insert into employee(name, address, phone, salary, position) values ('Van  Trong', '271/4 An Duong Vuong', '0964626302', 3000000, 'Giam doc');
insert into employee(name, address, phone, salary, position) values ('Thao Dieu', '271/4 An Duong Vuong', '0964626302', 3000000, 'Thu ngan');
insert into employee(name, address, phone, salary, position) values ('Thai Nghiep', '271/4 An Duong Vuong', '0964626302', 3000000, 'Thu ngan');

insert into menu(branch_id, menu_name) values (1, 'Menu giang sinh');
insert into menu(branch_id, menu_name) values (1, 'Menu haloween');
insert into menu(branch_id, menu_name) values (1, 'Menu lab');
insert into menu(branch_id, menu_name) values (2, 'Menu giang ho');
insert into menu(branch_id, menu_name) values (2, 'Menu hien ho');
insert into menu(branch_id, menu_name) values (2, 'Menu hiep khach');
insert into menu(branch_id, menu_name) values (3, 'Menu ngay he');
insert into menu(branch_id, menu_name) values (3, 'Menu mua xuan');
insert into menu(branch_id, menu_name) values (3, 'Menu mua dong');
insert into menu(branch_id, menu_name) values (4, 'Menu mua le');
insert into menu(branch_id, menu_name) values (4, 'Menu cuoi nam');
insert into menu(branch_id, menu_name) values (4, 'Menu dau nam');
insert into menu(branch_id, menu_name) values (5, 'Menu hoi nhap');
insert into menu(branch_id, menu_name) values (5, 'Menu le phu nu');
insert into menu(branch_id, menu_name) values (5, 'Menu cuoi nam');


insert into menu_detail(menu_id, id_dish) values (1, 1);
insert into menu_detail(menu_id, id_dish) values (1, 2);
insert into menu_detail(menu_id, id_dish) values (1, 3);
insert into menu_detail(menu_id, id_dish) values (2, 1);
insert into menu_detail(menu_id, id_dish) values (2, 2);
insert into menu_detail(menu_id, id_dish) values (2, 3);
insert into menu_detail(menu_id, id_dish) values (3, 1);
insert into menu_detail(menu_id, id_dish) values (3, 2);
insert into menu_detail(menu_id, id_dish) values (3, 3);
insert into menu_detail(menu_id, id_dish) values (4, 4);
insert into menu_detail(menu_id, id_dish) values (4, 5);
insert into menu_detail(menu_id, id_dish) values (4, 6);
insert into menu_detail(menu_id, id_dish) values (5, 4);
insert into menu_detail(menu_id, id_dish) values (5, 5);
insert into menu_detail(menu_id, id_dish) values (5, 6);
insert into menu_detail(menu_id, id_dish) values (6, 4);
insert into menu_detail(menu_id, id_dish) values (6, 5);
insert into menu_detail(menu_id, id_dish) values (6, 6);
insert into menu_detail(menu_id, id_dish) values (7, 7);
insert into menu_detail(menu_id, id_dish) values (7, 8);
insert into menu_detail(menu_id, id_dish) values (7, 9);
insert into menu_detail(menu_id, id_dish) values (8, 7);
insert into menu_detail(menu_id, id_dish) values (8, 8);
insert into menu_detail(menu_id, id_dish) values (8, 9);
insert into menu_detail(menu_id, id_dish) values (9, 7);
insert into menu_detail(menu_id, id_dish) values (9, 8);
insert into menu_detail(menu_id, id_dish) values (9, 9);
insert into menu_detail(menu_id, id_dish) values (10, 10);
insert into menu_detail(menu_id, id_dish) values (10, 11);
insert into menu_detail(menu_id, id_dish) values (10, 12);

# 5cus, 5 branch
#status INT not null,  #1: da thanh toan, 0: chua thanh toan
#order_type  INT not null, ### 1: tai quan, 2: giao di, 3: tong dai

insert into order_bill(customer_id, branch_id, status, order_type, sum_money) values (1, 1, 0, 1, 30000);
insert into order_bill(customer_id, branch_id, status, order_type, sum_money) values (2, 2, 0, 2, 55000);
insert into order_bill(customer_id, branch_id, status, order_type, sum_money) values (3, 3, 0, 2, 25000);
insert into order_bill(customer_id, branch_id, status, order_type, sum_money) values (4, 4, 0, 3, 20000);
insert into order_bill(customer_id, branch_id, status, order_type, sum_money) values (5, 5, 0, 1, 20000);


insert into order_detail (order_id, dish_id, quanlity, price) values (1, 1, 1, 30000);
insert into order_detail (order_id, dish_id, quanlity, price) values (2, 1, 1, 30000);
insert into order_detail (order_id, dish_id, quanlity, price) values (2, 2, 1, 25000);
insert into order_detail (order_id, dish_id, quanlity, price) values (3, 11, 1, 25000);
insert into order_detail (order_id, dish_id, quanlity, price) values (4, 9, 1, 20000);
insert into order_detail (order_id, dish_id, quanlity, price) values (5, 15, 1, 20000);

insert into table_detail(customer_id, table_id, time) values (1, 1, '');
insert into table_detail(customer_id, table_id, time) values (5, 2, '');

insert into unexpected_cost(content, cost) values ('Nhap hang lan 1', 8000000);
insert into unexpected_cost(content, cost) values ('Nhap hang lan 2', 500000);
insert into unexpected_cost(content, cost) values ('Nhap hang lan 3', 6700000);
insert into unexpected_cost(content, cost) values ('Nhap hang lan 4', 5000000);
insert into unexpected_cost(content, cost) values ('Nhap hang lan 5', 3000000);



select * from dish_directory
