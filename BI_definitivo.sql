USE GD1C2024;
GO

--PENDIENTE - TO-DO

--( ) DOCUMENTO QUE EXPLIQUE LAS TABLAS QUE CREAMOS Y JUSTIFIQUE LAS DECISIONES

----------------------------------------BORRAR VIEWS----------------------------------------
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
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTOS_MEDIOS_PAGO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTOS_MEDIOS_PAGO
GO

----------------------------------------BORRAR TABLAS DE HECHOS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS

----------------------------------------BORRAR DIMENSIONES----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
GO

----------------------------------------BORRAR PROCEDURES TABLAS----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_VENTAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_VENTAS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_ENVIOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DESCUENTOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS;
GO

----------------------------------------BORRAR PROCEDURES DIMENSIONES----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_TIEMPO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TIEMPO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_SUCURSAL' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_UBICACION' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_RANGO_ETARIO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_TURNO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_MEDIOS_PAGO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_CATEGORIAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIAS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_SUBCATEGORIAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUBCATEGORIAS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_CAJAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CAJAS;
GO

----------------------------------------BORRAR FUNCTIONS----------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id('CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario')) DROP FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id('CHRISTIAN_Y_LOS_MAKINSONS.ObtenerTurno')) DROP FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerTurno
GO

----------------------------------------CREAR DIMENSIONES----------------------------------------
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO (
    tiempo_id INT PRIMARY KEY IDENTITY(1,1),
    tiempo_anio INT NOT NULL,
    tiempo_mes INT NOT NULL,
    tiempo_cuatrimestre INT NOT NULL,
    CONSTRAINT check_tiempo_mes CHECK (tiempo_mes > 0 AND tiempo_mes <= 12),
    CONSTRAINT check_tiempo_cuatrimestre CHECK (tiempo_cuatrimestre IN (1, 2, 3))
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION (
    ubi_id INT PRIMARY KEY IDENTITY(1,1),
	ubi_provincia NVARCHAR(255) NOT NULL,
	ubi_localidad NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(
	suc_id INT PRIMARY KEY,
    suc_nombre NVARCHAR(255),
    suc_direccion NVARCHAR(255),
	suc_ubicacion INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(ubi_id)    
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(
	rango_etario_id INT IDENTITY(1,1) PRIMARY KEY,
	rango_etario NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO(
	turno_id INT IDENTITY(1,1) PRIMARY KEY,
	turno_desc NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(
	mp_cod INT PRIMARY KEY,
	mp_detalle NVARCHAR(255) NOT NULL,
	mp_tipo NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS (
    cat_id INT PRIMARY KEY,
    cat_detalle NVARCHAR(255) NOT NULL
);

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS (
    subcat_id INT PRIMARY KEY,
    subcat_detalle NVARCHAR(255) NOT NULL
);

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA (
    cat_id INT,
    subcat_id INT,
    PRIMARY KEY (cat_id, subcat_id),
    FOREIGN KEY (cat_id) REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS(cat_id),
    FOREIGN KEY (subcat_id) REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS(subcat_id)
);

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS (
	caja_id INT PRIMARY KEY,
	caja_tipo NVARCHAR(255) NOT NULL,
    sucursal_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id)
);
GO

----------------------------------------CREAR FUNCTIONS----------------------------------------
CREATE FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario (@BirthDate DATE)
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @Age INT
    DECLARE @AgeRange NVARCHAR(20)

    SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE())
           - IIF(MONTH(@BirthDate) > MONTH(GETDATE())
                     OR (MONTH(@BirthDate) = MONTH(GETDATE()) AND DAY(@BirthDate) > DAY(GETDATE())), 1, 0)
    IF @Age < 25
        SET @AgeRange = '< 25'
    ELSE IF @Age BETWEEN 25 AND 35
        SET @AgeRange = '25 - 35'
    ELSE IF @Age BETWEEN 36 AND 50
        SET @AgeRange = '35 - 50'
    ELSE
        SET @AgeRange = '> 50'

    RETURN @AgeRange
END
GO

CREATE FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerTurno (@ticket_fecha_hora_venta DATETIME)
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @TimeRange NVARCHAR(20)
    DECLARE @Time TIME = CONVERT(TIME, @ticket_fecha_hora_venta)

    IF @Time >= '08:00:00' AND @Time < '12:00:01'
        SET @TimeRange = '08:00 - 12:00'
    ELSE IF @Time >= '12:00:01' AND @Time < '16:00:01'
        SET @TimeRange = '12:00 - 16:00'
    ELSE IF @Time >= '16:00:00' AND @Time <= '20:00:00'
        SET @TimeRange = '16:00 - 20:00'
    ELSE
        SET @TimeRange = 'FUERA DE TURNO'

    RETURN @TimeRange
END
GO

----------------------------------------CREAR PROCEDURES DIMENSIONES----------------------------------------
CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TIEMPO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(
		tiempo_mes,
		tiempo_anio,
		tiempo_cuatrimestre
		)
	SELECT DISTINCT
		MONTH(T.ticket_fecha_hora_venta),
		YEAR(T.ticket_fecha_hora_venta),
		((MONTH(T.ticket_fecha_hora_venta) - 1) / 4) + 1
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION (
		ubi_localidad,
		ubi_provincia
	)
	SELECT DISTINCT localidad, provincia
	FROM
	(
		SELECT
			S.suc_localidad localidad,
			S.suc_provincia provincia
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S
	UNION
		SELECT
			C.clie_localidad localidad,
			C.clie_provincia provincia
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.Cliente C) as lplp;
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(
		suc_id,
		suc_nombre,
		suc_direccion,
		suc_ubicacion
		)
	SELECT DISTINCT
		suc_numero,
		suc_nombre,
		suc_direccion,
		ubi_id
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_localidad = S.suc_localidad
		AND U.ubi_provincia = S.suc_provincia
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario)
	SELECT DISTINCT CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(C.clie_fecha_nacimiento)
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Cliente C
	UNION
	SELECT DISTINCT CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(E.emp_fecha_nacimiento)
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Empleado E
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO(turno_desc)
	SELECT DISTINCT CHRISTIAN_Y_LOS_MAKINSONS.ObtenerTurno(T.ticket_fecha_hora_venta)
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(
	    mp_cod,
		mp_tipo,
		mp_detalle
		)
	SELECT DISTINCT
	    MP.mp_cod,
		MP.mp_tipo,
		MP.mp_detalle
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago MP
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CAJAS
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS (
		caja_id,
		caja_tipo,
		sucursal_id
    )
    SELECT DISTINCT
		C.id_caja,
		CT.caja_nombre_tipo,
		C.id_sucursal
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Caja C
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S ON C.id_sucursal = S.suc_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja_Tipo CT ON CT.id_caja_tipo = C.id_tipo_caja 
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIAS AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS(
		cat_id,
		cat_detalle
		)
	SELECT DISTINCT
		C.categoria_cod,
		C.categoria_detalle
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Categoria C
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUBCATEGORIAS AS
BEGIN
INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS(
		subcat_id,
		subcat_detalle
		)
	SELECT DISTINCT
		S.sub_cat_cod,
		S.sub_cat_detalle
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria S
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA(
		cat_id,
		subcat_id
		)
	SELECT DISTINCT
		C.cat_id,
		S.subcat_id
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_categoria SC
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS C on C.cat_id = SC.cod_categoria
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS S on S.subcat_id = SC.sub_cat_cod_categoria
END
GO

----------------------------------------EXEC PROCEDURES TABLAS DIMENSIONALES----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TIEMPO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIAS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUBCATEGORIAS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CAJAS;

----------------------------------------CREAR TABLAS DE HECHOS----------------------------------------
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS (
	tiempo_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(tiempo_id),
	turno_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO(turno_id),
	sucursal_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id),
	caja_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS(caja_id),
	ubicacion_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(ubi_id),
	rango_cliente_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario_id),
	rango_empleado_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario_id),
	medio_pago_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(mp_cod),
	total_venta DECIMAL(18,2) NOT NULL,
    total_descuento DECIMAL(18,2) NOT NULL,
	promedio_cuotas DECIMAL(18, 2),
    total_pagos_cuotas INT NOT NULL,
	total_cantidad_productos INT NOT NULL,
	total_importe_cuotas INT,
    total_cantidad_ventas INT NOT NULL,
	total_cuotas INT NOT NULL,
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS (
	env_id INT IDENTITY(1,1) PRIMARY KEY,
    env_cant_total INT,
    env_cant_cumplidos INT,
	env_rango_etario_clie INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario_id),
	env_ubi_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(ubi_id),
	env_sucursal_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id),
	env_tiempo_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(tiempo_id),
	env_costo_total INT,
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS (
	descuento_por_promociones_aplicado DECIMAL(16, 2) not null,
    descuento_por_medio_de_pago DECIMAL(16, 2) not null,
    total_importe DECIMAL(16, 2) not null,
	categoria_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS(cat_id),
    sucursal_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id),
    tiempo_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(tiempo_id),
    medio_pago_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(mp_cod)
)
GO

----------------------------------------CREAR PROCEDURES TABLAS DE HECHOS----------------------------------------

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_VENTAS AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS(
		tiempo_id,
		turno_id,
		sucursal_id,
		caja_id,
		ubicacion_id,
		rango_cliente_id,
		rango_empleado_id,
		medio_pago_id,
		total_venta,
		total_descuento,
		promedio_cuotas,
		total_cantidad_productos,
        total_pagos_cuotas,
		total_importe_cuotas,
        total_cantidad_ventas,
        total_cuotas
	)
SELECT
    TIE.tiempo_id,
    TUR.turno_id,
    SUC.suc_id,
    CAJ.caja_id,
    UBI.ubi_id,
    DIM_RANGO_CLIE.rango_etario_id rango_etario_cliente,
    DIM_RANGO_EMPL.rango_etario_id rango_etario_empleado,
    MP.mp_cod,
    SUM(TIC.ticket_total_ticket) total_ticket,
    SUM(TIC.ticket_total_descuento_aplicado) total_descuento,
    AVG(PAG.pago_cant_cuotas) promedio_cant_cuotas,
    SUM(IT.cantidad) total_productos,
    COUNT(CASE WHEN PAG.pago_cant_cuotas > 1 THEN 1 END),
	SUM(CASE WHEN PAG.pago_cant_cuotas > 1 THEN TIC.ticket_total_ticket ELSE 0 END),
    COUNT(*),
    SUM(COALESCE(PAG.pago_cant_cuotas, 0))
FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket TIC
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO TIE
    ON YEAR(TIC.ticket_fecha_hora_venta) = TIE.tiempo_anio
    AND MONTH(TIC.ticket_fecha_hora_venta) = TIE.tiempo_mes
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO TUR
    ON TUR.turno_desc = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoHorario(TIC.ticket_fecha_hora_venta)
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS CAJ
    ON CAJ.caja_id = TIC.ticket_caja_id
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL SUC
    ON suc_id = CAJ.sucursal_id
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION UBI
    ON UBI.ubi_id = SUC.suc_ubicacion
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago PAG
    ON PAG.pago_nro_ticket = TIC.ticket_id
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO MP
    ON MP.mp_cod = PAG.pago_medio
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta PT
    ON PT.pago_tarj_nro_pago = PAG.pago_id
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta TARJ
    ON TARJ.tarj_id = PT.pago_tarj_nro_tarjeta
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Cliente CLIE
    ON CLIE.clie_codigo = TARJ.tarj_id_cliente
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO DIM_RANGO_CLIE
    ON DIM_RANGO_CLIE.rango_etario = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(CLIE.clie_fecha_nacimiento)
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Empleado EMP
    ON EMP.emp_legajo = TIC.ticket_emp_legajo
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO DIM_RANGO_EMPL
    ON DIM_RANGO_EMPL.rango_etario = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(EMP.emp_fecha_nacimiento)
LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket IT
    ON IT.ticket_numero = TIC.ticket_id
GROUP BY
    TIE.tiempo_id,
    TUR.turno_id,
    SUC.suc_id,
    CAJ.caja_id,
    UBI.ubi_id,
    DIM_RANGO_CLIE.rango_etario_id,
    DIM_RANGO_EMPL.rango_etario_id,
    MP.mp_cod;
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS(
		env_cant_total,
		env_cant_cumplidos,
		env_sucursal_id,
		env_rango_etario_clie,
		env_ubi_id,
		env_tiempo_id,
		env_costo_total
    )
    SELECT
		COUNT(E.env_codigo),
		COUNT(CASE WHEN DATEADD(HOUR, E.env_hora_fin, E.env_fecha_programada) <= E.env_fecha_hora_entrega THEN 1 END),
		S.suc_id,
		DIM_RANGO_CLIE.rango_etario_id,
		U.ubi_id,
	    T.tiempo_id,
		SUM(E.env_costo)
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Envio E
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Ticket TICK
		ON E.env_nro_ticket = TICK.ticket_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja CJ
		ON CJ.id_caja = TICK.ticket_caja_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
		ON S.suc_id = CJ.id_sucursal
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T
		ON T.tiempo_anio = YEAR(E.env_fecha_hora_entrega) AND T.tiempo_mes = MONTH(E.env_fecha_hora_entrega)
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago PAG
		ON PAG.pago_nro_ticket = TICK.ticket_id
	LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta PT
		ON PT.pago_tarj_nro_pago = PAG.pago_id
	LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta TARJ
		ON TARJ.tarj_id = PT.pago_tarj_nro_tarjeta
	LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.Cliente CLIE
		ON CLIE.clie_codigo = TARJ.tarj_id_cliente
	LEFT JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO DIM_RANGO_CLIE
		ON DIM_RANGO_CLIE.rango_etario = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(CLIE.clie_fecha_nacimiento)
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_localidad = CLIE.clie_localidad AND U.ubi_provincia = CLIE.clie_provincia
	GROUP BY suc_id, rango_etario_id, clie_localidad, ubi_id, tiempo_id
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS(
        descuento_por_promociones_aplicado,
        descuento_por_medio_de_pago,
        categoria_id,
        sucursal_id,
        tiempo_id,
        total_importe,
        medio_pago_id)
    SELECT
        SUM(T.ticket_total_descuento_aplicado),
        SUM(T.ticket_total_descuento_aplicado_mp),
        categoria_cod,
        S.suc_numero,
        TI.tiempo_id,
        SUM(T.ticket_total_ticket),
        MP.mp_cod
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket IT on T.ticket_id = IT.ticket_numero
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Producto P ON IT.producto_codigo = P.prod_codigo
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto Scdp on P.prod_codigo = Scdp.prod_codigo
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria ON P.prod_sub_categoria = Sub_categoria.sub_cat_cod
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_categoria Scdc on Sub_categoria.sub_cat_cod = Scdc.sub_cat_cod_categoria
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Categoria C on Scdc.cod_categoria = C.categoria_cod
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja CA on T.ticket_caja_id = CA.id_caja
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S on CA.id_sucursal = S.suc_numero
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO TI on YEAR(T.ticket_fecha_hora_venta) = TI.tiempo_anio AND MONTH(T.ticket_fecha_hora_venta) = TI.tiempo_mes
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago PA ON T.ticket_id = PA.pago_nro_ticket
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO MP ON MP.mp_cod = PA.pago_medio
    GROUP BY categoria_cod, S.suc_numero, TI.tiempo_id, MP.mp_cod;
END
GO

----------------------------------------EXEC PROCEDURES TABLAS HECHOS----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_VENTAS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS;
GO

----------------------------------------VIEWS SIMPLES----------------------------------------

--VISTA 1: Ticket Promedio mensual
--Valor promedio de las ventas (en $) segun la localidad, anio y mes.
--Se calcula en funcion de la sumatoria del importe de las ventas sobre el total de las mismas.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL AS
SELECT
	U.ubi_localidad Localidad,
	TI.tiempo_anio Anio,
	TI.tiempo_mes Mes,
	CAST(ROUND(SUM(V.total_venta), 2) AS DECIMAL) / CAST(SUM(V.total_cantidad_ventas) AS DECIMAL) Promedio_venta
FROM
	CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS C
		ON C.caja_id = V.caja_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
		ON C.sucursal_id = S.suc_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_id = S.suc_ubicacion
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO TI
        ON V.tiempo_id = TI.tiempo_id
GROUP BY
	U.ubi_localidad,
	TI.tiempo_anio,
	TI.tiempo_mes
GO

--SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL;
--GO

----------------------------------------

--VISTA 2: Cantidad Unidades Promedio
--Cantidad promedio de articulos que se venden en funcion de los tickets segun el turno
--para cada cuatrimestre de cada anio. Se obtiene sumando la cantidad de articulos de
--todos los tickets correspondientes sobre la cantidad de tickets. Si un producto tiene
--mas de una unidad en un ticket, para el indicador se consideran todas las unidades.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CANTIDAD_UNIDADES_PROMEDIO AS
	SELECT
		tiempo_anio Anio,
		TI.tiempo_cuatrimestre Cuatrimestre,
		TU.turno_desc Turno,
		CAST(CAST(SUM(total_cantidad_productos) AS DECIMAL) / CAST(SUM(total_cantidad_ventas) AS DECIMAL) AS DECIMAL(10, 2)) Promedio_Articulos
	FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO TI ON V.tiempo_id = TI.tiempo_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO TU ON V.turno_id = TU.turno_id
	GROUP BY tiempo_anio, tiempo_cuatrimestre, turno_desc
GO

--SELECT * FROM V_CANTIDAD_UNIDADES_PROMEDIO;

----------------------------------------

--VISTA 3: Porcentaje anual de ventas
--Porcentaje anual de ventas registradas por rango etario del empleado segun el tipo de caja para cada cuatrimestre.
--Se calcula tomando la cantidad de ventas correspondientes sobre el total de ventas anual.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_ANUAL_VENTAS AS
SELECT
    CAST(
	(CAST(SUM(total_cantidad_ventas) AS DECIMAL) /
    (SELECT
         CAST(SUM(V2.total_cantidad_ventas) AS DECIMAL)
     FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V2
     JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T2 ON V2.tiempo_id = T2.tiempo_id
     WHERE T2.tiempo_anio = T.tiempo_anio) * 100) AS DECIMAL(10, 2)) Porcentaje_Ventas,
    RE.rango_etario rango_etario_empleado,
    C.caja_tipo,
    T.tiempo_cuatrimestre cuatrimestre
FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO RE ON V.rango_empleado_id = RE.rango_etario_id
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS C ON V.caja_id = C.caja_id
JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON V.tiempo_id = T.tiempo_id
GROUP BY RE.rango_etario, C.caja_tipo, tiempo_anio, T.tiempo_cuatrimestre
GO

--SELECT * FROM V_PORCENTAJE_ANUAL_VENTAS;
--GO

----------------------------------------

--VISTA 4: VENTAS_POR_TURNO
--Cantidad de ventas registradas por turno para cada localidad seg�n el mes de cada a�o.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_VENTAS_POR_TURNO AS
	SELECT
		TIE.tiempo_anio,
		TIE.tiempo_mes,
		U.ubi_localidad,
		TUR.turno_desc,
		COUNT(*) AS Cantidad_Ventas
	FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
	INNER JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_id = V.ubicacion_id
	INNER JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO TUR
		ON TUR.turno_id = V.turno_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO TIE
		ON TIE.tiempo_id = V.tiempo_id 
	GROUP BY
		TIE.tiempo_anio,
		TIE.tiempo_mes,
		U.ubi_localidad,
		TUR.turno_desc
GO

----------------------------------------

--VISTA 5: Porcentaje de descuento aplicados
--Porcentaje de descuento aplicados en funci�n del total de los tickets seg�n el mes de cada a�o.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_APLICADO AS
    SELECT
        T.tiempo_anio Anio,
		T.tiempo_mes Mes,
		CAST(SUM(D.descuento_por_promociones_aplicado) / SUM(D.total_importe) * 100 AS DECIMAL(10, 2)) Descuento
    FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS D
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON D.tiempo_id = T.tiempo_id
	GROUP BY T.tiempo_mes, tiempo_anio;
GO

----------------------------------------

--VISTA 6: CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
--Las tres categor�as de productos con mayor descuento aplicado a partir de
--promociones para cada cuatrimestre de cada a�o.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES AS
    SELECT TOP 3
        SUM(D.descuento_por_promociones_aplicado) AS Mayor_Desc_Aplicado,
        T.tiempo_mes mes
    FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS D
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON D.tiempo_id = T.tiempo_id
	GROUP BY T.tiempo_mes;
GO

--CREATE VIEW CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES AS
--SELECT * FROM TABLA123;

----------------------------------------

--VISTA 7: Porcentaje de cumplimiento de env�os
--Porcentaje de cumplimiento de env�os en los tiempos programados por sucursal por a�o/mes (desv�o)

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS AS
	SELECT
		CAST(
			SUM(E.env_cant_cumplidos) * 1.0 / SUM(E.env_cant_total) * 100 
			AS DECIMAL(10, 2)
		) AS Porcentaje_Cumplimiento_Envios,
		E.env_sucursal_id,
		T.tiempo_anio,
		T.tiempo_mes
	FROM 
		CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS E
	JOIN 
		CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T
		ON T.tiempo_id = E.env_tiempo_id
	GROUP BY 
		E.env_sucursal_id,
		T.tiempo_anio,
		T.tiempo_mes;
GO

--SELECT * FROM V_PORCENTAJE_CUMPLIMIENTO_ENVIOS;
--GO

----------------------------------------

--VISTA 8: ENVIOS_POR_RANGO_ETARIO
--Cantidad de envios por rango etario de clientes para cada cuatrimestre de cada anio.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_ENVIOS_POR_RANGO_ETARIO AS
	SELECT
		T.tiempo_anio,
		T.tiempo_cuatrimestre,
		R.rango_etario,
		COUNT(*) AS Cantidad_Envios		
	FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS E
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T
		ON T.tiempo_id = E.env_tiempo_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO R
		ON R.rango_etario_id = E.env_rango_etario_clie
	GROUP BY rango_etario, tiempo_cuatrimestre, tiempo_anio
GO

----------------------------------------

--VISTA 9: Localidades con mayor costo de env�o
--Las 5 localidades (tomando la localidad del cliente) con mayor costo de env�o.

-- SELECT * FROM V_LOCALIDADES_MAYOR_COSTO_ENVIO;
-- GO

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_LOCALIDADES_MAYOR_COSTO_ENVIO AS
	SELECT TOP 5
		U.ubi_localidad,
		E.env_costo_total
	FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS E
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_id = E.env_ubi_id
GO

----------------------------------------

--VISTA 10: SUCURSALES_MAYOR_PAGOS_CUOTAS
--Las 3 sucursales con el mayor importe de pagos en cuotas, segun el medio de pago,
--mes y anio. Se calcula sumando los importes totales de todas las ventas en cuotas.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_SUCURSALES_MAYOR_PAGOS_CUOTAS AS
	SELECT TOP 3
		S.suc_nombre,
		V.total_importe_cuotas,
		MP.mp_detalle,
		T.tiempo_mes,
		T.tiempo_anio
	FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
		ON S.suc_id = V.sucursal_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO MP
		ON MP.mp_cod = V.medio_pago_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T
		ON T.tiempo_id = V.tiempo_id
GO

----------------------------------------

--VISTA 11: PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO
--Promedio de importe de la cuota en funcion del rango etario del cliente.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO AS
	SELECT
       RE.rango_etario,
	   CAST(SUM(V.total_venta) AS DECIMAL(18, 2)) / CAST(SUM(V.total_cuotas) AS DECIMAL(18, 2)) AS Promedio_Valor_Cuota
	FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO RE ON V.rango_cliente_id = RE.rango_etario_id
	GROUP BY RE.rango_etario;
GO

----------------------------------------

-- VISTA 12: PORCENTAJE_DESCUENTO_MEDIOS_PAGO
-- Porcentaje de descuento aplicado por cada medio de pago en función del valor
-- de total de pagos sin el descuento, por cuatrimestre. Es decir, total de descuentos
-- sobre el total de pagos más el total de descuentos.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTOS_MEDIOS_PAGO AS
    SELECT
        CAST(SUM(D.descuento_por_medio_de_pago) AS DECIMAL) /
        CAST(SUM(D.total_importe) AS DECIMAL) * 100 porcentaje_descuentos_aplicados,
        BI_DIM_TIEMPO.tiempo_cuatrimestre,
        BI_DIM_MEDIOS_PAGO.mp_detalle
    FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS D
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO ON D.medio_pago_id = BI_DIM_MEDIOS_PAGO.mp_cod
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO ON D.tiempo_id = BI_DIM_TIEMPO.tiempo_id
GROUP BY tiempo_cuatrimestre, mp_detalle;
