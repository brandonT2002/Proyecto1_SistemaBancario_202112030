# **Proyecto1 - Sistema Bancario PJ Morgan**

> Brandon Tejaxún - 202112030

<div align="center" style="display:flex;justify-content:center;gap:20px">
 <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=git" />
    <img src="https://www.svgrepo.com/show/448245/oracle.svg" style="background-color: #242938;border-radius:10px;padding:5px;" width="40" />
  </a>
</div>

## **Estructura Operacional**

1. Clientes
    * 1 millón registrados
    * Cuentas:
        * Monetaria
        * Ahorro
        * Corriente

2. Transacciones
    * 500k transacciones
    * Tipo:
        * Depósitos
        * Retiros
        * Transferencias
        * Pagos

3. Préstamos
    * 100k otorgados
        * 5k - 1M
        * Interés: 3% - 15%

4. Tarjetas de Crédito
    * 100k emitidas
    * Límites:
        * Crédito
        * Saldo
        * Fecha de emisión
        * Fecha de expiración
        * Ciclos de facturación

5. Sucursales/Agencias
    * 1.1k sucursales
    * 3k agencias

6. Empleados
    * 11k empleados

## **Requisitos Funcionales**

1. Registro de Usuarios

2. Procesamiento de Pagos
    * Tarjetas
        * Crédito
        * Débito
    * Transferencias

3. Historial de Transacciones

4. Autenticación y autorización de usuarios

5.  Gestión de Cuentas
    * Crear
    * Actualizar
        * Datos personales
        * Retiros/Transferencias
    * Consultar

6. Procesamiento de Préstamos
    * Solicitudes de préstamos
    * Pagos
    * Registro de balances

7. Gestión de Tarjetas
    * Registro
    * Administración
    * Emisión
    * Pagos de saldo
    * Generación de estados de cuenta

## **Casos de Uso**

1. Cliente
    * Registrar nueva cuenta
    * Consultar saldo de cuentas
    * Realizar depósitos y retiros
    * Transferir dinero entre cuentas
    * Solicitar préstamos
    * Administrar tarjetas de crédito
    * Consultar historial de transacciones

2. Gerente de Sucursal
    * Aprobar solicitudes de préstamos
    * Emitir tarjetas de crédito
    * Gestionar cuentas de clientes
    * Supervisar las operaciones diarias de la sucursal
    * Asignar y gestionar empleados

3. Asesor Financiero
    * Ofrecer asesorias sobre productos financieros
    * Procesar solicitudes de préstamos
    * Gestionar inversiones y seguros para los clientes
    * Proporcionar recomendaciones personalizadas basada en el perfil del cliente

4. Cajero
    * Procesar depósitos y registros de clientes
    * Gestionar pagos de servicios
    * Realizar transferencias entre cuentas

5. Administrador
    * Auditar todas las operaciones del sistema
    * Supervisar el cumplimiento normativo
    * Gestionar los reportes de rendimiento y las estadísticas del banco
    * Gestionar la seguridad del sistema y los accesos

## **Entidades**

| Cliente   |
| -         |
| Nombre    |
| Apellido  |
| Dirección |
| Teléfono  |

<br>

| Cuenta    |
| -         |
| No Cuenta |
| Tipo      |
| Saldo     |

<br>

| Transaccion |
| -           |
| Tipo        |
| Monto       |
| Fecha       |
| Descripcion |

<br>

| Préstamos   |
| -           |
| Estado      |
| Monto       |
| Interes     |
| Fecha       |

<br>

| Tarjeta        |
| -              |
| No. Tarjeta    |
| Tipo           |
| Saldo          |
| F. emisión     |
| F. vencimiento |

<br>

| Empleados      |
| -              |
| Nombre         |
| Apellido       |
| DPI            |

<br>

| Empleados      |
| -              |
| Nombre         |
| Apellido       |
| DPI            |
| Rol            |

<br>

| Sucursal_Agencia |
| -                |
| Nombre           |
| Municipio        |
| Departamento     |