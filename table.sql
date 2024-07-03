/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02-07-2024 23:09:04                          */
/*==============================================================*/

/* Create tables with varchar instead of char where appropriate */
create table ANEXO
(
   ID_ANEXO             varchar(6) not null,
   ID_CONTRATO          varchar(6) not null,
   PDF_ANEXO            varchar(255),
   CAMBIO_ANEXO         varchar(50),
   primary key (ID_ANEXO)
);

create table CONTENIDO_CONTRATO
(
   ID_CC                varchar(6) not null,
   ID_CONTRATO          varchar(6) not null,
   NOMBRES              varchar(50),
   APELLIDOS            varchar(50),
   DIRECCION            varchar(100),
   ESTADO_CIVIL         varchar(20),
   FECHA_NACIMIENTO     date,
   RUT                  varchar(10),
   MAIL                 varchar(100),
   NACIONALIDAD         varchar(30),
   SISTEMA_SALUD        varchar(10),
   AFP                  varchar(30),
   NOMBRE_EMPLEADOR     varchar(100),
   RUT_EMPLEADOR        varchar(10),
   CARGO                varchar(50),
   FECHA_INICIO         date,
   FECHA_FINAL          date,
   INDEFINIDO           TINYINT(1),
   SUELDO_BASE          numeric(10,0),
   ASIGNACIO_COLACION   numeric(10,0),
   BONO_ASISTENCIA      numeric(10,0),
   primary key (ID_CC)
);

create table CONTRATO
(
   ID_CONTRATO          varchar(6) not null,
   TIPO_CONTRATO        varchar(50),
   FECHA_INICIO         date,
   FECHA_EXPIRACION     date,
   COMENTARIO           varchar(500),
   ESTADO               varchar(15),
   REVISION_GERENTE     TINYINT(1),
   REVISION_GERENTE_GENERAL TINYINT(1),
   ULTIMO_REVISOR       varchar(50),
   FECHA_ULTIMA_REVISION date,
   CONTRATO             varchar(255),
   primary key (ID_CONTRATO)
);

create table CREA
(
   ID_CONTRATO          varchar(6) not null,
   ID_USUARIO           varchar(6) not null,
   FECHA_CREACION       date
);

create table USUARIO
(
   ID_USUARIO           varchar(6) not null,
   NOMBRES              varchar(40),
   APELLIDO_P           varchar(20),
   APELLIDO_M           varchar(20),
   RUT                  varchar(10),
   PASSWORD             varchar(500),
   MAIL                 varchar(100),
   ROL                  varchar(50),
   primary key (ID_USUARIO)
);

/* Re-establish foreign key constraints */
alter table ANEXO add constraint FK_ANEXO_ANEXA_CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO) on delete restrict on update restrict;

alter table CONTENIDO_CONTRATO add constraint FK_CONTENID_CONTIENE_CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO) on delete restrict on update restrict;

alter table CREA add constraint FK_CREA_CREA_CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO) on delete restrict on update restrict;

alter table CREA add constraint FK_CREA_CREA2_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

