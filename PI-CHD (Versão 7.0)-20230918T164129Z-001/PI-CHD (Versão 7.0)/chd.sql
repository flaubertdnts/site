#drop database db_CHD;
create database db_CHD;
use db_CHD;

create table tb_endereco(
end_id int not null auto_increment primary key,
end_rua varchar(45) not null,
end_bairro varchar(45) not null,
end_cidade varchar(45) not null,
end_numero int not null,
end_cep varchar(9) not null,
end_estado varchar(2)
);
create table tb_tiposDoacoes(
tip_id int not null auto_increment primary key,
tip_outroValor float not null
);
create table tb_enderecoOng(
eno_id int not null auto_increment primary key,
eno_rua varchar(45) not null,
eno_bairro varchar(45) not null,
eno_cidade varchar(45) not null,
eno_numero int not null,
eno_cep varchar(9) not null,
eno_estado varchar(2)
);
create table tb_doador(
doa_id int not null auto_increment primary key,
doa_nome varchar(45) not null,
doa_email varchar(45) not null,
doa_senha varchar(255) not null,
doa_cpf varchar(14) not null, 
doa_end_id int,
foreign key (doa_end_id) references tb_endereco(end_id)
);
create table tb_ong(
ong_id int not null auto_increment primary key,
ong_nome varchar(45) not null,
ong_cnpj varchar(18) not null, 
ong_email varchar(60) not null,
ong_senha varchar(255) not null,
ong_eno_id int,
foreign key (ong_eno_id) references tb_enderecoOng(eno_id)
);
create table tb_doacoes(
doc_id int not null auto_increment primary key,
doc_ong_id int not null,
doc_doa_id int not null,
doc_tip_id int not null,
foreign key (doc_ong_id) references tb_ong(ong_id),
foreign key (doc_doa_id) references tb_doador(doa_id),
foreign key (doc_tip_id) references tb_tiposDoacoes(tip_id)
);
select * from tb_doador;
select * from tb_ong;
select * from tb_enderecoOng;
select * from tb_endereco;

