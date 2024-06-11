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
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA_1', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA_1
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA_2', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA_2
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA_3', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA_3
GO

----------------------------------------BORRAR DIMENSIONES----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIMENSION_2', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIMENSION_2
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIMENSION_3', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIMENSION_3
GO

----------------------------------------BORRAR PROCEDURES----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'BI_MIGRAR_TABLA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.BI_MIGRAR_TABLA;
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
	ubi_provincia DECIMAL(4,0),
	ubi_localidad DECIMAL(2,0)
);
GO

--PENDIENTE
--BI_DIM_RANGO_ETARIO
--BI_DIM_TURNOS
--BI_DIM_MEDIOS_PAGO
--BI_DIM_CATEGORIAS_PRODUCTOS ?
--BI_DIM_SUBCATEGORIAS_PRODUCTOS ?

----------------------------------------CREAR TABLAS----------------------------------------

--Podría haber que separar el modelo BI por:
--VENTAS
--PAGOS
--PROMOCIONES
--ENVIOS

----------------------------------------CREAR INDICES----------------------------------------
--...

----------------------------------------CREAR PROCEDURES----------------------------------------
CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.BI_MIGRAR_DIM_TIEMPO AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO (
		super_id
    )
    SELECT DISTINCT
		S.super_id
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Supermercado AS S
END
GO


----------------------------------------EXEC PROCEDURES----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.BI_MIGRAR_DIM_TIEMPO;


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

--CREATE VIEW TICKET_PROMEDIO_MENSUAL AS
--SELECT * FROM TABLA123;

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
