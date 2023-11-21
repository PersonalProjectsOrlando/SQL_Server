use bd1;
if object_id ('libros') is not null
  drop table libros;
create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
 );
 insert into libros
  values('El aleph','Borges','Emece',15.90);
 insert into libros
  values('Antología poética','Borges','Planeta',39.50);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Planeta',50.50);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.90);
 insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
 insert into libros
  values('Martin Fierro','Jose Hernandez','Paidos',16.80);
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece',19.50);
 insert into libros
  values('Cervantes y el quijote','Borges','Paidos',18.40);
-- 29 - Operadores lógicos ( and - or - not) 

  --Recuperamos los libros cuyo autor sea igual a "Borges" y cuyo precio no supere los 20 pesos:
  select * from libros
	where autor='Borges' and precio<=20;

  --Seleccionamos los libros cuyo autor es "Borges" y/o cuya editorial es "Planeta":
 select * from libros
	where autor='Borges' or editorial='Planeta'; 

  --Recuperamos los libros cuya editorial NO es "Planeta":
  select * from libros
	where not editorial='Planeta';

select * from libros
  where editorial is not null;

  
-- 31 - Otros operadores relacionales (between)

 if object_id('visitas') is not null
  drop table visitas;
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
);

 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');
select * from visitas;
--Seleccione los usuarios que visitaron la página entre el 
--'2006-09-12' y '2006-10-11' (5 registros)
--Note que incluye los de fecha mayor o igual al valor mínimo y menores al valor máximo, y que los 
--valores null no se incluyen.
select * from visitas
	where fechayhora between '2006-09-12' and '2006-10-11';   

--Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros)
--Note que incluye los valores límites. 
select * from visitas
	where numero between 2 and 5;  

-- 32 - Otros operadores relacionales (in)
if object_id('medicamentos') is not null
  drop table medicamentos;
create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
 );
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01');
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01');
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
 insert into medicamentos 
  values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
 insert into medicamentos 
  values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 
select * from medicamentos; 
  -- Recupere los nombres y precios de los medicamentos cuyo laboratorio 
  --sea "Bayer" o "Bago" empleando el operador "in" (4 registros)
  select nombre, precio, laboratorio from medicamentos
  where laboratorio in('Bayer','Bago') ;
-- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando 
-- el operador "between" y luego el operador "in" (2 registros):
select * from medicamentos 
	where cantidad between 1 and 5;
select * from medicamentos 
	where cantidad in(1,2,3,4,5);

-- 33 - Búsqueda de patrones (like - not like)
if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','J. L. Borges','Planeta',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50);
-- Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":
select * from libros
  where autor like '%Borges%';
-- Seleccionamos los libros cuyos títulos comienzan con la letra "M":
select * from libros
  where titulo like 'M%';
-- Seleccionamos todos los títulos que NO comienzan con "M":
select * from libros
  where titulo not like 'M%';
-- Si queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe 
-- "Carroll" o "Carrolt", podemos emplear el comodín "_" (guión bajo) y establecer
-- la siguiente condición:
select * from libros
  where autor like '%Carrol_';
-- Buscamos los libros cuya editorial comienza con las letras entre la "P" y la "S":
select titulo,autor,editorial
  from libros
  where editorial like '[P-S]%';
  -- Seleccionamos los libros cuya editorial NO comienza con las letras "P" ni "N":
select titulo,autor,editorial
  from libros
  where editorial like '[^PN]%';
-- Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:
select titulo,precio from libros
  where precio like '1_.%';
-- Recuperamos los libros que NO incluyen centavos en sus precios:
select titulo,precio from libros
  where precio like '%.00';

  -- Exercise
  if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );
 insert into empleados
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);
select * from empleados;
-- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)
select * from empleados 
	where nombre like '%Perez'; 
-- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)
select * from empleados 
	where domicilio like 'Co%' and  domicilio like '%8%'; 
-- Seleccione todos los empleados cuyo documento finalice en 0,2,4,6 u 8 (4 registros)
select * from empleados 
	where documento like '%[02468]';
-- Seleccione todos los empleados cuyo documento NO comience con 1 ni 3 y 
-- cuyo nombre finalice en "ez" (2 registros)
select * from empleados 
	where documento not like '[13]%' and nombre like  '%ez';
-- Recupere todos los nombres que tengan una "y" o una "j" en su nombre 
-- o apellido (3 registros)
select * from empleados	
	where nombre like '%y%' or nombre like '%j%';

-- Muestre los nombres y sección de los empleados que pertenecen a secciones 
-- que comiencen con "S" o "G" y tengan 8 caracteres (3 registros)
select nombre, seccion from empleados
	where (seccion like 'S%' or seccion like 'G%') and (len(seccion) like 8);
-- Muestre los nombres y sección de los empleados que pertenecen a 
-- secciones que NO comiencen con "S" o "G" (2 registros)
select nombre, seccion from empleados
	where seccion not like 'S%' and seccion not like 'G%';
-- Muestre todos los nombres y sueldos de los empleados cuyos 
-- sueldos incluyen centavos (3 registros)
select nombre, sueldo from empleados
	where sueldo not like '%.00';

-- Muestre los empleados que hayan ingresado en "1990" (3 registros)
select * from empleados
	where fechaingreso like '%1990%'; 

-- 34 - Contar registros (count)
 if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 
 
 select * from medicamentos;
 -- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)
 select count(*) from medicamentos;
 -- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)
 select count (laboratorio) from medicamentos;
 -- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que 
 -- tienen cantidad distinto a "null", disponer alias para las columnas.
 select count(precio) as precio, count(cantidad) as cantidad from medicamentos;

-- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience 
-- con "B" (2 registros)
select count(precio) from medicamentos
where laboratorio like'B%';

-- Cuente la cantidad de medicamentos con número de lote distitno de "null" (0 registros)
select count(numerolote) from medicamentos;