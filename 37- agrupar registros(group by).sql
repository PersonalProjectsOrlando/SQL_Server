if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

insert into libros
  values('El aleph','Borges','Planeta',15,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
insert into libros
  values('PHP de la A a la Z',null,null,null,0);

select * from libros;
-- Cantidad de libros de cada editorial
select editorial, count(*) from libros
	group by editorial;
-- Cantidad libros con precio no nulo de cada editorial:
select editorial, count(editorial) from libros
  group by editorial;
-- Total en dinero de los libros agrupados por editorial:
select editorial, sum(precio) from libros
  group by editorial;
-- Máximo y mínimo valor de los libros agrupados por editorial:
select editorial,
  max(precio) as mayor,
  min(precio) as menor
  from libros
  group by editorial;
-- Promedio del valor de los libros agrupados por editorial:
select editorial, avg(precio)
  from libros
  group by editorial;
-- Contar y agrupar por editorial considerando solamente los libros cuyo precio es menor a 30 pesos:
select editorial, count(*) as priceMenor30
  from libros
  where precio<30
  group by editorial;

-- aparecen todos los valores de la editorial
select editorial, count(*)
  from libros
  where precio<30
  group by all editorial;

--exercise
if object_id('visitantes') is not null
  drop table visitantes;
create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);
select * from visitantes;
-- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)
select ciudad, count(*) as cantidad_visitantes from visitantes
	group by ciudad; 
-- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)
select * from visitantes;
select ciudad, count(ciudad) from visitantes
	group by ciudad;
-- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
select sexo,sum(montocompra) from visitantes
	group by  sexo;
-- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)
select sexo,max(montocompra) as max, min(montocompra) as min from visitantes
	group by sexo;
select ciudad,max(montocompra) as max, min(montocompra) as min from visitantes
	group by ciudad;
-- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)
select ciudad,avg(montocompra) as average from visitantes
	group by ciudad;
-- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):
select * from visitantes;
select ciudad, count(*) from visitantes
	where mail is not null and mail<>'no tiene'
	group by ciudad;
-- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
--valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas)
select ciudad, count(*) from visitantes
	where mail is not null and mail<>'no tiene'
	group by all ciudad;