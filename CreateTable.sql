SQL> create table customers(
  2  customer_id number primary key,
  3  name varchar(50) not null,
  4  region varchar(50) not null,
  5  join_date date
  6  );

Table created.

SQL> create table products(
  2  product_id number primary key,
  3  name varchar(50) not null,
  4  category varchar(50) not null,
  5  price number(10,2)
  6  );

Table created.

SQL> create table transactions(
  2  transaction_id number primary key,
  3  customer_id number not null,
  4  product_id number not null,
  5  sale_date date not null,
  6  quantity number not null,
  7  amount number(10,2) not null,
  8  constraint fk_customer
  9  foreign key(customer_id) references customers(customer_id),
 10  constraint fk_product
 11  foreign key(product_id) references products(product_id)
 12  );

Table created.