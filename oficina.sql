-- criação do banco de dados para o cenário de oficina
create database oficina;
use oficina;

create table cliente(
	id_cliente int not null auto_increment primary key,
    id_veiculo int not null,
    nomeCli VARCHAR(45),
    telefoneCli char(11),
    enderecoCli varchar(45),
constraint unique_id_cliente unique (id_cliente),
constraint fk_cliente_veiculo foreign key (id_veiculo) references veiculo (id_veiculo)
);

create table pagamento(
	id_pag int auto_increment primary key,
    id_cliente int not null,
    valortotal float,
    dt_pag date,
    forma_pag enum('à vista','cartão','pix','desconto em folha') not null,
constraint fk_pagamento_cliente foreign key (id_cliente) references cliente (id_cliente)
);

create table veiculo(
	id_veiculo int not null auto_increment primary key,
    id_cliente int not null,
    marca varchar(15),
    modelo varchar(50),
constraint fk_veiculo_cliente foreign key (id_cliente) references cliente (id_cliente)
);

create table servico(
	id_servico int not null auto_increment primary key,
    id_cliente int not null,
    valor float,
    desc_servico varchar(150),
constraint fk_servico_cliente foreign key (id_cliente) references cliente (id_cliente)
);

create table ordemServico(
	id_os int not null auto_increment primary key,
    id_serviço int not null,
    dt_emissao date,
    valor_os float,
    status_os enum('finalizada','iniciada','em andamento','aguradando confirmação') default 'aguardando confirmação',
    dt_conclusao date,
constraint fk_orderServico_servico foreign key (id_servico) references servico (id_servico)
);

create table mecanico(
	id_mecanico int not null auto_increment primary key,
    id_equipe int not null,
    nomeMec varchar(45),
    enderecoMec varchar(45),
    especialidade varchar(45),
constraint unique_id_mecanico unique (id_mecanico)
);

create table equipe(
	id_equipe int not null,
    id_mecanico int not null,
    id_servico int not null,
primary key (id_equipe, id_mecanico, id_servico),
constraint fk_equipe_mecanico foreign key (id_mecanico) references mecanico (id_mecanico),
constraint fk_equipe_servico foreign key (id_servico) references servico (id_servico)
);

create table pecas(
	id_peca int auto_increment primary key,
    id_servico int not null,
    desc_peca varchar(150),
    quantidade int default 0, 
    valorPeca float
);
    
    
    