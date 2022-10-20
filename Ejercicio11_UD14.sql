create table facultad(
codigo int auto_increment not null primary key,
nombre nvarchar(100)
);

create table investigadores(
dni varchar(8) not null primary key,
nom_apels nvarchar(255),
facultad int,
foreign key (facultad)
references facultad(codigo)
on delete cascade on update cascade
);

create table equipos(
num_serie char(4) not null primary key,
nombre nvarchar(100),
facultad int,
foreign key (facultad)
references facultad(codigo)
on delete cascade on update cascade
);

create table reserva(
dni varchar(8) not null,
num_serie char(4) not null,
primary key (dni,num_serie),
comienzo date,
fin date,
foreign key (dni)
references investigadores(dni)
on delete cascade on update cascade,
foreign key (num_serie)
references equipos(num_serie)
on delete cascade on update cascade
);