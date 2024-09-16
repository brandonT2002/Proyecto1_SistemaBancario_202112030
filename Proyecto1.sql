-- CLIENTE
CREATE SEQUENCE incClt START WITH 1 INCREMENT BY 1;

CREATE TABLE CLIENTE (
    Id_cliente  NUMBER       NOT NULL PRIMARY KEY,
    Nombre      VARCHAR2(20) NOT NULL,
    Apellido    VARCHAR2(20) NOT NULL,
    Telefono    VARCHAR2(15) NOT NULL
);

CREATE OR REPLACE TRIGGER incClt
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    :NEW.Id_cliente := incClt.NEXTVAL;
END;

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

CREATE OR REPLACE TRIGGER incCta
BEFORE INSERT ON CUENTA
FOR EACH ROW
BEGIN
    :NEW.Id := incCta.NEXTVAL;
END;

-- INSERTS
-- Usuarios
INSERT INTO CLIENTE (CLIENTE, Email, Password) VALUES ('Brandon Tejaxun', 'br@gmail.com', 'hello');
INSERT INTO CLIENTE (CLIENTE, Email, Password) VALUES ('Israel Ajsivinac', 'aj@gmail.com', 'hello');
INSERT INTO CLIENTE (CLIENTE, Email, Password) VALUES ('Andres Agosto', 'aa@gmail.com', 'hello');

INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('123', 100.00, 1);
INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('159', 2000.00, 1);
INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('456', 300.00, 2);
INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('789', 150.00, 3);



-- consultas Basicas
DROP TABLE CLIENTE;
DROP TABLE CUENTA;
DROP SEQUENCE incClt;
DROP SEQUENCE incCta;
SELECT * FROM CLIENTE;
SELECT * FROM CUENTA;

-- CONSULTAS 'CUENTA ID'
SELECT 
    u.CLIENTE   AS "Nombre de CLIENTE",
    c.NoCuenta  AS "Numero de Cuenta", 
    c.Saldo     AS "Saldo de Cuenta"
FROM CUENTA c
JOIN CLIENTE u ON c.UsuarioId = u.Id
WHERE u.CLIENTE = 'Brandon Tejaxun';


