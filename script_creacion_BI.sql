USE GD1C2024;
GO

----------------------------------------BORRAR INDICES----------------------------------------
--...

----------------------------------------BORRAR VISTAS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_CANTIDAD_UNIDADES_PROMEDIO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CANTIDAD_UNIDADES_PROMEDIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_ANUAL_VENTAS', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_ANUAL_VENTAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_VENTAS_POR_TURNO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_VENTAS_POR_TURNO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_APLICADO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_APLICADO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_ENVIOS_POR_RANGO_ETARIO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_ENVIOS_POR_RANGO_ETARIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_LOCALIDADES_MAYOR_COSTO_ENVIO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_LOCALIDADES_MAYOR_COSTO_ENVIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_SUCURSALES_MAYOR_PAGOS_CUOTAS', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_SUCURSALES_MAYOR_PAGOS_CUOTAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_MEDIOS_PAGO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_MEDIOS_PAGO
GO

----------------------------------------BORRAR TABLAS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS
GO

----------------------------------------BORRAR DIMENSIONES----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS
GO

----------------------------------------BORRAR PROCEDURES----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_TIEMPO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TIEMPO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_UBICACION' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_SUCURSAL' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_RANGO_ETARIO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_TURNO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_MEDIOS_PAGO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_CATEGORIAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIAS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_SUBCATEGORIAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_BI_DIM_SUBCATEGORIAS;

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_Ticket_A_BI_TICKETS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_Ticket_A_BI_TICKETS;
GO

----------------------------------------CREAR DIMENSIONES----------------------------------------

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO (
    tiempo_id DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	tiempo_anio INT NOT NULL,
	tiempo_mes INT NOT NULL,
	tiempo_cuatrimestre INT NOT NULL
);
GO

ALTER TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
	ADD CONSTRAINT check_tiempo_mes CHECK (tiempo_mes > 0 AND tiempo_mes < 12);
ALTER TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
	ADD CONSTRAINT check_tiempo_cuatrimestre CHECK (tiempo_cuatrimestre IN (1, 2, 3, 4));
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION (
    ubi_id DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	ubi_provincia NVARCHAR(255) NOT NULL,
	ubi_localidad NVARCHAR(255) NOT NULL
);
GO

--Igual a la tabla Sucursal que ya existe? Esto esta bien?
--Por ahi no hace falta crear una tabla BI_DIM, se puede usar la que ya existe.
--Pasa que no sería una migracion total al modelo de BI.
--Creo que aunque sea un duplicado 100%, hay que migrarla así.
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL (
    suc_numero INT PRIMARY KEY ,
    suc_nombre NVARCHAR(255),
    suc_direccion NVARCHAR(255),
    suc_localidad NVARCHAR(255),
    suc_provincia NVARCHAR(255),
    id_supermercado DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Supermercado(super_id)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(
	rango_etario_id INT IDENTITY(1,1) PRIMARY KEY,
	rango_etario NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO(
	turno_id INT IDENTITY(1,1) PRIMARY KEY,
	turno NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(
	mp_id INT IDENTITY(1,1) PRIMARY KEY,
	mp_detalle NVARCHAR(255) NOT NULL,
	mp_tipo NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS(
	cat_id INT IDENTITY(1,1) PRIMARY KEY,
	cat_detalle NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS(
	subcat_id INT IDENTITY(1,1) PRIMARY KEY,
	subcat_detalle NVARCHAR(255) NOT NULL
)
GO

----------------------------------------CREAR TABLAS----------------------------------------

--Podría haber que separar el modelo BI por:
--VENTAS
--PAGOS
--PROMOCIONES
--ENVIOS

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS (
    ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    ticket_numero DECIMAL(18,0),
    ticket_emp_legajo INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Empleado(emp_legajo),
    ticket_fecha_hora_venta DATETIME,
    ticket_caja_id DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Caja(id_caja),
    ticket_tipo_comprobante NVARCHAR(255),
    ticket_subtotal_productos DECIMAL(18,2),
    ticket_total_descuento_aplicado DECIMAL(18,2),
    ticket_total_descuento_aplicado_mp DECIMAL(18,2),
    ticket_total_envio DECIMAL(18,2),
    ticket_total_ticket DECIMAL(18,2)
);
GO

----------------------------------------CREAR INDICES----------------------------------------
--...

----------------------------------------CREAR PROCEDURES----------------------------------------
CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario)
	SELECT DISTINCT
		(case
			when DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) < 25 then '<25'
			when DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) between 25 and 35 then '25-35'
			when DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) between 35 and 55 then '35-55'
			when DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) > 55 then '>55'
		end)
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Cliente C
	UNION
	SELECT DISTINCT
		(case
			when DATEDIFF(YEAR, E.emp_fecha_nacimiento, GETDATE()) < 25 then '<25'
			when DATEDIFF(YEAR, E.emp_fecha_nacimiento, GETDATE()) between 25 and 35 then '25-35'
			when DATEDIFF(YEAR, E.emp_fecha_nacimiento, GETDATE()) between 35 and 55 then '35-55'
			when DATEDIFF(YEAR, E.emp_fecha_nacimiento, GETDATE()) > 55 then '>55'
		end)
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Empleado E
END
GO


CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO(turno)
	SELECT DISTINCT
		(CASE
			WHEN CONVERT(TIME, T.ticket_fecha_hora_venta) >= '08:00:00' AND CONVERT(TIME, T.ticket_fecha_hora_venta) < '12:00:01' THEN '08:00 - 12:00'
			WHEN CONVERT(TIME, T.ticket_fecha_hora_venta) >= '12:00:01' AND CONVERT(TIME, T.ticket_fecha_hora_venta) < '16:00:01' THEN '12:00 - 16:00'
			WHEN CONVERT(TIME, T.ticket_fecha_hora_venta) >= '16:00:00' AND CONVERT(TIME, T.ticket_fecha_hora_venta) <= '20:00:00' THEN '16:00 - 20:00'
			ELSE 'VENTA FUERA DE TURNO'
		END)
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
END
GO




CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_Ticket_A_BI_TICKETS
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS (
        ticket_numero, 
        ticket_emp_legajo, 
        ticket_fecha_hora_venta, 
        ticket_caja_id, 
        ticket_tipo_comprobante, 
        ticket_subtotal_productos, 
        ticket_total_descuento_aplicado, 
        ticket_total_descuento_aplicado_mp, 
        ticket_total_envio, 
        ticket_total_ticket
    )
    SELECT 
        ticket_numero, 
        ticket_emp_legajo, 
        ticket_fecha_hora_venta, 
        ticket_caja_id, 
        ticket_tipo_comprobante, 
        ticket_subtotal_productos, 
        ticket_total_descuento_aplicado, 
        ticket_total_descuento_aplicado_mp, 
        ticket_total_envio, 
        ticket_total_ticket
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket;
END;
GO



----------------------------------------EXEC PROCEDURES----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_Ticket_A_BI_TICKETS;
GO

----------------------------------------VIEWS SIMPLES----------------------------------------
--LISTADO DE VISTAS:
--TICKET_PROMEDIO_MENSUAL
--CANTIDAD_UNIDADES_PROMEDIO
--PORCENTAJE_ANUAL_VENTAS
--VENTAS_POR_TURNO
--PORCENTAJE_DESCUENTO_APLICADO
--CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
--PORCENTAJE_CUMPLIMIENTO_ENVIOS
--ENVIOS_POR_RANGO_ETARIO
--LOCALIDADES_MAYOR_COSTO_ENVIO
--SUCURSALES_MAYOR_PAGOS_CUOTAS
--PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO
--PORCENTAJE_DESCUENTO_MEDIOS_PAGO



--TICKET_PROMEDIO_MENSUAL
--Valor promedio de las ventas (en $) según la
--localidad, año y mes. Se calcula en función de la sumatoria del importe de las
--ventas sobre el total de las mismas.

CREATE VIEW V_TICKET_PROMEDIO_MENSUAL AS
SELECT
	S.suc_localidad AS Localidad, --sacarlo de la dimension
	YEAR(T.ticket_fecha_hora_venta) AS Año, --sacarlo de la dimension
	MONTH(T.ticket_fecha_hora_venta) AS Mes, --sacarlo de la dimension
	ROUND(AVG(T.ticket_total_ticket), 2) AS Promedio_Venta
FROM 
	CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
	INNER JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja C ON T.ticket_caja_id = C.id_caja
	INNER JOIN CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S ON C.id_sucursal = S.suc_numero
GROUP BY 
	S.suc_localidad, 
	YEAR(T.ticket_fecha_hora_venta), 
	MONTH(T.ticket_fecha_hora_venta)
GO

select * from dbo.V_TICKET_PROMEDIO_MENSUAL;

--PARA MI, cuando migramos Tickets, hay que ponerle el ID de la sucursal, y no traernos nada de la info de la caja. No nos importa

----------------------------------------

--CANTIDAD_UNIDADES_PROMEDIO
--Cantidad promedio de artículos que se venden en función de los tickets según el turno
--para cada cuatrimestre de cada año. Se obtiene sumando la cantidad de artículos de
--todos los tickets correspondientes sobre la cantidad de tickets. Si un producto tiene
--más de una unidad en un ticket, para el indicador se consideran todas las unidades.

--CREATE VIEW CANTIDAD_UNIDADES_PROMEDIO AS
--SELECT * FROM TABLA123;

----------------------------------------

--PORCENTAJE_ANUAL_VENTAS
--Porcentaje anual de ventas registradas por rango etario del empleado según el
--tipo de caja para cada cuatrimestre. Se calcula tomando la cantidad de ventas
--correspondientes sobre el total de ventas anual.

--CREATE VIEW PORCENTAJE_ANUAL_VENTAS AS
--SELECT * FROM TABLA123;

----------------------------------------

--VENTAS_POR_TURNO
--Cantidad de ventas registradas por turno para cada localidad según el mes de cada año.

--CREATE VIEW VENTAS_POR_TURNO AS
--SELECT * FROM TABLA123;

----------------------------------------

--PORCENTAJE_DESCUENTO_APLICADO
--Porcentaje de descuento aplicados en función del total de los tickets según el mes de cada año.

--CREATE VIEW PORCENTAJE_DESCUENTO_APLICADO AS
--SELECT * FROM TABLA123;

----------------------------------------

--CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
--Las tres categorías de productos con mayor descuento aplicado a partir de
--promociones para cada cuatrimestre de cada año.

--CREATE VIEW CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES AS
--SELECT * FROM TABLA123;

----------------------------------------

--PORCENTAJE_CUMPLIMIENTO_ENVIOS
--Porcentaje de cumplimiento de envíos en los tiempos programados por sucursal por año/mes (desvío)

--CREATE VIEW PORCENTAJE_CUMPLIMIENTO_ENVIOS AS
--SELECT * FROM TABLA123;

----------------------------------------

--ENVIOS_POR_RANGO_ETARIO
--Cantidad de envíos por rango etario de clientes para cada cuatrimestre de cada año.

--CREATE VIEW ENVIOS_POR_RANGO_ETARIO AS
--SELECT * FROM TABLA123;

----------------------------------------

--LOCALIDADES_MAYOR_COSTO_ENVIO
--Las 5 localidades (tomando la localidad del cliente) con mayor costo de envío.

--CREATE VIEW LOCALIDADES_MAYOR_COSTO_ENVIO AS
--SELECT * FROM TABLA123;

----------------------------------------

--SUCURSALES_MAYOR_PAGOS_CUOTAS
--Las 3 sucursales con el mayor importe de pagos en cuotas, según el medio de pago,
--mes y año. Se calcula sumando los importes totales de todas las ventas en cuotas.

--CREATE VIEW SUCURSALES_MAYOR_PAGOS_CUOTAS AS
--SELECT * FROM TABLA123;

----------------------------------------

--PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO
--Promedio de importe de la cuota en función del rango etario del cliente.

--CREATE VIEW PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO AS
--SELECT * FROM TABLA123;

----------------------------------------

--PORCENTAJE_DESCUENTO_MEDIOS_PAGO
--Porcentaje de descuento aplicado por cada medio de pago en función del valor
--de total de pagos sin el descuento, por cuatrimestre. Es decir, total de descuentos
--sobre el total de pagos más el total de descuentos.

--CREATE VIEW PORCENTAJE_DESCUENTO_MEDIOS_PAGO AS
--SELECT * FROM TABLA123;

