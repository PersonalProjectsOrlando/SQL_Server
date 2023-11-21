CREATE TABLE fabricante (
  id_fabricante INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2),
  fk_fabricante INT  NOT NULL,
  FOREIGN KEY (fk_fabricante) REFERENCES fabricante(id_fabricante)
);


if object_id('producto') is not null
drop table producto;

if object_id('fabricante') is not null
drop table fabricante;

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
select * from fabricante;
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
select * from producto;

--Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- Lista todas las columnas de la tabla producto.
select * from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
--Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre, precio as dolares, precio*0.91 as euros from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre) as NombreMayusculas, precio from producto;

-- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select  id_fabricante,  fabricante.nombre as fabricante from producto
	inner join fabricante on producto.fk_fabricante=fabricante.id_fabricante;

-- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos
select distinct fk_fabricante from producto;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente. 
select nombre, precio from producto
	order by nombre asc, precio desc;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

select top 1 nombre, precio from producto  
	order by precio asc;
-- tenemos otra opcion:
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
offset 0 rows fetch next 1 rows only;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre, precio from producto
	where precio<=120;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from producto
	where precio>=80 and precio<=300
	order by precio asc;

-- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN
select * from producto	
	where fk_fabricante=1 or fk_fabricante=3 or fk_fabricante=5 
	--where fk_fabricante IN (1,3,5)
	order by fk_fabricante asc;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante
	where upper(left(nombre,1))='s'; 

-- 31. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante
	where nombre like '%w%'; 


-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante
	where len(nombre)=4;

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. 
select nombre from producto
	where nombre like '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor 
--en el nombre y tienen un precio inferior a 215 €.
select nombre, precio from producto
	where nombre like '%Monitor%' and precio<215;

-- 36. lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
-- Ordene el resultado en primer lugar por el precio (en orden descendente) 
-- y en segundo lugar por el nombre (en orden ascendente). 
select nombre, precio from producto
	where precio >= 180
	order by precio desc, nombre asc; 


-- Consultas multitabla (Composición interna) -----------------------------------------------------------------------
-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos 
   --de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético. 
select producto.nombre, producto.precio, fabricante.nombre as nombre_fabricante from producto
inner join fabricante on producto.fk_fabricante=fabricante.id_fabricante
order by fabricante.nombre asc;


-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select top 1 producto.nombre, producto.precio, fabricante.nombre as nombre_fabricante from producto
	inner join fabricante on producto.fk_fabricante=fabricante.id_fabricante
	order by precio asc;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
select * from fabricante;
select * from producto
	where producto.fk_fabricante in(2);

-- 8.  Devuelve un listado con todos los productos de los fabricantes Asus, 
	-- Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select producto.nombre, producto.precio, fabricante.nombre from producto
	inner join fabricante on producto.fk_fabricante=fabricante.id_fabricante
	where fabricante.nombre='Asus' or fabricante.nombre='Hewlett-Packard' or fabricante.nombre='Seagate';

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes 
	-- cuyo nombre termine por la vocal e.
select producto.nombre, producto.precio, fabricante.nombre from producto
	inner join fabricante on producto.fk_fabricante=fabricante.id_fabricante
	where right(fabricante.nombre,1)='e';	-- right(fabricante.nombre,1); 1 es el numero de caracteres que se van a extraer.

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos 
	--que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por 
	--el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select producto.nombre, producto.precio, fabricante.nombre from producto
	inner join fabricante on producto.fk_fabricante=fabricante.id_fabricante
	where precio >= 180
	order by producto.precio desc, producto.nombre asc;

-- Consultas multitabla (Composición externa) -------------------------------------------------------------
-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos 
-- que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos 
--asociados.


select * from producto
	right join fabricante on producto.fk_fabricante=fabricante.id_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select * from producto
	right join fabricante on producto.fk_fabricante=fabricante.id_fabricante
	where producto.id_producto is null;