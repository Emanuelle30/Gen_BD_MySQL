#Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados deverá ter o seguinte 
#nome db_farmacia_bem_estar. O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
#O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

create database db_farmacia_bem_estar;
use db_farmacia_bem_estar;

# 1-Crie a tabela tb_categorias e determine pelo menos 2 atributos, 
#além da Chave Primária, relevantes para classificar os produtos.

create table tb_categorias (
id bigint auto_increment,
item varchar (100) not null,
receita varchar (50),
primary key (id)
);

# 4-Insira 5 registros na tabela tb_categorias.

insert tb_categorias (item,receita) values ('medicamento','sim');
insert tb_categorias (item,receita)  values ('medicamento','não');
insert tb_categorias (item,receita)  values ('higiene','não');
insert tb_categorias (item,receita) values ('fitoterapêutico','não');
insert tb_categorias (item,receita)  values ('alimento ','não');


# 2-Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
# 3-Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.

create table tb_produtos (
id bigint auto_increment,
nome varchar (100) not null,
lugar_compra char(50) not null,
quantidade int not null,
valor int not null,
categorias_id bigint,
primary key (id),
foreign key (categorias_id) references tb_categorias (id)
);

# 5-Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira 
#para criar a relação com a tabela tb_categorias.

insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('captopril','balcão','2',20,1);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('paracetamol','prateleira','3',5,2);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('fralda','prateleira','1',70,3);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('creme dental','prateleira','4',15,3);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('maracugina','prateleira','2',80,4);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('lambedor','prateleira','2',35,4);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('balas valda','prateleira','5',5,5);
insert into tb_produtos (nome,lugar_compra,quantidade,valor,categorias_id) values ('balas gengibre','prateleira','1',3,5);

# 6- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
select tb_produtos.nome, tb_produtos.valor from tb_produtos where valor > 50;

# 7- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
select tb_produtos.nome, tb_produtos.valor from tb_produtos where valor  > 5 and valor < 60;

# 8- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
select tb_produtos.nome from tb_produtos where nome like "%C%";

# 9- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos 
#com os dados da tabela tb_categorias.
select tb_produtos.nome, tb_categorias.item from tb_produtos inner join tb_categorias 
on tb_categorias.id = tb_produtos.categorias_id;

# 10- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos
#com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
#(Exemplo: Todes os produtos que pertencem a categoria cosméticos).
select tb_produtos.nome from tb_produtos inner join tb_categorias on tb_categorias.id = 4
and tb_produtos.categorias_id = 4;