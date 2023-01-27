select *from articulo
select *from cliente
select *from pedido

create database GestionDePedido

create table producto(
cod_prod int primary key,
secc_prod varchar(20),
nom_prod varchar(20),
prec_prod float,
fech_imp_prod date,
pais_prod varchar(20)
)

create table cliente(
cod_cli int primary key,
nom_emp_cli varchar(20),
dir_cli varchar(20),
ciud_cli varchar(20),
tel_cli char (10)
)

create table pedido(
cod_ped int primary key,
fech_ped char(10) references cliente(ced_cli),


pago_ped int references servicios(cod_ser),

fech_ser_cli date,
est_ser_cli varchar(20)
)

insert into servicios values(1,'hosting',30);
insert into servicios values(2,'tv cable',20);
insert into servicios values(3,'internet',47);

insert into cliente values('1020304050','cris','calo','guamani','1234567890');
insert into cliente values('1020304060','alan','brito','el valle','2345678901');
insert into cliente values('1020304070','juan','lara','el bosque','3456789012');

insert into servicio_cliente values(1,'1020304050',1,'2020-08-13','aprobado');
insert into servicio_cliente values(2,'1020304050',3,'2020-08-13','aprobado');
insert into servicio_cliente values(3,'1020304060',3,'2020-08-13','aprobado');
insert into servicio_cliente values(4,'1020304070',3,'2020-07-13','negado');

create proc SP_uno
as

print 'HOLA'

execute SP_uno


create procedure SP_libros_autor
  @autor varchar(30) 
 as
  select titulo, editorial,precio
   from libros
   where autor= @autor;

    exec pa_libros_autor 'Borges';
	-----------------------------
create procedure pa_libros_autor_editorial
  @autor varchar(30),
  @editorial varchar(20) 
 as
  select titulo, precio
   from libros
   where autor= @autor and
   editorial=@editorial;

   exec pa_libros_autor_editorial 'Richard Bach','Planeta';
-------------------------------------------
create procedure mostrarturno
@servicio varchar(20)
as
select nom_serv, count(hora) from tablaturno where nom_serv=@servicio group by nom_serv;


exec mostrarturno 'Internet';
