#Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. 
#O nome do Banco de dados deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais. 
#O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
#O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.
create database db_hortifruti;
use db_hortifruti;

# 1-Crie a tabela tb_categorias e determine pelo menos 2 atributos, 
#além da Chave Primária, relevantes para classificar os produtos.
create table tb_categorias (
id bigint auto_increment,
tipo varchar (100) not null,
estado varchar (100),
descricao varchar (255) not null,
primary key (id)
);

# 4-Insira 5 registros na tabela tb_categorias.
insert tb_categorias (tipo,estado,descricao) 
values ('fruta','madura','Hortaliças fruto - Aquelas em que se utiliza o fruto, verde ou maduro, todo ou em parte');
insert tb_categorias (tipo,estado,descricao) 
values ('fruta','verde','Hortaliças fruto - Aquelas em que se utiliza o fruto, verde ou maduro, todo ou em parte');
insert tb_categorias (tipo,estado,descricao) 
values ('legume','','Hortaliças tuberosas - Aquelas cujas partes utilizáveis desenvolvem-se dentro do solo');
insert tb_categorias (tipo,estado,descricao) 
values ('verdura','','Hortaliças tuberosas - Aquelas cujas partes utilizáveis desenvolvem-se dentro do solo');
insert tb_categorias (tipo,estado,descricao) 
values ('folha','','Hortaliças herbáceas - Aquelas cujas partes aproveitáveis situam-se acima do solo, sendo tenras e suculentas');


# 2-Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da hortifruti.
# 3-Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
create table tb_produtos (
id bigint auto_increment,
item varchar (100) not null,
nome_cientifico char(100) not null,
quantidade int not null,
valor int not null,
categorias_id bigint,
primary key (id),
foreign key (categorias_id) references tb_categorias (id)
);

# 5-Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira 
#para criar a relação com a tabela tb_categorias.
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('maça','Malus domesticus','2',50,1);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('banana','Musa spp','5',70,2);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('pinha','Annona squamosa','2',145,1);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('cenoura','Daucus carota','3',15,3);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('pimentão','Capsicum annuum','4',30,4);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('alface','Lactuca sativa','1',45,5);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('rúcula','Eruca vesicaria','2',75,5);
insert into tb_produtos (item,nome_cientifico,quantidade,valor,categorias_id) 
values ('cebola','Allium cepa','6',25,4);

# 6- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
select tb_produtos.item, tb_produtos.valor from tb_produtos where valor > 50;

# 7- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
select tb_produtos.item, tb_produtos.valor from tb_produtos where valor  > 50 and valor < 150;

# 8- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
select tb_produtos.item from tb_produtos where item like "%C%";

# 9- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos 
#com os dados da tabela tb_categorias.
select tb_produtos.item, tb_categorias.tipo from tb_produtos inner join tb_categorias 
on tb_categorias.id = tb_produtos.categorias_id;

# 10- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos
#com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
#(Exemplo: Todes os produtos que pertencem a categoria cosméticos).
select tb_produtos.item from tb_produtos inner join tb_categorias on tb_categorias.id = 5
and tb_produtos.categorias_id = 5;