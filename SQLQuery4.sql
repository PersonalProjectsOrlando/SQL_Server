use base1;
if object_id ('articulos') is not null
  drop table articulos;

create table articulos(
	codigo int primary key identity,
	descripcion varchar(20),
	precio float,
 );
select * from articulos;
insert into articulos(descripcion, precio) values ('peras', 25);
INSERT INTO articulos (descripcion, precio)
VALUES
  ('peras', 25),
  ('manzanas', 30),
  ('plátanos', 20),
  ('uvas', 40),
  ('naranjas', 35),
  ('fresas', 50),
  ('sandías', 60),
  ('kiwis', 45),
  ('mangos', 55),
  ('cerezas', 70),
  ('piñas', 40);
