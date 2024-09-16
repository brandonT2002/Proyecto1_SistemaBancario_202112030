CREATE OR REPLACE TRIGGER incClt
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    :NEW.Id_cliente := incClt.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incTjt
BEFORE INSERT ON TARJETA
FOR EACH ROW
BEGIN
    :NEW.Id_tarjeta := incTjt.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incPst
BEFORE INSERT ON PRESTAMO
FOR EACH ROW
BEGIN
    :NEW.Id_prestamo := incPst.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incCta
BEFORE INSERT ON CUENTA
FOR EACH ROW
BEGIN
    :NEW.Id := incCta.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incTrn
BEFORE INSERT ON TRANSACCION
FOR EACH ROW
BEGIN
    :NEW.Id_transaccion := incTrn.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incAgs
BEFORE INSERT ON AGENCIA_SUCURSAL
FOR EARCH ROW
BEGIN
    :NEW.Id_agencia := incAgs.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incEmp
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
    :NEW.Id_empleado := incEmp.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER incRol
BEFORE INSERT ON ROL
FOR EACH ROW
BEGIN
    :NEW.Id_rol := incRol.NEXTVAL;
END;