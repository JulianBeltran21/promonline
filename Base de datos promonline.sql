create database promonline_O28G05;
use promonline_O28G05;
create table categoria(
id_categoriaprod varchar(15) not null,
nombre_categoriaprod varchar(50) not null,
descripcion_categoria varchar(100) not null,
constraint categoria_pk primary key(id_categoriaprod));
create table proveedor(
id_prove varchar(15) not null,
valorUnitCompra_prod double not null,
nom_prove varchar(50) not null,
ident_prove varchar(18) not null,
tel_prove varchar(23) not null,
email_prove varchar(50) not null,
direc_prove varchar(50) not null,
constraint proveedor_pk primary key(id_prove));
create table producto(
id_prod varchar(15) not null,
nombre_prod varchar(50) not null,
marca_prod varchar(50) not null,
desc_prod varchar(15) null,
valorUnitVta_prod double not null,
stock_prod varchar(15) not null,
id_categoriaprod varchar(11) not null,
tipo_prove varchar(1) not null,
constraint producto_pk primary key(id_prod),
constraint producto_id_categoriaprod_fk foreign key(id_categoriaprod) references categoria(id_categoriaprod),
constraint producto_tipo_prove_ck check(tipo_prove='N' or tipo_prove='I'));
create table cliente(
id_cli varchar(15) not null,
id_prod varchar(15) not null,
nombre_cli varchar(60) not null,
apellido_cli varchar(60) not null,
identificacion_cli varchar(15) not null,
ciudad_cli varchar(50) not null,
direccion_cli varchar(100) not null,
edad_cli varchar(2) null,
genero_cli varchar(1) not null,
tel_cli varchar(20) not null,
email_cli varchar(50) null,
constraint cliente_pk primary key(id_cli),
constraint cliente_id_prod_pf foreign key(id_prod) references producto(id_prod),
constraint producto_genero_cli_ck check(genero_cli='M' or genero_cli='F' or genero_cli='O' ));
create table detalleventa(
num_detalle varchar(15) not null,
id_cli varchar(15) not null,
cantidad_articulo varchar(10) not null,
total_venta double not null,
constraint detalleventa_pk primary key(num_detalle),
constraint detalleventa_id_cli_pf foreign key(id_cli) references cliente(id_cli));
create table factura(
num_factura varchar(15) not null,
num_detalle varchar(15) not null,
fecha_factura date not null,
num_pago varchar(15) not null,
constraint factura_pk primary key(num_factura),
constraint factura_num_detalle_pf foreign key(num_detalle) references detalleventa(num_detalle));
create table producto_proveedor(
id_prod varchar(15) not null,
id_prove varchar(15) not null,
constraint producto_proveedor_pk primary key(id_prod,id_prove),
constraint producto_proveedor_id_prod_fk foreign key(id_prod) references producto(id_prod),
constraint producto_proveedor_id_prove_fk foreign key(id_prove) references proveedor(id_prove));