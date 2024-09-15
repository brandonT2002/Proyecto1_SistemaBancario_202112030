-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-15 05:04:44 CST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE agencia_sucursal (
    id_agencia    NUMBER NOT NULL,
    nombre        VARCHAR2(35) NOT NULL,
    tipo          VARCHAR2(10) NOT NULL,
    departamento  VARCHAR2(20) NOT NULL,
    municipio     VARCHAR2(20) NOT NULL,
    direccion     VARCHAR2(10) NOT NULL,
    codigo_postal VARCHAR2(5) NOT NULL,
    telefono      VARCHAR2(15) NOT NULL
);

ALTER TABLE agencia_sucursal ADD CONSTRAINT agencia_sucursal_pk PRIMARY KEY ( id_agencia );

CREATE TABLE asesor (
    id_asesor            NUMBER NOT NULL,
    empleado_id_empleado NUMBER NOT NULL
);

ALTER TABLE asesor ADD CONSTRAINT asesor_pk PRIMARY KEY ( id_asesor );

CREATE TABLE cajero (
    id_cajero            NUMBER NOT NULL,
    empleado_id_empleado NUMBER NOT NULL
);

ALTER TABLE cajero ADD CONSTRAINT cajero_pk PRIMARY KEY ( id_cajero );

CREATE TABLE cliente (
    nombre     VARCHAR2(20) NOT NULL,
    apellido   VARCHAR2(20) NOT NULL,
    telefono   VARCHAR2(15) NOT NULL,
    id_cliente NUMBER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE cuenta (
    tipo               VARCHAR2(20) NOT NULL,
    saldo              NUMBER(20) NOT NULL,
    id_cuenta          VARCHAR2(20) NOT NULL,
    cliente_id_cliente NUMBER NOT NULL
);

ALTER TABLE cuenta ADD CONSTRAINT cuenta_pk PRIMARY KEY ( id_cuenta );

CREATE TABLE empleado (
    id_empleado                 NUMBER NOT NULL,
    nombre                      VARCHAR2(35) NOT NULL,
    apellido                    VARCHAR2(35) NOT NULL,
    rol                         VARCHAR2(20) NOT NULL,
    departamento                VARCHAR2(20) NOT NULL,
    agrencia_sucursal           VARCHAR2(35) NOT NULL,
    telefono                    VARCHAR2(15) NOT NULL,
    agencia_sucursal_id_agencia NUMBER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE gerente (
    id_gerente           NUMBER NOT NULL,
    empleado_id_empleado NUMBER NOT NULL
);

ALTER TABLE gerente ADD CONSTRAINT gerente_pk PRIMARY KEY ( id_gerente );

CREATE TABLE prestamo (
    id_prestamo        NUMBER NOT NULL,
    monto              NUMBER(20) NOT NULL,
    interes            NUMBER(2, 2) NOT NULL,
    fecha_desembolso   DATE NOT NULL,
    fecha_vencimiento  DATE NOT NULL,
    saldo_pendiente    NUMBER(20) NOT NULL,
    estado             VARCHAR2(10) NOT NULL,
    cliente_id_cliente NUMBER NOT NULL
);

ALTER TABLE prestamo ADD CONSTRAINT prestamo_pk PRIMARY KEY ( id_prestamo );

CREATE TABLE tarjeta (
    id_tarjeta         NUMBER NOT NULL,
    no_tarjeta         VARCHAR2(16) NOT NULL,
    limite_credito     NUMBER(20) NOT NULL,
    saldo_actual       NUMBER(20) NOT NULL,
    fecha_emision      DATE NOT NULL,
    fecha_expiracion   DATE NOT NULL,
    estado             VARCHAR2(10) NOT NULL,
    fecha_corte        DATE NOT NULL,
    dia_ciclo          NUMBER(2) NOT NULL,
    cliente_id_cliente NUMBER NOT NULL
);

ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_pk PRIMARY KEY ( id_tarjeta );

CREATE TABLE transaccion (
    id_transaccion              NUMBER(20) NOT NULL,
    tipo                        VARCHAR2(20) NOT NULL,
    monto                       NUMBER(20) NOT NULL,
    fecha                       DATE NOT NULL,
    hora                        TIMESTAMP NOT NULL,
    descripcion                 VARCHAR2(35),
    cuenta_id_cuenta            VARCHAR2(20) NOT NULL,
    agencia_sucursal_id_agencia NUMBER NOT NULL
);

ALTER TABLE transaccion ADD CONSTRAINT transaccion_pk PRIMARY KEY ( id_transaccion );

ALTER TABLE asesor
    ADD CONSTRAINT asesor_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE cajero
    ADD CONSTRAINT cajero_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE cuenta
    ADD CONSTRAINT cuenta_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_agencia_sucursal_fk FOREIGN KEY ( agencia_sucursal_id_agencia )
        REFERENCES agencia_sucursal ( id_agencia );

ALTER TABLE gerente
    ADD CONSTRAINT gerente_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE prestamo
    ADD CONSTRAINT prestamo_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE tarjeta
    ADD CONSTRAINT tarjeta_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_agencia_sucursal_fk FOREIGN KEY ( agencia_sucursal_id_agencia )
        REFERENCES agencia_sucursal ( id_agencia );

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_cuenta_fk FOREIGN KEY ( cuenta_id_cuenta )
        REFERENCES cuenta ( id_cuenta );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
