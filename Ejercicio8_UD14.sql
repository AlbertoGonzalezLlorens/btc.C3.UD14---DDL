create table piezas(
codigo int auto_increment not null primary key,
nombre nvarchar(100)
);

create table proveedores(
id char(4) not null primary key,
nombre nvarchar(100)
);

create table suministra(
codigo_pieza int not null,
id_proveedor char(4),
primary key(codigo_pieza, id_proveedor),
precio int,
foreign key (codigo_pieza)
references piezas(codigo)
on delete cascade on update cascade,
foreign key (id_proveedor)
references proveedores(id)
on delete cascade on update cascade
)