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
  ('pl�tanos', 20),
  ('uvas', 40),
  ('naranjas', 35),
  ('fresas', 50),
  ('sand�as', 60),
  ('kiwis', 45),
  ('mangos', 55),
  ('cerezas', 70),
  ('pi�as', 40);
