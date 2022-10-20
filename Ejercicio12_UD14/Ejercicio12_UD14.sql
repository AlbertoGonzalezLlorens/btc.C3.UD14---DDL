create table profesor(
dni varchar(8) not null primary key,
nombre nvarchar(100) unique,
apellidos nvarchar(255),
direccion nvarchar(255),
titulacion nvarchar(255),
gana double not null
);

create table curso(
id_curso int auto_increment not null primary key,
nombre nvarchar(100) unique,
max_alumnos int,
fecha_inicio date,
fecha_fin date,
horas double not null,
dni varchar(8),
foreign key (dni) references profesor(dni) on delete cascade on update cascade
);

create table alumno(
dni varchar(8) not null primary key,
nombre nvarchar(100),
apellidos nvarchar(255),
direccion nvarchar(255),
fecha_nacimiento date,
sexo char,
id_curso int not null,
foreign key (id_curso) references curso (id_curso) on delete cascade on update cascade

);

alter table curso
add constraint fecha_fin check (fecha_fin>=fecha_inicio);

alter table alumno
add constraint sexo  check (sexo='H' or sexo='M');