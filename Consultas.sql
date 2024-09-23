-- INSERTS
-- Roles
INSERT INTO ROL (Id_rol, Rol) VALUES (incRol.NEXTVAL, 'Gerente');
INSERT INTO ROL (Id_rol, Rol) VALUES (incRol.NEXTVAL, 'Asesor');
INSERT INTO ROL (Id_rol, Rol) VALUES (incRol.NEXTVAL, 'Cajero');

-- Clientes
INSERT INTO CLIENTE (Id_cliente, Nombre, Apellido, Telefono) VALUES (incClt.NEXTVAL,'Brandon', 'Tejaxun', '+502 5480-1007');
INSERT INTO CLIENTE (Id_cliente, Nombre, Apellido, Telefono) VALUES (incClt.NEXTVAL,'Israel', 'Ajsivinac', '+502 4634-7041');
INSERT INTO CLIENTE (Id_cliente, Nombre, Apellido, Telefono) VALUES (incClt.NEXTVAL,'Andres', 'Agosto', '+502 2701-1140');

-- Agencias/Sucursales
INSERT INTO AGENCIA_SUCURSAL (Id_agencia, Nombre, Tipo, Departamento, Municipio, Direccion, Codigo_postal, Telefono) VALUES (incAgs.NEXTVAL, 'Agencia Centro', 'Principal', 'Ciudad Central', 'Municipio A', 'Calle 1', '10001', '555-1111');
INSERT INTO AGENCIA_SUCURSAL (Id_agencia, Nombre, Tipo, Departamento, Municipio, Direccion, Codigo_postal, Telefono) VALUES (incAgs.NEXTVAL, 'Sucursal Norte', 'Sucursal', 'Departamento B', 'Municipio B', 'Avenida 2', '20002', '555-2222');

-- Cuentas
INSERT INTO CUENTA (Id_cuenta, No_cuenta, Tipo, Saldo, Cliente_id_cliente) VALUES (incCta.NEXTVAL, '1234567890', 'Ahorro', 1000.00, 1);
INSERT INTO CUENTA (Id_cuenta, No_cuenta, Tipo, Saldo, Cliente_id_cliente) VALUES (incCta.NEXTVAL, '0987654321', 'Corriente', 500.00, 2);

-- Empleados
INSERT INTO EMPLEADO (Id_empleado, Nombre, Apellido, Rol, Telefono, Id_agencia, Id_rol) VALUES (incEmp.NEXTVAL, 'Ana', 'Rodríguez', 'Gerente', '555-3333', 1, 2);
INSERT INTO EMPLEADO (Id_empleado, Nombre, Apellido, Rol, Telefono, Id_agencia, Id_rol) VALUES (incEmp.NEXTVAL, 'Luis', 'Martínez', 'Asistente', '555-4444', 2, 3);

-- Tarjetas
INSERT INTO TARJETA (Id_tarjeta, No_tarjeta, Limite_credito, Saldo_actual, Fecha_vencimiento, Fecha_expiracion, Estado, Fecha_corte, Dia_ciclo, Id_cliente) VALUES (incTjt.NEXTVAL, '1111222233334444', 5000.00, 1000.00, TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Activa', TO_DATE('2024-09-15', 'YYYY-MM-DD'), 15, 1);
INSERT INTO TARJETA (Id_tarjeta, No_tarjeta, Limite_credito, Saldo_actual, Fecha_vencimiento, Fecha_expiracion, Estado, Fecha_corte, Dia_ciclo, Id_cliente) VALUES (incTjt.NEXTVAL, '5555666677778888', 3000.00, 500.00, TO_DATE('2024-11-30', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Activa', TO_DATE('2024-09-15', 'YYYY-MM-DD'), 30, 2);

-- Prestamos
INSERT INTO PRESTAMO (Id_prestamo, Monto, Interes, Fecha_desembolso, Fecha_vencimiento, Saldo_pendiente, Estado, Id_cliente, Id_empleado) VALUES (incPst.NEXTVAL, 10000.00, 0.05, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 10000.00, 'Activo', 1, 1);
INSERT INTO PRESTAMO (Id_prestamo, Monto, Interes, Fecha_desembolso, Fecha_vencimiento, Saldo_pendiente, Estado, Id_cliente, Id_empleado) VALUES (incPst.NEXTVAL, 5000.00, 0.07, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'), 5000.00, 'Activo', 2, 2);

-- Transacciones
INSERT INTO TRANSACCION (Id_transaccion, Tipo, Monto, Fecha, Hora, Descripcion, Id_cuenta, Id_agencia, Id_cliente, Id_empleado) VALUES (incTrn.NEXTVAL, 'Depósito', 200.00, TO_DATE('2024-09-15', 'YYYY-MM-DD'), SYSTIMESTAMP, 'Depósito en efectivo', 1, 1, 1, 1);
INSERT INTO TRANSACCION (Id_transaccion, Tipo, Monto, Fecha, Hora, Descripcion, Id_cuenta, Id_agencia, Id_cliente, Id_empleado) VALUES (incTrn.NEXTVAL, 'Retiro', 50.00, TO_DATE('2024-09-16', 'YYYY-MM-DD'), SYSTIMESTAMP, 'Retiro de efectivo', 3, 2, 2, 2);

-- CONSULTAS BÁSICAS
-- Eliminar TABLAS
DROP TABLE TRANSACCION;
DROP TABLE TARJETA;
DROP TABLE PRESTAMO;
DROP TABLE CUENTA;
DROP TABLE EMPLEADO;
DROP TABLE AGENCIA_SUCURSAL;
DROP TABLE CLIENTE;
DROP TABLE ROL;

-- Eliminar SECUENCIAS
DROP SEQUENCE incRol;
DROP SEQUENCE incClt;
DROP SEQUENCE incAgs;
DROP SEQUENCE incCta;
DROP SEQUENCE incEmp;
DROP SEQUENCE incTjt;
DROP SEQUENCE incPst;
DROP SEQUENCE incTrn;

SELECT * FROM CLIENTE;
SELECT * FROM TARJETA;
SELECT * FROM PRESTAMO;
SELECT * FROM CUENTA;
SELECT * FROM TRANSACCION;
SELECT * FROM EMPLEADO;
SELECT * FROM ROL;
SELECT * FROM AGENCIA_SUCURSAL;

-- CONSULTAS 'CUENTA ID'
SELECT 
    u.Nombre || ' ' || u.Apellido   AS "Nombre",
    c.No_cuenta                     AS "Numero de Cuenta",
    c.Tipo                          AS "Tipo de Cuenta",
    c.Saldo                         AS "Saldo de Cuenta"
FROM CUENTA c
JOIN CLIENTE u ON c.Cliente_id_cliente = u.Id_cliente
WHERE u.Id_cliente = 1;

-- CONSULTAS 'TARJETA ID'
SELECT
    u.Nombre || ' ' || u.Apellido   AS "Nombre",
    t.No_tarjeta                    AS "Numero de Tarjeta",
    t.Limite_credito                AS "Limite de Credito",
    t.Saldo_actual                  AS "Saldo Actual",
    t.Fecha_vencimiento             AS "Fecha de Vencimiento"
FROM TARJETA t
JOIN CLIENTE u ON t.Id_cliente = u.Id_cliente
WHERE u.Id_cliente = 1;