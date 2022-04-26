#Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte 
#nome db_pizzaria_legal. O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
#O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas.

create database db_pizzaria_legal;
use db_pizzaria_legal;

# 1-Crie a tabela tb_categorias e determine pelo menos 2 atributos, 
#além da Chave Primária, relevantes para classificar as pizzas.

create table tb_categorias (
id bigint auto_increment,
tipo_pizza varchar (100) not null,
borda varchar (50),
massa varchar (50),
primary key (id)
);

# 4-Insira 5 registros na tabela tb_categorias.

insert tb_categorias (tipo_pizza,borda, massa) values ('doce','sim','fina');
insert tb_categorias (tipo_pizza,borda, massa) values ('doce','sim','grossa');
insert tb_categorias (tipo_pizza,borda, massa) values ('doce','não','fina');
insert tb_categorias (tipo_pizza,borda, massa) values ('doce','não','grossa');
insert tb_categorias (tipo_pizza,borda, massa) values ('salgada','sim','fina');
insert tb_categorias (tipo_pizza,borda, massa) values ('salgada','sim','grossa');
insert tb_categorias (tipo_pizza,borda, massa) values ('salgada','não','fina');
insert tb_categorias (tipo_pizza,borda, massa) values ('salgada','não','grossa');

# 2-Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
# 3-Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.

create table tb_pizzas (
id bigint auto_increment,
nome_pizza varchar (255) not null,
temperatura varchar(255) not null,
tamanho char(50) not null,
valor int not null,
categorias_id bigint,
primary key (id),
foreign key (categorias_id) references tb_categorias (id)
);

# 5-Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira 
#para criar a relação com a tabela tb_categorias.

insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Mussarela','quente','M',35,5);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Calabresa','fria','M',40,6);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Frango','quente','G',55,7);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Camarão','fria','G',60,8);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Nutella','fria','P',35,1);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Brigadeiro','fria','M',45,2);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Laka','fria','G',55,3);
insert into tb_pizzas (nome_pizza,temperatura,tamanho,valor,categorias_id) values ('Cartola','quente','G',55,4);


# 6- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
select tb_pizzas.nome_pizza, tb_pizzas.valor from tb_pizzas where valor > 45;

# 7- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
select tb_pizzas.nome_pizza, tb_pizzas.valor from tb_pizzas where valor  > 50 and valor < 100;

# 8- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
select tb_pizzas.nome_pizza from tb_pizzas where nome_pizza like "%C%";

# 9- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas 
#com os dados da tabela tb_categorias.
select tb_pizzas.nome_pizza, tb_pizzas.tamanho, tb_categorias.tipo_pizza from tb_pizzas inner join tb_categorias 
on tb_categorias.id = tb_pizzas.categorias_id;

# 10- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da 
#tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica 
#(Exemplo: Todas as pizzas que são doce).
select tb_pizzas.nome_pizza, tb_pizzas.tamanho from tb_pizzas inner join tb_categorias on tb_categorias.id = 3 
and tb_pizzas.categorias_id = 3;