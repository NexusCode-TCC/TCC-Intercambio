-- criando o Banco de Dados --
create database db_Inter;

-- usando o banco de dados --
use db_Inter;

-- função para dropar o banco de dados --
drop database db_Inter;

-- criando as tabelas --
create table tbl_Cliente(
	idCliente int primary key auto_increment,
    nmCliente varchar (80) not null,
    noCPF varchar(14) not null unique,
    dsEmail varchar(50) not null unique
);
select * from tbl_Cliente;
/*drop table tbl_Cliente;*/

create table tbl_Login
(
	idLogin int primary key auto_increment,
    dsLogin varchar(30) unique,
    dsSenha char(8) not null,
    tipo int,
    idCliente int,
    constraint foreign key (idCliente) references tbl_Cliente(idCliente)
);
select * from tbl_Login;
drop table tbl_login;

create table tbl_TelCliente(
	idTelefone int primary key auto_increment,
    idCliente int,
    noTelefone char(11) not null,
    constraint foreign key (idCliente) references tbl_Cliente(idCliente)
);
drop table tbl_TelCliente;

create table tbl_Pacote(
	idPacote int primary key auto_increment,
    nmPacote enum("Entretenimento","Educação","Profissional") not null,
    dsPreco decimal(10, 2) not null,
    dsPacote varchar(300) not null,
    Imagem varchar(600) not null
);
/*drop table tbl_Pacote;*/
select * from tbl_Pacote;

create table tbl_Plano(
idPlano int Primary Key auto_increment,
nmPais varchar(150) not null,
nmCidade varchar(150) not null,
dsCidade varchar(999) not null,
dsClima varchar(100) not null,
dsEstadiaInicio varchar(10) not null,
dsEstadiaTermino varchar(10) not null,
dsEstadiaTotal varchar(150) not null,
dsMoeda varchar(150) not null,
dsIdiomaP varchar(80) not null,
dsIdiomaS varchar(80) not null,
idPacote int,
constraint foreign key (idPacote) references tbl_Pacote(idPacote) 
);
select idCom,dtComp,idCliente from tbl_Compra;
select * from tbl_Plano;
/*drop table tbl_Plano;*/

create table tbl_Compra(
	idCom int primary key auto_increment,
    dtComp datetime not null,
    idCliente int,
    constraint foreign key (idCliente) references tbl_Cliente(idCliente)
);
select * from tbl_Compra;

create table tbl_ItensCompra(
idItem int primary key auto_increment,
idCom int,
idPacote int,
constraint foreign key (idCom) references tbl_Compra(idCom),
constraint foreign key (idPacote) references tbl_Pacote(idPacote)
);
/*drop table tbl_ItensCompra;*/
select * from tbl_ItensCompra;	

create table tbl_Tipo_Pagamento(
	id_Tipo_Pagamento int primary key auto_increment,
    idCliente int references tbl_Cliente(idCliente),
    nm_Pagamento varchar(30)
);
/*drop table tbl_Tipo_Pagamento;*/


-- fim tabelas --
