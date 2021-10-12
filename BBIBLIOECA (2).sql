create database if not exists biblioteca;
use  biblioteca;
create table if not exists estudiante(
id_estudiante integer unsigned not null auto_increment,
nombre char(20),
apellido char(20),
rut int unsigned not null,
dv int unsigned not null,
 PRIMARY KEY (id_estudiante))
ENGINE=InnoDB;
select*from estudiante;
drop table estudiante;
#insert estudiante
insert into estudiante (nombre,apellido,rut,dv) values ("nadie","nadie",00000000,0);

insert into estudiante (nombre,apellido,rut,dv) values ("Jose Vallejo","vallejo vallejo",11322445,0);

insert into estudiante (nombre, apellido, rut, dv) values ("Juan", "Olivares", 212120111, 1);
insert into estudiante (nombre, apellido, rut, dv) values ("Pedro", "Allende", 212120112, 2);
insert into estudiante (nombre, apellido, rut, dv) values ("Esteban", "Ramírez", 212120113, 3);
insert into estudiante (nombre, apellido, rut, dv) values ("Josefa", "Gallardo", 212120114, 4);
insert into estudiante (nombre, apellido, rut, dv) values ("Sergio", "Espinoza", 212120115, 5);
insert into estudiante (nombre, apellido, rut, dv) values ("Jesús", "Pinochet", 212120116, 6);
insert into estudiante (nombre, apellido, rut, dv) values ("Javiera", "Rosa", 212120117, 7);
insert into estudiante (nombre, apellido, rut, dv) values ("Veronica", "Leon", 212120118, 8);
insert into estudiante (nombre, apellido, rut, dv) values ("Ana", "Coroseo", 212120119, 9);
create table if not exists docente(
id_docente integer unsigned not null auto_increment,
nombre char(20),
apellido char(20),
num_tel int unsigned not null,
rut int unsigned not null,
dv int unsigned not null,
primary key(id_docente))
engine=InnoDB;
delete from docente where id_docente=(1);
drop table docente;
#insert docente
insert into docente (nombre,apellido,num_tel,rut,dv) values ("nadie","nadie",9999999,00000000,0);

insert into docente (nombre,apellido,num_tel,rut,dv) values ("jose","grau",998345374,25343556,0);

insert into docente(nombre,apellido,num_tel,rut,dv) values("santiago","cojo",9653745,23142337,9);
insert into docente(nombre,apellido,num_tel,rut,dv) values("roberto","santos",965524354,21678994,9);
insert into docente(nombre,apellido,num_tel,rut,dv) values("franciso","savedra",962342132,21665773,8);
insert into docente(nombre,apellido,num_tel,rut,dv) values("juan","marquez",986532435,21422331,0);
insert into docente (nombre,apellido,num_tel,rut,dv)values("cristian","arevalo",987654323,21649668,0);
insert into docente(nombre,apellido,num_tel,rut,dv) values("marcel","xu",986334546,21437556,9);
insert into docente(nombre,apellido,num_tel,rut,dv) values("blas","serra",987689754,23434223,1);
insert into docente(nombre,apellido,num_tel,rut,dv) values("hassan","rosa",943221121,22343112,6);
insert into docente(nombre,apellido,num_tel,rut,dv) values("victor","hurtado",953423423,21345678,0);
insert into docente(nombre,apellido,num_tel,rut,dv)values("messi","messi",9987654,27333222,1);
select*from docente;
create table if not exists estado(
id_estado int unsigned not null,
estado char(20),
primary key (id_estado))
engine=InnoDB;
drop table estado;
insert into estado(id_estado,estado)values("3","buen estado");
insert into estado(id_estado,estado)values("1","mal estado");
insert into estado(id_estado,estado)values("2","estado regular");
select*from estado;
drop table estado;

#----------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------
#tabla hija
create table if not exists libros(
id_libros int unsigned not null auto_increment,
titulo varchar(50),
autor varchar(50),
editorial varchar(50),
categoria varchar(50),
fecha  date,
cod_estado int unsigned not null,
primary key(id_libros),
foreign key (cod_estado) references estado(id_estado)
)engine=InnoDB;
select*from libros;
drop table libros;
#insert libros
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("manati's searching",'charles exhavour','planeta libro','cientifico','1920-02-22','2');

insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("manati´s of the space",'magneto gonzales','super literatura','ciencia ficcion','1934-03-23','3');

insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("El Señor de los Anillos", "J. R. R. Tolkien", "George Allen & Unwin ", "fantasia", "1920-07-29","3");
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("El Hobbit", "J. R. R. Tolkien", "George Allen & Unwin George Allen & Unwin", "fantasia", "1954-09-21","2");
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("Dune", "Frank Herbert", "Debols!Llo", "ciencia ficción", "1965-08-2","2");
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("Ubik", "Philip K. Dick", "Doubleday", "ciencia ficción", "1969-03-12","3");

insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado) values ("La ciencia pop","Gabriel Leon","Zig Zag","cientifico","2017-05-01",2);
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("Sapiens","Yuval Noah Harari","Zig Zag","cientifico","2011-0-0",3);
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("1984","George Orwell","Zig Zag","Literatura","1949-06-08",3);

insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("Ilíada","Homero","Zig Zag","Literatura","1-01-01",2);

insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("El Hobbit", "J. R. R. Tolkien", "George Allen & Unwin George Allen & Unwin", "fantasia", "1954-09-21","2");
insert into libros(titulo,autor,editorial,categoria,fecha,cod_estado)values("Ilíada","Homero","Zig Zag","Literatura","1-01-01",2);
create table if not exists prestamo(
id_prestamo int unsigned not null auto_increment,
fecha_prestamo date,
entrega_prestamo date,
cod_estudiante  int unsigned not null,
cod_docente  int unsigned not null,
cod_libros   int unsigned not null,
primary key(id_prestamo),
foreign key (cod_estudiante) references estudiante(id_estudiante),
foreign key (cod_docente) references docente(id_docente),
foreign key (cod_libros) references libros(id_libros)
)engine=InnoDB;
select*from prestamo;
delete from prestamo where id_prestamo=1;
drop table prestamo;
#insert prestamos
#el codigo de docent y estudiante 1 es nadie
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-23','2021-07-03',"2","1","5");

insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-03','2021-06-13',"5","1","5");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-04-23','2021-05-03',"3","1","5");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-11-23','2021-12-03',"4","1","3");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-24','2021-07-04',"6","1","3");

insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-24','2021-07-04',"1","3","1");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-24','2021-07-04',"1","3","2");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-24','2021-07-04',"1","8","3");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-24','2021-07-04',"1","8","3");
insert into prestamo(fecha_prestamo,entrega_prestamo,cod_estudiante,cod_docente,cod_libros)values('2021-06-24','2021-07-04',"1","7","1");
create table if not exists devolucion(
id_devolucion int unsigned not null auto_increment,
fecha_devolucion date,
observacion varchar(200),
cod_prestamo int unsigned not null,
primary key (id_devolucion),
foreign key(cod_prestamo) references prestamo(id_prestamo)
)engine=InnoDB;
drop table devolucion;
#insert
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values("2021-07-01","entregado en peores condiciones de las que estaba",1);

insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values("2021-05-01","entregado con rayones en las páginas ",2);
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values("2021-07-01","entregado en peores condiciones de las que estaba",3);
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values("2021-12-01","entregado en buenas condiciones",4);
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values("2021-06-03","entregado con la portada manchada",5);

insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values('2021-07-06','entrego tarde pero en buenas condiciones',"6");
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values('2021-07-01','su entrega fue temprano pero la ultima pagina estaba toda arrugada',"7");
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values('2021-07-04','se entrega fue en la fecha limite y en perfectas condiciones',"8");
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values('2021-07-05','su entrega fue tardia pero la portada del libro estaba manchada',"9");
insert into devolucion(fecha_devolucion,observacion,cod_prestamo)values('2021-07-04','entrega a tiempo y libro esta perecto',"10");
#consultas
select*from estudiante;
select*from docente;
select*from estado;
select*from libros;
select*from prestamo;
select*from devolucion;
#stock prestados y stock disponibles e)
select count(cod_libros) as "libros prestados",titulo as"titulo del libro", autor from prestamo inner join libros on prestamo.cod_libros=libros.id_libros group by titulo order by count(cod_libros);
select count(id_libros) as "stock libros disponibles"from libros;
#categoria g)
select estado,titulo, categoria,count(categoria) 
from libros 
inner join estado on libros.cod_estado=estado.id_estado 
where categoria="fantasia" group by estado;
#h/F dar de baja un libro
update libros set cod_estado=1 where id_libros=12 ;
update prestamos set entrega_prestamo= 2021-07-14 where id_prestamo =5 ;
update estudiante set nombre= 'heracilio venavides' where id_estudiante=6;
#i)cantidad de libros en prestamo
select count(cod_libros) as "libros prestados",
id_libros as "codigo del libro",titulo as"titulo del libro", 
autor,fecha_prestamo as "fecha de prestamo",entrega_prestamo as"plazo lìmite de entrega",
fecha_devolucion as "fecha de entrega",
concat(estudiante.id_estudiante, '-' ,estudiante.nombre)as "informacion del estudiante: id-nombre",
 concat(docente.id_docente,'-',docente.nombre)as "informacion del docente: id-nombre" 
from prestamo 
inner join libros on prestamo.cod_libros=libros.id_libros 
inner join estudiante on prestamo.cod_estudiante=estudiante.id_estudiante 
inner join docente on prestamo.cod_docente=docente.id_docente
inner join devolucion on prestamo.id_prestamo=devolucion.cod_prestamo
 group by titulo order by count(cod_libros);