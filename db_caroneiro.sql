/*Cria um banco de dados Caroneiro*/
create database DB_CARONEIRO;

/*apresenta todos os bancos existentes*/
show databases;

/*seleciona um banco de dados*/
use DB_CARONEIRO;

/*Cria uma tabela de dados*/
create table t_usuario(
    codigo int not null auto_increment,   /*inicia contagem de numeros inteiros a partir do 1 não nulos, automaticamente (obs. codigo identado - que pertence, esta dentro de algo)*/ 
    nome varchar(100),  /*Coluna que aceita variaveis de caracteres com limite de quantidade entre parenteses*/
    cidade varchar(100),
    estado varchar(2),
    data_nascimento datetime,
    tipo varchar(50),
    primary key(codigo)  /*Indica chave primaria - necessário*/
);

create table t_veiculo(
    codigo int not null auto_increment,
    modelo varchar(100),
    marca varchar(50),
    ano int not null,
    cor varchar(50),
    primary key(codigo)
);

create table t_viagem(
    codigo int not null auto_increment,
    data_viagem datetime,
    motorista int not null,
    passageiro int not null,
    origem varchar(100),
    destino varchar(100),
    primary key(codigo)
);

/*Inserir dados nas tabelas*/
insert into t_usuario(nome , cidade , estado , data_nascimento , tipo) values (
    "Frederica Piragibe" , "Americana" , "SP", "1990/10/20" , "Motorista"),
    ("Gisela Campos" , "Campinas" , "SP" , "1992/11/30" , "Passageiro"),
    ("Glauber Moita" , "Americana" , "SP" , "1985/08/05" , "Passageiro"),
    ("Gustavo Vaz" , "São Paulo" , "SP" , "1995/05/20" , "Passageiro"),
    ("Herberto Mantas" , "São Paulo" , "SP" , "1989/01/21" , "Passageiro"),
    ("Ibijara Faria" , "São Paulo" , "SP" , "1991/10/22" , "Passageiro"),
    ("Ibijara Menezes" , "Rio Claro" , "SP" , "1993/05/10" , "Motorista"),
    ("Ilma Garcia" , "Campinas" , "SP" , "1994/06/15" , "Motorista"),
    ("Ingrit Moreyra" , "Limeira" , "SP" , "1991/01/20" , "Passageiro"),
    ("Ivete Amaro" , "Piracicaba" , "SP" , "1990/02/18" , "Passageiro"),
    ("Jorge Malheiro" , "Americana" , "SP" , "1992/05/07" , "Motorista"
);
/*seleciona e imprime a tabela*/
select * from t_usuario;

insert into t_veiculo(modelo , marca , ano , cor) values (
    "gol" , "volkswagen" , 2018 , "Preto"),
    ("sandero" , "renault" , 2017 , "Branco"),
    ("306" , "peugeot" , 2010 , "Vermelho"),
    ("uno" , "fiat" , 2012 , "Preto"),
    ("palio" , "fiat" , 2017 , "Preto"),
    ("golf" , "volkswagen" , 2018 , "Prata"),
    ("up" , "volkswagen" , 2018 , "Amarelo"
);

select * from t_veiculo;

insert into t_viagem(data_viagem , motorista , passageiro , origem , destino) values (
    "2018/10/30" , 1 , 2 , "Americana" , "São Carlos"),
    ("2018/10/29" , 2 , 5 , "Campinas" , "Rio Claro"),
    ("2018/10/29" , 3 , 2 , "São Paulo" , "Americana"),
    ("2018/10/30" , 4 , 3 , "Campinas" , "São Carlos"),
    ("2018/10/30" , 5 , 1 , "Americana" , "São Paulo"),
    ("2018/10/30" , 6 , 1 , "Sumaré" , "São Paulo"),
    ("2018/10/29" , 7 , 1 , "São Carlos" , "São Paulo"),
    ("2018/10/29" , 8 , 2 , "Rio Claro" , "Rio Campinas"),
    ("2018/10/30" , 9 , 3 , "São Paulo" , "Americana"),
    ("2018/10/30" , 10 , 1 , "Americana" , "São Paulo"
);

select * from t_viagem;

/*Utilizando a tabela Usuario*/
select * from t_usuario;

/*Selecionar as pessoas da cidade Limeira ou Piracicaba*/
select * from t_usuario where cidade = "Limeira" or cidade = "Piracicaba";

/*Selecionar as pessoas da cidade Campinas*/
select * from t_usuario where cidade = "Campinas";

/*Seleciona registro específico, Ingrit Moreyra*/
select * from t_usuario where nome = "Ingrit Moreyra";

/*Seleciona todos que nasceram acima de 1990*/
select * from t_usuario where data_nascimento >= "1991-01-01";

/*Selecionar todos os motoristas*/
select * from t_usuario where tipo = "Motorista";

/*Selecionar todos os motoristas*/
select * from t_usuario where tipo = "Passageiro";

/*Selecionar todos os regsitros, exceto os de Americana*/
select * from t_usuario where cidade != "Americana";

/*Selecionar todos os registros de estado diferente SP*/
select * from t_usuario where estado != "SP";

/*Selecionar todas as pessoas de Piracicaba - SP*/
select * from t_usuario where cidade = "Piracicaba" and estado = "SP";

/*Selecionar todos os passageiros de Americana*/
select * from t_usuario where tipo = "Passageiro" and cidade = "Americana";

/*Selecionar todos os motoristas de Americana*/
select * from t_usuario where tipo = "Motorista" and cidade = "Americana";

/*Selecionar todos os motoristas, exceto os de Americana*/
select * from t_usuario where tipo = "Motorista" and cidade != "Americana";

/*Corrigir o nome da Ingrit Moreira*/
update t_usuario set nome = "Ingrid Moreira" where nome = "Ingrit Moreyra";

/*excluir o registro do Jorge*/
delete from t_usuario where nome = "Jorge Malheiro";

/*excluir o registro da Ilma*/
delete from t_usuario where nome = "Ilma Garcia";

/*Utilizando a tabela Veiculo*/
/*Corrigir o cadastro das marcas - devem ser escritas em maiúsculo*/
update t_veiculo set marca = upper(marca);

/*Corrigir o cadastro dos modelos - devem começar com letra maiúscula*/
update t_veiculo
set t_veiculo.modelo = CONCAT(
    UPPER(SUBSTRING(modelo,1,1)),
    LOWER(SUBSTRING(modelo,2,length(modelo)))
);

/*Seleciona todos os registros*/
select * from t_veiculo;

/*Selecionar apenas os modelos fiat*/
select modelo from t_veiculo where marca = "FIAT";

/*Selecionar todos os modelos volkswagen*/
select modelo from t_veiculo where marca = "volkswagen";

/*Selecionar apenas os carros de 2018*/
select * from t_veiculo where ano = 2018;

/*Selecionar apenas os carros de 2018*/
select * from t_veiculo where ano != 2018;

/*Corrigir a cor do veiculo UP*/
update t_veiculo set cor = "branco" where modelo = "Up";

/*excluir o carro Golf*/
delete from t_veiculo where modelo = "Golf";





