create table usuario (
    id_usario int(5) PRIMARY KEY,
    rut varchar(10),
    nombre varchar(40),
    apellido_p varchar(20),
    apellido_m varchar(20),
    email varchar(100),
    password varchar(12),
    rol varchar(35)
    );

create table contrato (
    id_contrato int(5) PRIMARY KEY,
    id_usuario_trabajador int(5),
    fecha_inicio date,
    fecha_expiracion date,
    tipo_contrato varchar(30),
    contenido_contrato LONGBLOB,
    estado varchar(15),
    comentario varchar(500),
    FOREIGN KEY(id_usuario_trabajador) references usuario(id_usario)
);

create table historial_contrato (
    id_historial_contrato int(5) PRIMARY KEY,
    id_contrato int(5),
    estado_anterior varchar(15),
    estado_nuevo varchar(15),
    fecha_cambio date,
    foreign key(id_contrato) references contrato(id_contrato)
);
