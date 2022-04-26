#Crie um banco de dados para um serviço de um Games Online. 
#O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. 
#O sistema trabalhará com as informações dos personagens do jogo. 
#O sistema trabalhará com 2 tabelas tb_personagens e tb_classes, que deverão estar relacionadas.

create database db_generation_game_online;
use db_generation_game_online;

# 1-Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, 
#relevantes para classificar os personagens do Game Online.

create table tb_classes (
id bigint auto_increment,
classe varchar (255) not null,
descricao varchar (1000),
primary key (id)
);

# 4-Insira 5 registros na tabela tb_classes.

insert tb_classes (classe,descricao) values 
('mago(a/e)','Tem como características principais a Inteligência, que é usado para conjurar suas magias');
insert into tb_classes (classe,descricao) values 
('guerreiro(a/e)','São exímios lutadores marciais, sempre prontos para o combate. Possuem extremas habilidades de combate.' );
insert into tb_classes (classe,descricao) values 
('elfo(a/e)','Eram divindades maiores da natureza e da fertilidade. Os elfos são geralmente mostrados como jovens de grande beleza vivendo entre as florestass' );
insert into tb_classes (classe,descricao) values 
('arqueiro(a/e)','Um arqueiro é um verdadeiro mestre no uso de arco, e nem mesmo um guerreiro muito experiente pode se igualar as suas capacidades.' );
insert into tb_classes (classe,descricao) values 
('ninja','É um agente secreto ou mercenário especializado em artes marciais de guerra não ortodoxas.' );

#select * from tb_classes;

# 2-Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, 
#relevantes aos personagens do Game Online.
# 3-Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.

create table tb_personagens(
id bigint auto_increment,
nome varchar (255) not null,
cidade varchar(255),
ataque int not null,
defesa int not null,
classe_id bigint,
primary key (id),
foreign key (classe_id) references tb_classes (id)
);

# 5-Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira 
# para criar a relação com a tabela tb_classes.

insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('Kemilly','Paulista',5000,5000,2);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('thor','asgard',3000,2500,1);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('chapolin','méxico',1500,1500,5);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('xena','Atenas',3500,500,4);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('lindinha','Towsville',4500,3500,4);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('florzinha','Towsville',4000,3000,3);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('docinho','Towsville',3500,2500,2);
insert into tb_personagens (nome,cidade,ataque,defesa,classe_id) values ('batman','Towsville',1500,2500,1);

#select * from tb_personagens;

# 6- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
select tb_personagens.nome, tb_personagens.ataque from tb_personagens where ataque > 2000;

# 7- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
select tb_personagens.nome, tb_personagens.defesa from tb_personagens where defesa  > 1000 and defesa < 2000;

# 8- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
select tb_personagens.nome from tb_personagens where nome like "%C%";

# 9- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens 
#com os dados da tabela tb_classes.
select tb_personagens.nome, tb_personagens.cidade, tb_personagens.ataque, tb_personagens.defesa, 
tb_classes.classe, tb_classes.descricao from tb_personagens inner join tb_classes 
on tb_classes.id = tb_personagens.classe_id;

# 10- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens 
#com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica 
#(Exemplo: Todes os personagens da classe dos arqueiros).
select tb_personagens.nome, tb_classes.classe from tb_personagens inner join tb_classes on tb_classes.id = 3 
and tb_personagens.classe_id = 3;







