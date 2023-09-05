-- criação do banco de dados paro o cenário de E-commerce
create database ecommerce;
use ecommerce;

create table cliente(
	idCliente int auto_increment primary key,
	Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);
-- size = dimensão do produto
create table produto(
	IdProduto int auto_increment primary key,
    Pname varchar(10),
    classificacao boolean, 
    categoria enum('eletrônico','vestimenta','brinquedos','alimentos','moveis') not null,
    avaliacao float default 0,
    size varchar(10)
);

create table produtoPedido(
	IdPproduto int,
    IdPpedido int,
    ppQuantidade int default 1,
    ppStatus enum('disponivel','sem estoque') default 'disponivel',
primary key (IdPproduto, IdPpedido),
constraint fk_produto_vendedor foreign key (IdPproduto) references produto(IdProduto),
constraint fk_produto_produto foreign key (IdPedido) references pedido(IdPedido)
);

create table pedido(
	IdPedido int auto_increment primary key,
	IdCliente int, 
	Pstatus enum('cancelado','confirmado','em processamento') default 'em processamento',
	descricao varchar(255),
	Vfrete float default 10, 
    pagamento varchar(10),
constraint fk_pedido_cliente foreign key (IdCliente) references cliente(IdCliente)
);

create table localEstoque(
		IdLestoque int,
		IdLproduto int,
		LeLocal varchar(255) not null,
    primary key (IdLestoque, IdLproduto),
    constraint fk_produto_vendedor foreign key (IdLproduto) references produto(IdProduto),
    constraint fk_produto_produto foreign key (IdLestoque) references pedido(produtoVendedor)
    );

create table pagamento(
	IdCliente int,
    IdPagamento int,
    tipo enum('boleto','cartão','pix','a vista'),
    limite float,
    primary key (IdCliente, IdPagamento)
);

create table estoque(
	IdEstoque int auto_increment primary key,
    Elocal varchar(45),
    quantidade int default 0
);

create table fornecedor(
	IdFornecedor int auto_increment primary key,
    razaoSocial varchar(215) not null,
    CNPJ char(15) not null, 
    contato char(11) not null,
constraint unique_fornecedor unique (CNPJ)
);

create table produtoVendedor(
	IdProdvend int,
    IdProduto int,
    quantProd int default 1,
	primary key (IdProdvend, IdProduto),
	constraint fk_produto_vendedor foreign key (IdProdvend) references vendedor(IdVendedor),
    constraint fk_produto__produto foreign key (IdProduto) references produto (IdProduto)
);

create table vendedor(
	IdVendedor int auto_increment primary key,
    CNPJ char(15),
    CPF char(12),
    contato char(11) not null,
    razaoSocial varchar(215) not null,
    Vlocal varchar(45),
    nomeFantasia varchar(45),
constraint unique_CNPJ_vendedor unique (CNPJ),
constraint unique_CPF_vendedor unique (CPF)
);

--Criação de index dasafio SQL SPECIALIST

create database if not exists customer_management;
use customer_management;

create table if not exists customer(
       id_customer int auto_increment primary key,
       customer_name varchar(30),
       email varchar(30),
       cpf char(11),
       credit_card char(9),
       contact char(9),
       address varchar(30)
);
--Criação de index

create database if not exists customer_management;
use customer_management;

create table if not exists customer(
       id_customer int auto_increment primary key,
       customer_name varchar(30),
       email varchar(30),
       cpf char(11),
       credit_card char(9),
       contact char(9),
       address varchar(30)
);
--DESAFIO SQL SPECIALIST/2023 Criação de INDEX
create database if not exists customer_management;
use customer_management;

create table if not exists customer(
       id_customer int auto_increment primary key,
       customer_name varchar(30),
       email varchar(30),
       cpf char(11),
       credit_card char(9),
       contact char(9),
       address varchar(30)
);
--Criação de index
alter table customer_management.customer add index index_email(email); 
--Retorno do index
show index from customer;

--DESAFIO SQL SPECIALIST/2023 Criação de Procedure (INSERT)
delimiter \\
create procedure procedure_insert(
       in nome_p varchar(),
       in email_p varchar(),
       in senha_p varchar ()
)
begin
       if(lenght(senha_p)<10 and lenght(senha_p)>7)then
         insert into user(nome,email,senha,data_cadastro) values(nome_p,email_p,mds5(senha_p),row());
         select * from user;
       else
         select 'Fornece outra senha' as Message_error;
       end if;
end \\
delimiter ;

-- (UPDATE)

-- (DELETE)

--View
--Personalização de acesso
--User creation
use mysql;
show tables;
select * from user;

create user 'geral' @localhost identified by '123456789';
grant all privileges on testuser.view_ex to 'geral'@localhost;

show databases;
show tables from company_constraints;
use company_constraints;

create view employees_salary_27000_view as
       select concat(Fname, Minit, Lname) as Name, Salary, Dno as Dept_number from employee
       where Salary > 26999;
       
select * from employees_salary_27000_view;

create view employees_salary_view;
       select concat(Fnama, Minit, Lname) as Name, e.Dno as Departament, d.Dependendt_name as Dependent
       from employee e
       inner join dependent d on e.Ssn = d.Essn;
       
select * from employees_departament_view;

--Trigger
--Trigger tipo: before insert
delimiter \\
create trigger mgr_dept_check before insert on employee
for each row
  begin
    case new.dno
      when 1 then set new.super_ssn = 'valor';
      when 2 then set new.super_ssn = null;
      when 3 then set new.super_ssn = null;
      when 4 then set new.super_ssn = 'valor';
      when 5 then set new.super_ssn = 'valor';
    end case;
  end //
delimiter;

show triggers from company_constraints;
--Trigger tipo: after trigger
delimiter \\
create trigger null_value_check after insert on empolyee
for each row
    if(new.bdate is null) then 
           insert into user_messages(message, ssn) values('Update your bdate, please.', new.ssn);
    else
           insert into user_messages(message, ssn) values('Error', new.ssn);
    end if;
//
delimiter ;

--Trigger tipo: before update trigger
create trigger check_amount before insert on account
for each row 
  set @sum = @sum+new.amount;
  
  
set @sum = 0;
insert into account values ();

transactions
set @autocommit = 0;

START TRANSACTION
      select @orderNumbers:= max(orderNumbers)=1
      from orders;
      
      select @orderNumbers as Number;
