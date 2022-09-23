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

