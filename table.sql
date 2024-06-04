create table usuario (
    id_usuario int(5) PRIMARY KEY,
    rut varchar(10),
    nombres varchar(50),
    apellido_p varchar(20),
    apellido_m varchar(20),
    correo_electronico varchar(100),
    password BLOB,
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
    FOREIGN KEY(id_usuario_trabajador) references usuario(id_usuario)
);

create table historial_contrato (
    id_historial_contrato int(5) PRIMARY KEY,
    id_usuario int(5),
    estado_anterior varchar(15),
    estado_nuevo varchar(15),
    fecha_cambio date,
    foreign key(id_usuario) references usuario(id_usuario)
);

CREATE TABLE contenido_contrato (
    id_cc INT(5) PRIMARY KEY, 
    id_contrato INT(5), 
    rut VARCHAR(10), 
    nombres VARCHAR(50), 
    apellido_p VARCHAR(20), 
    apellido_m VARCHAR(20), 
    direccion VARCHAR(50), 
    estado_civil VARCHAR(15), 
    tipo_cargo VARCHAR(25), 
    inicio_contrato DATE, 
    finalizacion_contrato DATE, 
    provision_afp VARCHAR(15), 
    nacionalidad VARCHAR(15), 
    correo_electronico VARCHAR(100), 
    fecha_nacimiento DATE, 
    sistema_salud VARCHAR(15), 
    sueldo INT(10), 
    foreign key(id_contrato) references contrato(id_contrato)
); 
