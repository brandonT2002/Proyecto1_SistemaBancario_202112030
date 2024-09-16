-- INSERTS
-- Usuarios
INSERT INTO CLIENTE (Nombre, Apellido, Telefono) VALUES ('Brandon', 'Tejaxun', '+502 5480-1007');
INSERT INTO CLIENTE (Nombre, Apellido, Telefono) VALUES ('Israel', 'Ajsivinac', '+502 4634-7041');
INSERT INTO CLIENTE (Nombre, Apellido, Telefono) VALUES ('Andres', 'Agosto', '+502 2701-1140');

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


