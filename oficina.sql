-- criação do banco de dados para o cenário de oficina
create database oficina;
use oficina;

create table cliente(
	CPF int auto_increment primary key,
    CNPJ int auto_increment,
    nomeCli VARCHAR(45),
    telefoneCli char(11),
    enderecoCli varchar(45),
constraint unique_cpf_cliente unique (CPF)
);

create table pagamento(
	id_pag int auto_increment primary key,
    id_cliente int auto_increment,
    valortotal float,
    dt_pag date,
    forma_pag enum('à vista','cartão','pix') not null
);

create table veiculo(
	id_veiculo int auto_increment primary key,
    marca varchar(15),
    modelo varchar(50)
);

create table servico(
	id_servico int auto_increment primary key,
    valor float,
    desc_servico varchar(150)
);

create table ordemServico(
	id_os int auto_increment primary key,
    dt_emissao date,
    valor_os float,
    status_os enum('finalizada','iniciada','em andamento','aguradando confirmação') default 'aguardando confirmação',
    dt_conclusao date
);

create table mecanico(
	id_mecanico int auto_increment primary key,
    nomeMec varchar(45),
    enderecoMec varchar(45),
    especialidade varchar(45),
constraint unique_id_mecanico unique (id_mecanico)
);

create table equipe(
	id_equipe int,
    id_mecanico int,
primary key (id_equipe, id_mecanico),
constraint fk_equipe_mecanico foreign key (id_mecanico) references mecanico (id_mecanico)
);

create table pecas(
	id_peca int auto_increment primary key,
    desc_peca varchar(150),
    quantidade int default 0, 
    valorPeca float
);
    
    
    