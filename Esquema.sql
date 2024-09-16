-- CLIENTE
CREATE SEQUENCE incClt START WITH 1 INCREMENT BY 1;

CREATE TABLE CLIENTE (
    Id_cliente  NUMBER       NOT NULL PRIMARY KEY,
    Nombre      VARCHAR2(20) NOT NULL,
    Apellido    VARCHAR2(20) NOT NULL,
    Telefono    VARCHAR2(15) NOT NULL
);

-- TARJETA
CREATE SEQUENCE incTjt START WITH 1 INCREMENT BY 1;

CREATE TABLE TARJETA (
    Id_tarjeta          NUMBER       NOT NULL PRIMARY KEY,
    No_tarjeta          VARCHAR2(20) NOT NULL UNIQUE,
    Limite_credito      NUMBER(20)   NOT NULL,
    Saldo_actual        NUMBER(20)   NOT NULL,
    Fecha_vencimiento   DATE         NOT NULL,
    Fecha_expiracion    DATE         NOT NULL,
    Estado              VARCHAR2(10) NOT NULL,
    Fecha_corte         DATE         NOT NULL,
    Dia_ciclo           NUMBER       NOT NULL,
    Id_cliente          NUMBER       NOT NULL,
    CONSTRAINT Fk_Cliente
        FOREIGN KEY (Id_cliente)
        REFERENCES CLIENTE(Id_cliente),
    CONSTRAINT Fk_Cuenta
        FOREIGN KEY (Id_cuenta)
        REFERENCES CUENTA(Id_cuenta)
);

-- PRESTAMO
CREATE SEQUENCE incPst START WITH 1 INCREMENT BY 1;

CREATE TABLE PRESTAMO (
    Id_prestamo         NUMBER       NOT NULL PRIMARY KEY,
    Monto               NUMBER(20)   NOT NULL,
    Interes             NUMBER(2,2)  NOT NULL,
    Fecha_desembolso    DATE         NOT NULL,
    Fecha_vencimiento   DATE         NOT NULL,
    Saldo_pendiente     NUMBER(20)   NOT NULL,
    Estado              VARCHAR2(10) NOT NULL,
    Id_cliente          NUMBER       NOT NULL,
    Id_empleado         NUMBER       NOT NULL,
    CONSTRAINT Fk_Cliente
        FOREIGN KEY (Id_cliente)
        REFERENCES CLIENTE(Id_cliente),
    CONSTRAINT Fk_Empleado
        FOREIGN KEY (Id_empleado)
        REFERENCES EMPLEADO(Id_empleado)
);

-- CUENTA
CREATE SEQUENCE incCta START WITH 1 INCREMENT BY 1;

CREATE TABLE CUENTA (
    Id_cuenta           NUMBER       NOT NULL PRIMARY KEY,
    No_cuenta           VARCHAR2(20) NOT NULL UNIQUE,
    Tipo                VARCHAR2(20) NOT NULL,
    Saldo               NUMBER(20)   NOT NULL,
    Cliente_id_cliente  NUMBER       NOT NULL,
    CONSTRAINT Fk_Cliente
        FOREIGN KEY (Cliente_id_cliente)
        REFERENCES CLIENTE(Id_cliente)
);

-- TRANSACCION
CREATE SEQUENCE incTrn START WITH 1 INCREMENT BY 1;

CREATE TABLE TRANSACCION (
    Id_transaccion              NUMBER       NOT NULL PRIMARY KEY,
    Tipo                        VARCHAR2(20) NOT NULL,
    Monto                       NUMBER(20)   NOT NULL,
    Fecha                       DATE         NOT NULL,
    Hora                        TIMESTAMP    NOT NULL,
    Descripcion                 VARCHAR2(35),
    Id_cuenta                   NUMBER       NOT NULL,
    Id_agencia                  NUMBER       NOT NULL,
    Id_cliente                  NUMBER       NOT NULL,
    Id_empleado                 NUMBER       NOT NULL,
    CONSTRAINT FK_Cuenta
        FOREIGN KEY (Id_cuenta)
        REFERENCES CUENTA(Id_cuenta),
    CONSTRAINT FK_Agencia
        FOREIGN KEY (Id_agencia)
        REFERENCES AGENCIA_SUCURSAL(Id_agencia),
    CONSTRAINT FK_Cliente
        FOREIGN KEY (Id_cliente)
        REFERENCES CLIENTE(Id_cliente),
    CONSTRAINT FK_Empleado
        FOREIGN KEY (Id_empleado)
        REFERENCES EMPLEADO(Id_empleado)
);

-- AGENCIA SUCURSAL
CREATE SEQUENCE incAgs START WITH 1 INCREMENT BY 1;

CREATE TABLE AGENCIA_SUCURSAL (
    Id_agencia           NUMBER       NOT NULL PRIMARY KEY,
    Nombre               VARCHAR2(35) NOT NULL,
    Tipo                 VARCHAR2(10) NOT NULL,
    Departamento         VARCHAR2(20) NOT NULL,
    Municipio            VARCHAR2(20) NOT NULL,
    Direccion            VARCHAR2(20) NOT NULL,
    Codigo_postal        VARCHAR2(5)  NOT NULL,
    Telefono             VARCHAR2(15) NOT NULL
);

-- EMPLEADO
CREATE SEQUENCE incEmp START WITH 1 INCREMENT BY 1;

CREATE TABLE EMPLEADO (
    Id_empleado  NUMBER       NOT NULL PRIMARY KEY,
    Nombre       VARCHAR2(20) NOT NULL,
    Apellido     VARCHAR2(20) NOT NULL,
    Rol          VARCHAR2(20) NOT NULL,
    Telefono     VARCHAR2(15) NOT NULL,
    Id_agencia   NUMBER       NOT NULL,
    Id_rol       NUMBER       NOT NULL,
    CONSTRAINT Fk_Agencia
        FOREIGN KEY (Id_agencia)
        REFERENCES AGENCIA_SUCURSAL(Id_agencia),
    CONSTRAINT Fk_Rol
        FOREIGN KEY (Id_rol)
        REFERENCES ROL(Id_rol)
);

-- ROL
CREATE SEQUENCE incRol START WITH 1 INCREMENT BY 1;

CREATE TABLE ROL (
    Id_rol  NUMBER       NOT NULL PRIMARY KEY,
    Rol     VARCHAR2(20) NOT NULL
);