create database Promonline;
use Promonline;
create table categoria(
id_categoria varchar(11) not null,
nombre_categoria varchar(50) not null,
descripcion_categoria varchar(100) not null,
constraint categoria_pk primary key(id_categoria));
insert into categoria(id_categoria,nombre_categoria,descripcion_categoria) value('1','Computadors','Lenovo');
insert into categoria(id_categoria,nombre_categoria,descripcion_categoria) value('2','Monitores','LG'); 
insert into categoria(id_categoria,nombre_categoria,descripcion_categoria) value('3','Discos Duros','Seagate'); 
insert into categoria(id_categoria,nombre_categoria,descripcion_categoria) value('4','Procesadores','Intel'); 
insert into categoria(id_categoria,nombre_categoria,descripcion_categoria) value('5','Boards','Asus');