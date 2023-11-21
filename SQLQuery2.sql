-- 25 Funciones para el manejo de cadenas
select substring('Buenas tardes',8,6);
select str(-123.456,8,4);
select stuff('abcde',3,2,'opqrs');
select len('Hola');
select char(65);
select left('buenos dias',8);
select replace('Buenas Tardes','B','T');
select reverse('Hola');
select patindex('%Luis%', 'Jorge Luis Borges');
select charindex('or', 'Jorge Luis Borges');
select replicate ('Hola',3);
select 'Hola'+space(4)+'que tal';
--exercise 
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
-- Mostramos sólo los 12 primeros caracteres de los títulos de los libros y
-- sus autores, empleando la función "substring()":
select SUBSTRING(titulo,1,12) AS titulo, SUBSTRING(autor,1,12) as autor from libros;

-- Mostramos sólo los 12 primeros caracteres de los títulos de los libros y
-- sus autores, ahora empleando la función "left()":
select LEFT(titulo, 12) AS titulo, LEFT(autor,12) AS autor from libros;

-- Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena
-- de caracteres con un solo decimal, empleando la función "str":
select * from libros;
SELECT titulo, str(precio,10,1) from libros;


-- Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena
-- de caracteres especificando un solo argumento:
select * from libros;
SELECT titulo, str(precio) from libros;

-- Mostramos los títulos, autores y editoriales de todos libros, al último
-- campo lo queremos en mayúsculas:
select * from libros;
select titulo, autor, Upper(editorial) from libros;


-- 26 - Funciones matemáticas
select abs(-20);
select ceiling(12.34);
select floor(12.34);
select 10%3;
select 10%2;
select power(2,3);
select round(123.456,0);
select round(123.456,1);
select round(123.456,2);
select round(123.456,3);
select sign(8);
select sign(-8);
select square(3);
select sqrt(9);

--exercise
-- Vamos a mostrar los precios de los libros redondeando el valor hacia abajo y 
-- hacia arriba:
select precio from libros;
select floor(precio) as descendent, CEILING(precio) as ascendent from libros;


-- 27 - Funciones para el uso de fechas y horas
select getdate();
select datepart(month,getdate());
select datepart(day,getdate());
select datepart(hour,getdate());

select datename(month,getdate());
select datename(day,getdate());
select datename(year,getdate());

select dateadd(day,3,'1980/11/02');
select dateadd(month,3,'1980/11/02');
select dateadd(hour,2,'1980/11/02');
select dateadd(minute,16,'1980/11/02');

select datediff (day,'2005/10/28','2006/10/28');
select datediff(month,'2005/10/28','2006/11/29');
select day(getdate());
select month(getdate());
select year(getdate());

-- exercise 
if object_id ('libros') is not null
  drop table libros;

create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
);

go

set dateformat ymd;

insert into libros 
  values('El aleph','Borges','Emece','1980/10/10',25.33);
insert into libros 
  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
insert into libros 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
insert into libros 
  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);
select * from libros;
-- Mostramos el título del libro y el año de edición:
select * from libros;
select titulo, year(edicion) from libros;
-- Mostramos el título del libro y el nombre del mes de edición:
select * from libros;
select titulo, datename(month,edicion) from libros;
-- Mostramos el título del libro y los años que tienen de editados:
select * from libros;
select titulo, datediff(year, edicion, getdate()) as year_diference from libros;
-- Muestre los títulos de los libros que se editaron el día 9, 
--de cualquier mes de cualquier año:
select * from libros;
select titulo from libros
where day(edicion) = 9;

--  28 - Ordenar registros (order by)
select *from libros
 order by titulo;

select titulo,autor,precio
from libros order by 3;

select * from libros
order by editorial desc;

select * from libros
order by titulo asc, editorial desc;







