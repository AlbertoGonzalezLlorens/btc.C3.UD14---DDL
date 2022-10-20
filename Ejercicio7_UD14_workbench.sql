create table despacho(
numero int auto_increment not null primary key,
capacidad int
);

create table directores(
dni varchar(8) not null primary key,
nom_apels nvarchar(255),
dnijefe varchar (8),
despacho int,
foreign key (dnijefe) references directores(dni) 
on delete set null
on update cascade,
foreign key (despacho) references despacho(numero)
on delete set null
on update cascade
);