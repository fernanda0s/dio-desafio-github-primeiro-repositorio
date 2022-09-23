use ecommerce;

show tables;
-- IdCliente, Fnome, Minit, Lnome, CPF, endereco
insert into Cliente (Fname, Minit, Lname, CPF, Adress)
	values ('Maria','M','Silva',123456789,'rua silva de prata 29, Carangola - cidade das flores'),
		   ('Matheus','O','Pimentel',987654321,'rua alameda 289, Centro - cidade das flores'),
           ('Ricardo','F','Silva', 876543219,'avenida alameda vinha, 1009 , Centro - cidade das flores'),
           ('Julia','S','França',765432189,'rua laranjeira 861, Centro -  cidade das flores'),
           ('Roberta','G','Assis', 654321789,'avenida koller, 19, Centro - cidade das flores'),
           ('Isabela','M','Cruz', 543216789,'rua alameda das flores, Centro - cidade das flores');
           
-- IdProduto, Pnome, classificacao boolean, categoria ('eletrônico','vestimenta','brinquedos','alimentos','moveis') avaliacao, size
insert into produto (Pnome, calssificacao, categoria, avalizacao, size) values
					('fone de ouvido', false, 'eletronico','4',null),
                    ('barbie', true, 'brinquedos','3',null),
                    ('body carters',true, 'vestimenta','5', null),
                    ('microfone vedo - youtuber',false,'eletronico','4',null),
                    ('sofá retrátil',false,'móveis','3x57x80');
                    
select * from clients;
select * from product;
delete from pedido where IdPedidoCliente in (1,2,3,4);
-- IdPedido, IdPedidoCliente, pedidoStatus, pedidoDesc, Vfrete,pagamento
insert into  pedido (IdPedidoCliente, pedidoStatus, pedidoDesc, Vfrete, pagamento) values
					(1,default,'compra via aplicativo',default,1),
                    (2,default,'compra via aplicativo',50,0),
                    (3,'conirmado',default,default,1),
                    (4,default,'compra via web site',150,0);
                    
-- IdPproduto,IdPpedido, ppQuantidade,ppStatus
select * from pedido;
insert into produtoPedido (IdPproduto,IdPpedido, ppQuantidade,ppStatus) values
						  (1,5,2,null),
                          (2,5,1,null),
                          (3,6,1,null);
                          
-- localEstoque,quantidade
insert into produtoEstoque (localEstoque,quantidade) values
						   ('rio de janeiro',1000),
                           ('rio de janeiro',500),
                           ('são paulo',10),
                           ('são paulo',100),
                           ('são paulo',10),
                           ('brasília',60);
                           
insert into estoqueLocal (IdLproduto,IdLestoque,localização) values
						 (1,2,'RJ'),
                         (2,6,'GO');
                         
insert into fornecedor (razaoSocial,CNPJ,contato) values
					   ('Almeida e filhos',123456789123456,'3138265759'),
                       ('Eletronicos silva',987654321987654,'3138274847'),
                       ('Eletronicos velma', 654321987654147,'3138255963');
                       
select * from fornecedor;

insert into produtoFornecedor (IdPfornecedor, IdPfproduto,quantidade) values
							  (1,1,500),
                              (1,22,400),
                              (2,4,633),
                              (3,3,5),
                              (2,5,10);
                              
insert into vendedor (razaoSocial,nomeFantasia,CNPJ,CPF,localizacao,contato) values
					 ('Tech eletronic', null, 123456789101112, null,'rio de janeiro',31382658777),
                     ('Boutique durgas', null, null, 123456783221457, 'rio de janeiro', 31965668958),
                     ('Kids wolrd',null,456987125256615,null,'são paulo',31989784587);
                     
select * from vendedor;
insert into produtoVendedor (IdPvendedor, IdPproduto, prodQuantidade) values
							(1,6,80),
                            (2,7,10);
     
select * from produtoVendedor;

-- recuperar número de clientes
select count(*) from clientes;

-- recuperar os pedidos feitos por eles
select * from clientes c, pedido p where c.IdCliente = IdPedidoCliente;
-- especificar atributos recuperados
select Fname,Lname,IdPedido,pedidoStatus from cliente c, pedido p where c.IdCliente = IdPedidoCliente;
-- deixar visualmente melhor
select concat(Fnome,' ',Lnome) as client, idPedido as request, pedidoStatus as status from cliente c, pedido p where c.IdCliente = IdPedidoCliente;

insert into pedido (IdPedidoCliente, pedidoStatus, pedidoDesc, Vfrete, pagaento) values
				   (2, default,'compra via aplicativo',null,1);
                   
-- agrupamento
select count(*) from cliente c, pedido p
			where c.IdCliente = IdPedidoCliente
            
-- recuperar quantos pedidos foram realizados pelos clientes
select c.IdCliente, Fnome count(*) as numero_de_pedidos from cliente c 
						inner join pedido p on c.IdCliente =  p.IdPedidoCliente
					    inner join produto p on p.IdPpedido = p.IdPedido
		 group by IdCliente,
         having count > 0,
         order by IdCliente;
         
-- recuperação de pedido com produto associado
select * from cliente c
				inner join pedido p on c.IdCliente - p.IdPedidoCliente
				inner join produtoPedido p on p.IdPpedido = p.IdPedido
		group by IdCliente;