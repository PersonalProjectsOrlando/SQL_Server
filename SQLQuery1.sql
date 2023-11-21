use bd1
create table usuarios (
	nombre varchar(30),
	clave varchar(10)
);
drop table usuarios;	--elimina la tabla y los datos que posee
exec sp_tables @table_owner='dbo';	-- muestra todas las tablas que se han creado en la BD
exec sp_columns usuarios;	-- muestra los detalles de las columnas de la tabla
select * from usuarios;
insert into usuarios (nombre, clave) values ('Mariano','payaso');
insert into usuarios (clave, nombre) values ('River','Juan');
insert into usuarios (nombre,clave) values ('Boca','Luis');



if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 insert into usuarios (nombre, clave) values ('Mariano','payaso');
 select * from usuarios;
 insert into usuarios (clave, nombre) values ('River','Juan');
 select * from usuarios;
 insert into usuarios (nombre,clave) values ('Boca','Luis');
 select * from usuarios;

 -- 4 - Tipos de datos básicos --------------------------------------------------------------------------------
 if OBJECT_ID('libros') is not null
	drop table libros;
create table libros(
  titulo varchar(80),
  autor varchar(40),
  editorial varchar(30),
  precio float,
  cantidad integer
);
exec sp_columns libros;
insert into libros (titulo,autor,editorial,precio, cantidad) values ('El aleph','Borges','Emece',25.50, 100),
																	('El ciclista','Barragan','Tiempo',50.998, 125),
																	('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);
select * from libros;

-- 5 - Recuperar algunos campos (select) ---------------------------------------------------------------
-- borramos la tabla libros si ya existe
if object_id('libros') is not null
  drop table libros;

-- creamos la tabla libros
create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio float,
  cantidad integer
);

go

-- llamamos al procedimiento almacenado sp_columns para conocer los campos
-- de la tabla libros
exec sp_columns libros;

-- insertamos varias filas en la tabla libros
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);

-- recuperamos todas los datos de la tabla libros
select * from libros;

-- recuperamos solo el titulo, autor y editorial de la tabla libros
select titulo,autor,editorial from libros; 

-- recuperamos el titulo y el precio
select titulo,precio from libros;

-- recuperamos la editorial y la cantidad
select editorial,cantidad from libros; 

-- 6 - Recuperar algunos registros (where) --------------------------------------------------------------------
if object_id('usuarios') is not null
  drop table usuarios;

create table usuarios (
  nombre varchar(30),
  clave varchar(10)
);

go 

exec sp_columns usuarios;

insert into usuarios (nombre, clave) values ('Marcelo','Boca'),
										    ('JuanPerez','Juancito'),
											('Susana','River'),
											('Luis','River');
-- Recuperamos el usuario cuyo nombre es "Leonardo"
select * from usuarios 
	where nombre='Leonardo';  
-- Recuperamos el nombre de los usuarios cuya clave es "River"
select nombre from usuarios	
	where clave='River'; 
-- Recuperamos el nombres de los usuarios cuya clave es "Santi"
select nombre from usuarios	
	where clave='Santi';

-- 7 - Operadores relacionales  -----------------------------------------------------------------------------
if object_id('libros') is not null
  drop table libros;

create table libros(
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio float
);

go

insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',24.50);
insert into libros (titulo,autor,editorial,precio)
  values ('Martin Fierro','Jose Hernandez','Emece',16.00);
insert into libros (titulo,autor,editorial,precio)
  values ('Aprenda PHP','Mario Molina','Emece',35.40);
insert into libros (titulo,autor,editorial,precio)
  values ('Cervantes y el quijote','Borges','Paidos',50.90);
select * from libros;

-- Seleccionamos los registros cuyo autor sea diferente de 'Borges'
select * from libros 
  where autor <> 'Borges';

-- Seleccionamos los registros cuyo precio supere los 20 pesos, sólo el título y precio
select * from libros 
	where precio>20;

-- Recuperamos aquellos libros cuyo precio es menor o igual a 30
select * from libros
	where precio<=30;

--  8 - Borrar registros (delete) ----------------------------------------------------------------------------
if object_id('usuarios') is not null
  drop table usuarios;

create table usuarios(
  nombre varchar(30),
  clave varchar(10)
);

go

insert into usuarios (nombre,clave)
  values ('Marcelo','River');
insert into usuarios (nombre,clave)
  values ('Susana','chapita');
insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');

select * from usuarios;

-- Eliminamos el registro cuyo nombre de usuario es "Marcelo"
delete from usuarios
	where nombre='Marcelo';
select * from usuarios;

-- Intentamos eliminarlo nuevamente (no se borra registro)
delete from usuarios
	where nombre='Marcelo';
select * from usuarios;

-- Eliminamos todos los registros cuya clave es 'Boca'
delete from usuarios
	where clave='Boca';
select * from usuarios;

-- Eliminemos todos los registros
delete from usuarios;
select * from usuarios;

-- 9 - Actualizar registros (update) -------------------------------------------------------------------------
if object_id('usuarios') is not null
  drop table usuarios;

create table usuarios(
  nombre varchar(20),
  clave varchar(10)
);

go

insert into usuarios (nombre,clave)
  values ('Marcelo','River');
insert into usuarios (nombre,clave)
  values ('Susana','chapita');
insert into usuarios (nombre,clave)
  values ('Carlosfuentes','Boca');
insert into usuarios (nombre,clave)
  values ('Federicolopez','Boca');

update usuarios set clave='RealMadrid';

select * from usuarios;

-- 19 - Tipo de dato (fecha y hora)
if object_id('empleados') is not null
  drop table empleados;

create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
);

go

-- Seteamos el formato de la fecha para que guarde día, mes y año:
set dateformat dmy;

insert into empleados values('Ana Gomez','22222222','12-01-1980');
insert into empleados values('Bernardo Huerta','23333333','15-03-81');
insert into empleados values('Carla Juarez','24444444','20/05/1983');
insert into empleados values('Daniel Lopez','25555555','2.5.1990');

select * from empleados;
-- Mostramos los datos de los empleados cuya fecha de ingreso es anterior a '01-01-1985':
select * from empleados 
	where fechaingreso>'01-01-1985';

-- Actualizamos el nombre a "Maria Carla Juarez' 
-- del empleado cuya fecha de ingreso es igual a '20/05/1983':
update empleados set nombre='Maria Carla Juarez' where fechaingreso='20.5.83';

-- Borramos los empleados cuya fecha de ingreso es distinta a '20.5.83':
delete from empleados where fechaingreso<>'20/05/1988';

-- 20 - Ingresar algunos campos (insert into) 
if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null default 'Desconocido',
  autor varchar(30),
  editorial varchar(15)
);
select * from libros;
-- Si ingresamos valores para todos los campos, podemos omitir la lista de campos:
insert into libros
  values ('Uno','Richard Bach','Planeta');

  -- Podemos ingresar valores para algunos de los campos:
insert into libros (titulo, autor)
  values ('El aleph','Borges');

  -- No podemos omitir el valor para un campo declarado "not null",
-- como el campo "titulo" (genera error):
insert into libros (autor,editorial)
  values ('Lewis Carroll','Planeta');

-- 22 - Columnas calculadas (operadores aritméticos y de concatenación)
if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
select * from libros;
-- Queremos saber el monto total en dinero de cada libro: 
--select titulo, cantidad*precio as total from libros;
-- Conocer el precio de cada libro con un 10% de descuento:
select titulo, precio*0.9 as total from libros;
-- Actualizar los precios con un 10% de descuento:
update libros set precio=precio*0.9;
-- Queremos una columna con el título, el autor y la editorial de cada libro:
select titulo+' - '+autor+' - '+editorial from libros;