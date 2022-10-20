create table cientificos(
dni varchar(8) not null primary key,
nom_apels nvarchar(255)
);

create table proyecto (
id char(4) not null primary key,
nombre nvarchar(255),
horas int
);

create table asignado_a (
cientifico varchar(8) not null,
proyecto char(4) not null,
primary key (cientifico,proyecto),
foreign key (cientifico)
references cientificos(dni)
on delete cascade on update cascade,
foreign key (proyecto)
references proyecto(id)
on delete cascade on update cascade
);