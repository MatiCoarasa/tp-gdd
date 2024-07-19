USE GD1C2024;
GO

--PENDIENTE - TO-DO

--TABLAS DE HECHOS
--(X) VENTAS
--(X) PAGOS
--(X) ENVIOS
--(X) PRODUCTOS
--(X) PROMOCIONES

--TABLAS DIMENSIONALES
--(X) UBICACION
--(X) TURNO
--(X) TIEMPO
--(X) SUCURSAL
--(X) RANGO_ETARIO
--(X) MEDIOS_PAGO
--(X) CAJAS
--(X) CATEGORIAS
--(X) SUBCATEGORIAS
--(X) CATEGORIA_SUBCATEGORIA
--(X) EMPLEADOS
--(x) CLIENTES

--(X) Ponerles DIM a las tablas dimensionales
--(X) Convertir en tablas dimensionales o eliminar las tablas que sobran

--PROCEDURES MIGRAR TABLAS DIMENSIONALES
--(X) UBICACION
--(X) TURNO
--(X) TIEMPO
--(X) SUCURSAL
--(X) RANGO_ETARIO
--(X) MEDIOS_PAGO
--(X) CAJAS
--(X) CATEGORIAS
--(X) SUBCATEGORIAS
--(X) CATEGORIA_SUBCATEGORIA
--(X) EMPLEADOS
--(X) CLIENTES

--PROCEDURES MIGRAR TABLAS DE HECHOS
--( ) VENTAS --> Migración hecha, no funciona, tabla vacía
--(X) PAGOS --> Revisar
--(X) ENVIOS --> Revisar
--( ) PRODUCTOS
--( ) PROMOCIONES

--TRANSFORMAR VISTAS
--( ) 1
--( ) 2
--( ) 3
--( ) 4
--( ) 5
--( ) 6
--( ) 7
--( ) 8
--( ) 9
--( ) 10
--( ) 11
--( ) 11

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
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES

--en duda
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA
GO

----------------------------------------BORRAR DIMENSIONES----------------------------------------
--en duda
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.DIM_BI_PAGOS_TARJETA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.DIM_BI_PAGOS_TARJETA

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES
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
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_PAGOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PAGOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_ENVIOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_PRODUCTOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PRODUCTOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_PROMOCIONES' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PROMOCIONES;
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
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_EMPLEADOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_EMPLEADOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_CAJAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CAJAS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_CLIENTES' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CLIENTES;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA;
GO

----------------------------------------BORRAR FUNCTIONS----------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id('CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario')) DROP FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id('CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoHorario')) DROP FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoHorario
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

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS (
    emp_legajo INT PRIMARY KEY,
    emp_rango_etario INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario_id),
	emp_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES (
    clie_codigo INT PRIMARY KEY,
    clie_rango_etario INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO(rango_etario_id),
	clie_ubicacion INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(ubi_id)
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

CREATE FUNCTION CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoHorario (@ticket_fecha_hora_venta DATETIME)
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
        SET @TimeRange = 'VENTA FUERA DE TURNO'

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
	SELECT DISTINCT CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoHorario(T.ticket_fecha_hora_venta)
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

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CAJAS
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

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_EMPLEADOS AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS (
		emp_legajo,
		emp_rango_etario,
		emp_sucursal
    )
    SELECT DISTINCT
        E.emp_legajo,
		R.rango_etario_id,
		S.suc_id
    FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Empleado E ON E.emp_sucursal = S.suc_id
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO R
        ON R.rango_etario = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(E.emp_fecha_nacimiento)
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CLIENTES AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES (
        clie_codigo,
        clie_rango_etario,
        clie_ubicacion
    )
    SELECT DISTINCT
        C.clie_codigo,
        R.rango_etario_id,
        U.ubi_id
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Cliente C
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO R
        ON R.rango_etario = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(C.clie_fecha_nacimiento)
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
        ON U.ubi_localidad = C.clie_localidad
        AND U.ubi_provincia = C.clie_provincia;
END;
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
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CAJAS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_EMPLEADOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CLIENTES;


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
	total_venta DECIMAL(18,2),
    total_descuento DECIMAL(18,2),
	promedio_cuotas INT,
	total_cantidad_productos INT
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS (
    pago_total DECIMAL(18,2),
    pago_cant_cuotas INT,
	pago_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id),
    tiempo_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(tiempo_id),
    medio_pago_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(mp_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS (
    env_costo DECIMAL(18,2),
    env_fecha_programada DATETIME,
    env_hora_inicio DECIMAL(18,0),
    env_hora_fin DECIMAL(18,0),
    env_fecha_hora_entrega DATETIME,
    env_estado NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS (
    total_vendidos INT,
    categoria_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS(cat_id),
    sucursal_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_id),
    tiempo_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(tiempo_id)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES (
	promo_detalle NVARCHAR(255),
	tiempo_id INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO(tiempo_id)
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
		total_cantidad_productos
	)
	SELECT DISTINCT
        TIE.tiempo_id,
		TUR.turno_id,
		SUC.suc_id,
		CAJ.caja_id,
		UBI.ubi_id,
		DIM_CLIE.clie_rango_etario,
		DIM_EMP.emp_rango_etario,
		MP.mp_cod,
		SUM(TIC.ticket_total_ticket),
		SUM((TIC.ticket_total_descuento_aplicado + TIC.ticket_total_descuento_aplicado_mp)),
		AVG(PAG.pago_cant_cuotas),
		COUNT(IT.cantidad)
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
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago PAG
		ON PAG.pago_nro_ticket = TIC.ticket_numero
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO MP
		ON MP.mp_cod = PAG.pago_medio
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta PT
		ON PT.pago_tarj_nro_pago = PAG.pago_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta TARJ
		ON TARJ.tarj_nro = PT.pago_tarj_nro_tarjeta
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Cliente CLIE
		ON CLIE.clie_codigo = TARJ.tarj_id_cliente
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES DIM_CLIE
		ON DIM_CLIE.clie_rango_etario = CHRISTIAN_Y_LOS_MAKINSONS.ObtenerRangoEtario(CLIE.clie_fecha_nacimiento)
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Empleado EMP
		ON EMP.emp_legajo = TIC.ticket_emp_legajo
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS DIM_EMP
		ON DIM_EMP.emp_legajo = EMP.emp_legajo
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket IT
		ON IT.ticket_numero = TIC.ticket_numero
	GROUP BY
		TIE.tiempo_id,
		TUR.turno_id,
		SUC.suc_id,
		CAJ.caja_id,
		UBI.ubi_id,
		DIM_CLIE.clie_rango_etario,
		DIM_EMP.emp_rango_etario,
		MP.mp_cod
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PAGOS AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS(
		pago_total,
		pago_sucursal,
		tiempo_id,
		pago_cant_cuotas,
		medio_pago_id
    )
    SELECT DISTINCT
		P.pago_total,
		SUC.suc_id, 
        D.tiempo_id,
        MP.mp_cod
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.Pago P 
    JOIN 
        CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago MP
        ON P.pago_medio = MP.mp_cod
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta T
        ON T.tarj_nro = P.pago_tarjeta_nro
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket IT
        ON P.pago_nro_ticket = IT.ticket_numero
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Ticket TICK
        ON IT.ticket_numero = TICK.ticket_id
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES CL
	ON
		T.tarj_id_cliente = CL.clie_codigo
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS C
        ON TICK.ticket_caja_id = C.caja_id
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO D
        ON YEAR(TICK.ticket_fecha_hora_venta) = D.tiempo_anio
        AND MONTH(TICK.ticket_fecha_hora_venta) = D.tiempo_mes
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S
        ON C.sucursal_id = S.suc_numero
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
        ON S.suc_localidad = U.ubi_localidad
        AND S.suc_provincia = U.ubi_provincia
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL SUC
        ON SUC.suc_id = S.suc_numero
        AND SUC.suc_ubicacion = U.ubi_id
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS(
		env_costo,
		env_fecha_programada,
		env_hora_inicio,
		env_hora_fin,
		env_fecha_hora_entrega,
		env_estado
    )
    SELECT DISTINCT
		E.env_costo,
		E.env_fecha_programada,
		E.env_hora_inicio,
		E.env_hora_fin,
		E.env_fecha_hora_entrega,
		E.env_estado
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Envio E
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES C
		ON E.env_nro_cliente = C.clie_codigo
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PRODUCTOS AS
BEGIN
    SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PROMOCIONES AS
BEGIN
    SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS
END
GO

----------------------------------------EXEC PROCEDURES TABLAS DIMENSIONALES----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_VENTAS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PAGOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PRODUCTOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PROMOCIONES;
GO


------------------------------------------PENDIENTE------------------------------------------
--NO SE PARA QUE ES ESTA TABLA

--CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA
--AS
--BEGIN
--    INSERT INTO  BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA (
--        desc_cate_anio, 
--        desc_cate_mes, 
--        cat_id, 
--        monto_descuento
--    )
--    SELECT
--        YEAR(T.ticket_fecha_hora_venta) AS desc_cate_anio,
--        MONTH(T.ticket_fecha_hora_venta) AS desc_cate_mes,
--        BICATSUBCAT.cat_id,
--        SUM(I.precio_producto_desc) AS monto_descuento
--    FROM
--        CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket I
--    JOIN
--        CHRISTIAN_Y_LOS_MAKINSONS.Ticket T ON I.ticket_numero = T.ticket_id
--    JOIN
--        CHRISTIAN_Y_LOS_MAKINSONS.Producto P ON I.producto_codigo = P.prod_codigo
--    JOIN
--        CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto SCP ON P.prod_sub_categoria = SCP.prod_sub_categoria
--    JOIN
--        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS BICATSUBCAT ON SCP.prod_sub_categoria = BICATSUBCAT.subcat_id
--    GROUP BY
--        YEAR(T.ticket_fecha_hora_venta),
--        MONTH(T.ticket_fecha_hora_venta),
--        BICATSUBCAT.cat_id;
--END;
--GO

----------------------------------------VIEWS SIMPLES----------------------------------------

--VISTA 1: Ticket Promedio mensual
--Valor promedio de las ventas (en $) segun la localidad, anio y mes.
--Se calcula en funcion de la sumatoria del importe de las ventas sobre el total de las mismas.



--CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL AS
--SELECT
--	U.ubi_localidad AS Localidad,
--	TI.tiempo_anio AS Año,
--	TI.tiempo_mes AS Mes,
--	ROUND(AVG(T.ticket_total_ticket), 2) AS Promedio_Venta
--FROM 
--	CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS T
--	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS C
--		ON C.caja_id = T.ticket_caja_id
--	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
--		ON C.id_sucursal = S.suc_numero
--	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
--		ON U.ubi_id = S.suc_ubicacion
--    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO TI
--        ON T.ticket_tiempo = TI.tiempo_id
--GROUP BY 
--	U.ubi_localidad, 
--	TI.tiempo_anio,
--	TI.tiempo_mes
--GO



CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL AS
SELECT
	U.ubi_localidad AS Localidad,
	TI.tiempo_anio AS Anio,
	TI.tiempo_mes AS Mes,
	ROUND(AVG(V.total_venta), 2) AS Promedio_Venta
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
--Cantidad promedio de art�culos que se venden en funci�n de los tickets seg�n el turno
--para cada cuatrimestre de cada a�o. Se obtiene sumando la cantidad de art�culos de
--todos los tickets correspondientes sobre la cantidad de tickets. Si un producto tiene
--m�s de una unidad en un ticket, para el indicador se consideran todas las unidades.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CANTIDAD_UNIDADES_PROMEDIO AS
    WITH VentasConRangosHorarios AS (
        SELECT
            ticket_id,
            pt.cantidad,
            dim_turno.turno_desc
        FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket t
            JOIN CHRISTIAN_Y_LOS_MAKINSONs.Items_Ticket pt
                ON t.ticket_id = pt.productos_ticket_id
            JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO dim_turno ON dim_turno.turno_desc =
                CASE
                    WHEN DATEPART(HOUR, t.ticket_fecha_hora_venta) >= 8 AND
                         DATEPART(HOUR, t.ticket_fecha_hora_venta) < 12 THEN '08:00 - 12:00'
                    WHEN DATEPART(HOUR, t.ticket_fecha_hora_venta) >= 12 AND
                         DATEPART(HOUR, t.ticket_fecha_hora_venta) < 16 THEN '12:00 - 16:00'
                    WHEN DATEPART(HOUR, t.ticket_fecha_hora_venta) >= 16 AND
                         DATEPART(HOUR, t.ticket_fecha_hora_venta) < 20 THEN '16:00 - 20:00'
                    ELSE 'VENTA FUERA DE TURNO'
                END
            ),
VentasAgregadas AS (
    SELECT
        turno_desc,
        SUM(cantidad) AS total_products,
        COUNT(DISTINCT ticket_id) AS total_tickets
    FROM
        VentasConRangosHorarios
    GROUP BY
        turno_desc
)

--SELECT turno_desc, CAST(total_products AS FLOAT) / total_tickets AS promedio_productos_vendidos
--FROM VentasAgregadas;
--GO

--SELECT * FROM V_CANTIDAD_UNIDADES_PROMEDIO;

----------------------------------------

--VISTA 3: Porcentaje anual de ventas
--Porcentaje anual de ventas registradas por rango etario del empleado seg�n el tipo de caja para cada cuatrimestre.
--Se calcula tomando la cantidad de ventas correspondientes sobre el total de ventas anual.
CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_ANUAL_VENTAS AS
	WITH ventas_cuatrimestre AS (
		SELECT
			ti.tiempo_anio AS Anio,
			ti.tiempo_cuatrimestre AS Cuatrimestre,
			r.rango_etario AS [Rango Etario],
			c.caja_tipo AS [Tipo de Caja],
			COUNT(*) AS [Total Ventas Cuatrimestre]
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS t
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS e ON t.ticket_emp_legajo = e.emp_legajo
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS c ON t.ticket_caja_id = c.caja_id
		    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO r ON e.emp_rango_etario = r.rango_etario_id
		    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO ti ON t.ticket_tiempo = ti.tiempo_id
		GROUP BY
			ti.tiempo_anio,
			ti.tiempo_cuatrimestre,
			r.rango_etario,
			c.caja_tipo
	),
	ventas_anuales AS (
		SELECT
			ti.tiempo_anio AS anio,
			r.rango_etario AS [Rango Etario],
			c.caja_tipo,
			COUNT(*) AS [Total Ventas Anuales]
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS t
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_EMPLEADOS e ON t.ticket_emp_legajo = e.emp_legajo
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CAJAS c ON t.ticket_caja_id = c.caja_id
		    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO r ON e.emp_rango_etario = r.rango_etario_id
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO ti ON t.ticket_tiempo = ti.tiempo_id
		GROUP BY
			ti.tiempo_anio,
			r.rango_etario,
			c.caja_tipo
	)
	SELECT
		vc.Anio,
		vc.Cuatrimestre,
		vc.[Rango Etario],
		vc.[Tipo de Caja],
		SUM(vc.[Total Ventas Cuatrimestre]) AS [Total Ventas Cuatrimestre],
		SUM(va.[Total Ventas Anuales]) AS [Total Ventas Anuales],
		SUM(vc.[Total Ventas Cuatrimestre]) * 100.0 / SUM(va.[Total Ventas Anuales]) AS [Porcentaje Ventas Cuatrimestre]
	FROM
		ventas_cuatrimestre vc
		JOIN ventas_anuales va ON vc.Anio = va.anio AND vc.[Rango Etario] = va.[Rango Etario] AND vc.[Tipo de Caja] = va.caja_tipo
	GROUP BY
		vc.Anio,
		vc.Cuatrimestre,
		vc.[Rango Etario],
		vc.[Tipo de Caja];
GO


--SELECT * FROM V_PORCENTAJE_ANUAL_VENTAS;
--GO

----------------------------------------

--VENTAS_POR_TURNO
--Cantidad de ventas registradas por turno para cada localidad seg�n el mes de cada a�o.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_VENTAS_POR_TURNO AS
SELECT
    U.ubi_localidad AS Localidad,
    DATEPART(YEAR, T.ticket_fecha_hora_venta) AS Anio,
    DATEPART(MONTH, T.ticket_fecha_hora_venta) AS Mes,
    D.turno_desc AS Turno,
    COUNT(*) AS Cantidad_Ventas
FROM
    CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
INNER JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.Caja C ON T.ticket_caja_id = C.id_caja
INNER JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S ON C.id_sucursal = S.suc_numero
INNER JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U ON S.suc_ubicacion = U.ubi_id
INNER JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO D ON
        (CASE
            WHEN CONVERT(TIME, T.ticket_fecha_hora_venta) >= '08:00:00' AND CONVERT(TIME, T.ticket_fecha_hora_venta) < '12:00:01' THEN '08:00 - 12:00'
            WHEN CONVERT(TIME, T.ticket_fecha_hora_venta) >= '12:00:01' AND CONVERT(TIME, T.ticket_fecha_hora_venta) < '16:00:01' THEN '12:00 - 16:00'
            WHEN CONVERT(TIME, T.ticket_fecha_hora_venta) >= '16:00:00' AND CONVERT(TIME, T.ticket_fecha_hora_venta) <= '20:00:00' THEN '16:00 - 20:00'
            ELSE 'VENTA FUERA DE TURNO'
        END) = D.turno_desc
GROUP BY
    U.ubi_localidad,
    DATEPART(YEAR, T.ticket_fecha_hora_venta),
    DATEPART(MONTH, T.ticket_fecha_hora_venta),
    D.turno_desc;
GO


----------------------------------------

--VISTA 5: Porcentaje de descuento aplicados
--Porcentaje de descuento aplicados en funci�n del total de los tickets seg�n el mes de cada a�o.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_APLICADO AS
	SELECT
		ti.tiempo_anio AS "A�o",
		ti.tiempo_mes AS "Mes",
		SUM(t.ticket_total_descuento_aplicado) AS "Total Descuentos",
		SUM(t.ticket_total_ticket) AS "Total Ventas",
		(SUM(t.ticket_total_descuento_aplicado) / NULLIF(SUM(t.ticket_total_ticket), 0)) * 100 AS "Porcentaje Descuento"
	FROM
		CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS t
	    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO ti ON t.ticket_tiempo = ti.tiempo_id
	GROUP BY
		ti.tiempo_anio,
		ti.tiempo_mes
GO


----------------------------------------

--CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
--Las tres categor�as de productos con mayor descuento aplicado a partir de
--promociones para cada cuatrimestre de cada a�o.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES AS
	SELECT * FROM (
    SELECT TOP 3
        T.tiempo_cuatrimestre,
        C.cat_id,
        MAX(C.monto_descuento) AS Mayor_monto_descuento
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA C
    INNER JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON C.desc_cate_anio = T.tiempo_anio
                                                   AND C.desc_cate_mes = T.tiempo_mes
    WHERE
        T.tiempo_cuatrimestre = 1
    GROUP BY
        T.tiempo_cuatrimestre,
        C.cat_id

    UNION ALL

    SELECT TOP 3
        T.tiempo_cuatrimestre,
        C.cat_id,
        MAX(C.monto_descuento) AS Mayor_monto_descuento
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA C
    INNER JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON C.desc_cate_anio = T.tiempo_anio
                                                   AND C.desc_cate_mes = T.tiempo_mes
    WHERE
        T.tiempo_cuatrimestre = 2
    GROUP BY
        T.tiempo_cuatrimestre,
        C.cat_id

    UNION ALL

    SELECT TOP 3
        T.tiempo_cuatrimestre,
        C.cat_id,
        MAX(C.monto_descuento) AS Mayor_monto_descuento
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA C
    INNER JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON C.desc_cate_anio = T.tiempo_anio
                                                   AND C.desc_cate_mes = T.tiempo_mes
    WHERE
        T.tiempo_cuatrimestre = 3
    GROUP BY
        T.tiempo_cuatrimestre,
        C.cat_id

    UNION ALL

    SELECT TOP 3
        T.tiempo_cuatrimestre,
        C.cat_id,
        MAX(C.monto_descuento) AS Mayor_monto_descuento
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA C
    INNER JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON C.desc_cate_anio = T.tiempo_anio
                                                   AND C.desc_cate_mes = T.tiempo_mes
    WHERE
        T.tiempo_cuatrimestre = 4
    GROUP BY
        T.tiempo_cuatrimestre,
        C.cat_id
) AS CombinedResults;
GO

--CREATE VIEW CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES AS
--SELECT * FROM TABLA123;

----------------------------------------

--PENDIENTE


--VISTA 7: Porcentaje de cumplimiento de env�os
--Porcentaje de cumplimiento de env�os en los tiempos programados por sucursal por a�o/mes (desv�o)

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS AS
	SELECT
		YEAR(env.env_fecha_programada) AS Anio,
		MONTH(env.env_fecha_programada) AS Mes,
		U.ubi_localidad AS Sucursal,
		COUNT(CASE 
				WHEN CAST(env.env_fecha_hora_entrega AS DATE) = CAST(env.env_fecha_programada AS DATE) AND 
					 env.env_fecha_hora_entrega BETWEEN CAST(env.env_fecha_programada AS DATETIME) AND 
					 DATEADD(SECOND, env.env_hora_fin, CAST(env.env_fecha_programada AS DATETIME)) 
				THEN env.env_codigo 
			  END
			) AS Envios_Entregados_A_Tiempo,
		COUNT(*) AS Total_Envios_Programados,
		100.0 * COUNT(CASE 
						  WHEN CAST(env.env_fecha_hora_entrega AS DATE) = CAST(env.env_fecha_programada AS DATE) AND 
							   env.env_fecha_hora_entrega BETWEEN CAST(env.env_fecha_programada AS DATETIME) AND 
							   DATEADD(SECOND, env.env_hora_fin, CAST(env.env_fecha_programada AS DATETIME)) 
						  THEN env.env_codigo 
						END
					  ) / NULLIF(COUNT(*), 0) AS Porcentaje_Cumplimiento
	FROM
		CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS env
		JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U ON env.env_nro_cliente = U.ubi_id
	GROUP BY
		YEAR(env.env_fecha_programada),
		MONTH(env.env_fecha_programada),
		U.ubi_localidad
GO

--SELECT * FROM V_PORCENTAJE_CUMPLIMIENTO_ENVIOS;
--GO

----------------------------------------

--ENVIOS_POR_RANGO_ETARIO
--Cantidad de env�os por rango etario de clientes para cada cuatrimestre de cada a�o.

--CREATE VIEW ENVIOS_POR_RANGO_ETARIO AS
--SELECT * FROM TABLA123;
CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_ENVIOS_POR_RANGO_ETARIO AS
SELECT
    T.tiempo_cuatrimestre,
    R.rango_etario,
    COUNT(*) AS cantidad_envios
FROM
    CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS E
JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES C ON E.env_nro_cliente = C.clie_codigo
JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO R ON C.clie_rango_etario = R.rango_etario_id
JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO T ON (YEAR(E.env_fecha_hora_entrega) = T.tiempo_anio
        AND (
            CASE
                WHEN MONTH(E.env_fecha_hora_entrega) BETWEEN 1 AND 3 THEN 1
                WHEN MONTH(E.env_fecha_hora_entrega) BETWEEN 4 AND 6 THEN 2
                WHEN MONTH(E.env_fecha_hora_entrega) BETWEEN 7 AND 9 THEN 3
                WHEN MONTH(E.env_fecha_hora_entrega) BETWEEN 10 AND 12 THEN 4
            END
        ) = T.tiempo_cuatrimestre)
GROUP BY
    T.tiempo_cuatrimestre,
    R.rango_etario
GO
----------------------------------------

--VISTA 9: Localidades con mayor costo de env�o
--Las 5 localidades (tomando la localidad del cliente) con mayor costo de env�o.

-- SELECT * FROM V_LOCALIDADES_MAYOR_COSTO_ENVIO;
-- GO

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_LOCALIDADES_MAYOR_COSTO_ENVIO AS
	WITH CostosPorLocalidad AS (
		SELECT
			U.ubi_localidad AS Localidad,
			SUM(env.env_costo) AS Costo_Total_Envio
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS env
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CLIENTES C ON env.env_nro_cliente = C.clie_codigo
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U ON C.clie_ubicacion = U.ubi_id
		GROUP BY
			U.ubi_localidad
	)
	SELECT
		Localidad,
		Costo_Total_Envio
	FROM
		(
			SELECT
				Localidad,
				Costo_Total_Envio,
				ROW_NUMBER() OVER (ORDER BY Costo_Total_Envio DESC) AS Orden
			FROM
				CostosPorLocalidad
		) AS RankedCostos
	WHERE
		Orden <= 5;
GO
----------------------------------------

--SUCURSALES_MAYOR_PAGOS_CUOTAS
--Las 3 sucursales con el mayor importe de pagos en cuotas, seg�n el medio de pago,
--mes y a�o. Se calcula sumando los importes totales de todas las ventas en cuotas.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_SUCURSALES_MAYOR_PAGOS_CUOTAS AS
WITH SucursalesOrdenadas AS (
    SELECT 
        T.pago_tarj_anio AS Anio,
        T.pago_tarj_mes AS Mes,
        T.pago_tarj_sucursal,
        T.pago_tarj_medio_pago,
        SUM(T.pago_tarj_monto_total) AS MontoTotal,
        ROW_NUMBER() OVER (PARTITION BY T.pago_tarj_anio, T.pago_tarj_mes, T.pago_tarj_medio_pago ORDER BY SUM(T.pago_tarj_monto_total) DESC) AS RN
    FROM 
        CHRISTIAN_Y_LOS_MAKINSONS.DIM_BI_PAGOS_TARJETA T
    GROUP BY
        T.pago_tarj_anio,
        T.pago_tarj_mes,
        T.pago_tarj_sucursal,
        T.pago_tarj_medio_pago
)
SELECT 
    Anio,
    Mes,
    pago_tarj_sucursal,
    pago_tarj_medio_pago,
    MontoTotal
FROM 
    SucursalesOrdenadas
WHERE 
    RN <= 3;
GO

--SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA
----------------------------------------

--PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO
--Promedio de importe de la cuota en funci�n del rango etario del cliente.


CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO AS
    SELECT
       V.venta_clie_rango,
       AVG(V.venta_total/ V.venta_total) promedio_valor_cuota
    FROM
      CHRISTIAN_Y_LOS_MAKINSONS.BI_VENTAS V
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO RE
	ON	V.venta_clie_rango = RE.rango_etario_id
	WHERE V.venta_cuotas IS NOT NULL
    GROUP BY V.venta_clie_rango
GO

----------------------------------------

--PORCENTAJE_DESCUENTO_MEDIOS_PAGO
--Porcentaje de descuento aplicado por cada medio de pago en funci�n del valor
--de total de pagos sin el descuento, por cuatrimestre. Es decir, total de descuentos
--sobre el total de pagos m�s el total de descuentos.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTOS_MEDIOS_PAGO AS
    SELECT
        mp.mp_detalle,
        SUM(p.pago_descuento) / (SUM(p.pago_total) + SUM(p.pago_descuento)) * 100 porcentaje_descuentos,
        ti.tiempo_cuatrimestre,
        ti.tiempo_anio
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO mp
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.Pago p ON mp.mp_cod = p.pago_medio
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS t ON p.pago_nro_ticket = t.ticket_id
    JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO ti ON t.ticket_tiempo = ti.tiempo_id
GROUP BY mp.mp_detalle, ti.tiempo_cuatrimestre, ti.tiempo_anio
GO

