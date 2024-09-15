-- USUARIO
CREATE SEQUENCE incUsr START WITH 1 INCREMENT BY 1;

CREATE TABLE USUARIO (
    Id NUMBER PRIMARY KEY,
    Usuario VARCHAR(20),
    Email VARCHAR(35),
    Password VARCHAR(20)
);

CREATE OR REPLACE TRIGGER incUsr
BEFORE INSERT ON USUARIO
FOR EACH ROW
BEGIN
    :NEW.Id := incUsr.NEXTVAL;
END;

-- CUENTA
CREATE SEQUENCE incCta START WITH 1 INCREMENT BY 1;

CREATE TABLE CUENTA (
    Id NUMBER PRIMARY KEY,
    NoCuenta VARCHAR(20) UNIQUE,
    Saldo NUMBER,
    UsuarioId NUMBER,
    CONSTRAINT FkUsuario
        FOREIGN KEY (UsuarioId)
        REFERENCES Usuario (Id)
);

CREATE OR REPLACE TRIGGER incCta
BEFORE INSERT ON CUENTA
FOR EACH ROW
BEGIN
    :NEW.Id := incCta.NEXTVAL;
END;

-- INSERTS
-- Usuarios
INSERT INTO USUARIO (Usuario, Email, Password) VALUES ('Brandon Tejaxun', 'br@gmail.com', 'hello');
INSERT INTO USUARIO (Usuario, Email, Password) VALUES ('Israel Ajsivinac', 'aj@gmail.com', 'hello');
INSERT INTO USUARIO (Usuario, Email, Password) VALUES ('Andres Agosto', 'aa@gmail.com', 'hello');

INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('123', 100.00, 1);
INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('159', 2000.00, 1);
INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('456', 300.00, 2);
INSERT INTO CUENTA (NoCuenta, Saldo, UsuarioId) VALUES ('789', 150.00, 3);



-- consultas B�sicas
DROP TABLE USUARIO;
DROP TABLE CUENTA;
DROP SEQUENCE incUsr;
DROP SEQUENCE incCta;
SELECT * FROM USUARIO;
SELECT * FROM CUENTA;

-- CONSULTAS 'CUENTA ID'
SELECT 
    u.Usuario   AS "Nombre de Usuario",
    c.NoCuenta  AS "Numero de Cuenta", 
    c.Saldo     AS "Saldo de Cuenta"
FROM CUENTA c
JOIN USUARIO u ON c.UsuarioId = u.Id
WHERE u.Usuario = 'Brandon Tejaxun';


