use oficina;

insert into cliente (id_cliente,id_veiculo, nomeCli, telefoneCli, enderecoCli) values
	(45878963621, '2020123', 'George Souto', 31985654771, 'Rua Flor do Campo, 14, Centro'),
    (78458125000199, 2014456,'Siderurgica SA', 3138247885, 'Avenida das Industrias, 1007, Distrito'),
    (78945825811, 2019789,'Mary Ellen', 31987741147, 'Rua Lirio, 478, Centro');
    
select * from cliente;
    
insert into veiculo (id_veiculo, id_cliente, marca, modelo) values
	(2020123,45878963621, 'Volkswagen', 'Gol'),
    (2014456,78458125000199,'Volvo', 'FH'),
    (2019789,78945825811,'Fiat','Strada');
    
select * from veiculo;

insert into servico (id_servico, id_cliente, valor, desc_servico) values
	(44401,45878963621, 57.89, 'Troca de bateria'),
    (77781,78458125000199, sum(valor_os+valorPeca), 'Manutenção preventiva mensal'),
    (99941,78945825811, sum(valor_os+valorPeca), 'Troca de oléo');
    
select * from servico;
    
insert into ordemServico (id_os, id_servico, dt_emissao, valor_os, status_os, dt_conclusão) values
	(147,44401,'08-05-2022',57.89, 'finalizada','09-05-2022'),
    (145,77781,'03-08-2022',85.78, 'em andamento', null),
    (041,99941,'07-07-2022',10.90,'finalizada','07-07-2022');
    
select * from ordemServico;
    
insert into mecanico (id_mecanico, id_equipe, nomeMec, enderecoMec, especialidade) values
	(01,1,'Carlos Jr.','Rua dos Tubarões, 78, Centro', 'mecânico eletricista'),
    (02,2,'Roberto','Rua dos Tubarões, 88, Centro','mecânico de veículos pesados'),
    (03,1,'Vitor', 'Rua dos Coqueiros, 157, Centro','mecânico eletricista');
    
select * from mecanico;
    
insert into equipe (id_equipe, id_mecanico, id_servico) values
	(1,01,44401),
    (1,03,44401),
    (2,02,77781),
    (1,01,99941);
    
select * from equipe;    

insert into pecas (id_pecas, id_servico, desc_peca, quantidade, valorPeca) values
	(4,44401,'Bateria de carro Moura 60Ah 12V',1,358.05),
	(5,99941,'Óleo para motor especial', 1, 147.85),
	(6,77781,'Disco de freios para caminhão Volvo FH', 1, 900.17);
    
select * from pecas;
        
insert into pagamento (id_pag, id_cliente, valortotal, dt_pag, forma_pag) values
	(001,45878963621, sum(valor_os+valorPeca),'09-05-2022','à vista'),
    (002,78458125000199, sum(valor_os+valorPeca),null,'desconto em folha'),
    (003,78945825811, sum(valor_os+valorPeca),'07-07-2022','cartão');
    
select * from pagamento;

-- recuperar o serviço realizado para os clientes
select * from cliente c, servico s where c.id_cliente=s.id_cliente;

-- especificar os atributos que foram recuperados
select nomeCli,id_servico,status_os from cliente c, servico s where c.id_cliente=s.id_cliente;
-- ou
select concat(nomeCli) as cliente, id_servico as servico, status_os from cliente c, servico s where c.id_cliente=s.id_cliente;

-- agrupamento
select count(*) from cliente c, servico s where c.id_cliente=s.id_cliente group by id_cliente;

-- recuperar serviço prestado para o cliente Mary Allen
select id_cliente, id_servico from cliente c, servico s where c.id_cliente=s.id_cliente having '%Mary Allen%' order by nomeCli,desc_servico;

	
