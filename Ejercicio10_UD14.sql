create table cajeros(
codigo int auto_increment not null primary key,
nom_apels nvarchar(255) 
);

create table productos(
codigo int auto_increment not null primary key,
nombre nvarchar(100),
precio int
);

create table maquinas_registradoras(
codigo int auto_increment not null primary key,
piso int
);

create table venta(
cajero int not null,
maquina int not null,
producto int not null,
primary key (cajero,maquina,producto),
foreign key (cajero)
references cajeros(codigo)
on delete cascade on update cascade,
foreign key (maquina)
references maquinas_registradoras(codigo)
on delete cascade on update cascade,
foreign key (producto)
references productos(codigo)
on delete cascade on update cascade
);