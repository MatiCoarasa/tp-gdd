USE GD1C2024;
GO

----------------------------------------BORRAR INDICES----------------------------------------
--...

----------------------------------------BORRAR VISTAS----------------------------------------
IF OBJECT_ID('dbo.V_TICKET_PROMEDIO_MENSUAL', 'V') IS NOT NULL DROP VIEW dbo.V_TICKET_PROMEDIO_MENSUAL
IF OBJECT_ID('dbo.V_CANTIDAD_UNIDADES_PROMEDIO', 'V') IS NOT NULL DROP VIEW dbo.V_CANTIDAD_UNIDADES_PROMEDIO
IF OBJECT_ID('dbo.V_PORCENTAJE_ANUAL_VENTAS', 'V') IS NOT NULL DROP VIEW dbo.V_PORCENTAJE_ANUAL_VENTAS
IF OBJECT_ID('dbo.V_VENTAS_POR_TURNO', 'V') IS NOT NULL DROP VIEW dbo.V_VENTAS_POR_TURNO
IF OBJECT_ID('dbo.V_PORCENTAJE_DESCUENTO_APLICADO', 'V') IS NOT NULL DROP VIEW dbo.V_PORCENTAJE_DESCUENTO_APLICADO
IF OBJECT_ID('dbo.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES', 'V') IS NOT NULL DROP VIEW dbo.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
IF OBJECT_ID('dbo.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS', 'V') IS NOT NULL DROP VIEW dbo.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS
IF OBJECT_ID('dbo.V_ENVIOS_POR_RANGO_ETARIO', 'V') IS NOT NULL DROP VIEW dbo.V_ENVIOS_POR_RANGO_ETARIO
IF OBJECT_ID('dbo.V_LOCALIDADES_MAYOR_COSTO_ENVIO', 'V') IS NOT NULL DROP VIEW dbo.V_LOCALIDADES_MAYOR_COSTO_ENVIO
IF OBJECT_ID('dbo.V_SUCURSALES_MAYOR_PAGOS_CUOTAS', 'V') IS NOT NULL DROP VIEW dbo.V_SUCURSALES_MAYOR_PAGOS_CUOTAS
IF OBJECT_ID('dbo.V_PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO', 'V') IS NOT NULL DROP VIEW dbo.V_PROMEDIO_IMPORTE_CUOTA_POR_RANGO_ETARIO
IF OBJECT_ID('dbo.V_PORCENTAJE_DESCUENTO_MEDIOS_PAGO', 'V') IS NOT NULL DROP VIEW dbo.V_PORCENTAJE_DESCUENTO_MEDIOS_PAGO
GO

----------------------------------------BORRAR TABLAS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TIPOS_CAJA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TIPOS_CAJA
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_MEDIOS_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_MEDIO_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_MEDIO_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET
GO

----------------------------------------BORRAR DIMENSIONES----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA
GO

----------------------------------------BORRAR PROCEDURES----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_TIEMPO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TIEMPO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_SUCURSAL' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_UBICACION' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_RANGO_ETARIO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_TURNO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_MEDIOS_PAGO' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA;

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_TICKETS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_TICKETS;
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

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL (
	suc_numero INT PRIMARY KEY,
	id_supermercado DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Supermercado(super_id),
    suc_nombre NVARCHAR(255),
    suc_direccion NVARCHAR(255),
	suc_ubicacion DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(ubi_id)    
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

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA(
	cat_id INT,
	subcat_id INT,
	cat_detalle NVARCHAR(255) NOT NULL,
	subcat_detalle NVARCHAR(255) NOT NULL
	PRIMARY KEY (cat_id, subcat_id)
)
GO

----------------------------------------CREAR TABLAS----------------------------------------

--Solamente migramos la informacion que nos interesa de las tablas que nos interesan

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TIPOS_CAJA (
	id_caja_tipo INT PRIMARY KEY IDENTITY(1,1),
	caja_nombre_tipo NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS (
	id_caja DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
    caja_numero DECIMAL(18,0),
	id_tipo_caja INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Caja_Tipo(id_caja_tipo),
	id_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS (
    emp_legajo INT IDENTITY(1,1) PRIMARY KEY,
    emp_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero),
    emp_nombre NVARCHAR(255) NULL,
    emp_apellido NVARCHAR(255) NULL,
    emp_dni DECIMAL(18,0) NULL,
    emp_fecha_registro DATETIME NULL,
    emp_fecha_nacimiento DATETIME NULL,
    emp_email NVARCHAR(255) NULL,
    emp_telefono DECIMAL(18,0) NULL
);
GO

--cambiar localidad y provincia por ubicacion_id
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES (
    clie_codigo INT IDENTITY(1,1) PRIMARY KEY,
    clie_nombre NVARCHAR(255),
    clie_apellido NVARCHAR(255),
    clie_dni DECIMAL(18,0),
    clie_fecha_registro DATETIME,
    clie_telefono DECIMAL(18,0),
    clie_mail NVARCHAR(255),
    clie_fecha_nacimiento DATE,
    clie_domicilio NVARCHAR(255),
    clie_localidad NVARCHAR(255),
    clie_provincia NVARCHAR(255)
);
GO

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

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS (
    env_codigo DECIMAL(18,0) IDENTITY (1,1) PRIMARY KEY,
    env_costo DECIMAL(18,2),
    env_fecha_programada DATETIME,
    env_hora_inicio DECIMAL(18,0),
    env_hora_fin DECIMAL(18,0),
    env_fecha_hora_entrega DATETIME,
    env_estado NVARCHAR(255),
    env_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    env_nro_cliente INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_MEDIOS_PAGO (
    mp_cod DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
    mp_detalle NVARCHAR(255),
	mp_tipo NVARCHAR(255),
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_MEDIO_PAGO (
    descuento__medio_desc_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Descuento(desc_cod),
    descuento__medio_mp_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(mp_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS (
	pago_id INT IDENTITY(1,1) PRIMARY KEY,
    pago_tarjeta_nro NVARCHAR(255) null,
    pago_total DECIMAL(18,2),
    pago_cant_cuotas DECIMAL(18,0),
    pago_fecha_hora DATETIME,
    pago_medio DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(mp_cod),
    pago_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    pago_descuento DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Descuento(desc_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA (
    pago_tarj_nro_pago INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Pago(pago_id),
    pago_tarj_nro_tarjeta INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta(tarj_id),
	pago_tarj_cuotas DECIMAL(18,0) NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES (
    promo_cod DECIMAL(18,0) PRIMARY KEY,
    promo_detalle NVARCHAR(255),
    promo_fecha_desde DATE,
    promo_fecha_hasta DATE,
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES (
    regla_cod DECIMAL(18,0) IDENTITY(1, 1) PRIMARY KEY,
    regla_descripcion NVARCHAR(255),
    regla_descuento_aplica_prod DECIMAL(18, 2),
    regla_cant_aplica_regla DECIMAL(18, 0),
    regla_cant_aplica_desc DECIMAL(18, 0),
    regla_cant_max DECIMAL(18, 0),
    regla_aplica_misma_marca DECIMAL(18, 0),
    regla_aplica_mismo_prod DECIMAL(18, 0)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION (
    promo_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Promocion(promo_cod),
    regla_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo(regla_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS (
    prod_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	prod_detalle NVARCHAR(255),
    prod_nombre NVARCHAR(255),
    prod_marca NVARCHAR(255),
    prod_precio DECIMAL(18,2),
    prod_sub_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(sub_cat_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET (
    productos_ticket_id INT PRIMARY KEY IDENTITY(1,1),
	producto_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Producto(prod_codigo),
    ticket_numero INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    cantidad DECIMAL(18,0),
);
GO

----------------------------------------CREAR INDICES----------------------------------------
--...

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
		(MONTH(T.ticket_fecha_hora_venta) - 1) / 3 + 1
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket T
END
GO

--agregar localidad y provincia de Clientes
CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(
		ubi_localidad,
		ubi_provincia
		)
	SELECT DISTINCT
		S.suc_localidad,
		S.suc_provincia
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S
END
GO


CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(
		id_supermercado,
		suc_numero,
		suc_nombre,
		suc_direccion,
		suc_ubicacion
		)
	SELECT DISTINCT
		id_supermercado,
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

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(
		mp_tipo,
		mp_detalle
		)
	SELECT DISTINCT
		MP.mp_tipo,
		MP.mp_detalle
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago MP
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA(
		cat_id,
		cat_detalle,
		subcat_id,
		subcat_detalle
		)
	SELECT DISTINCT
		C.categoria_cod,
		C.categoria_detalle,
		S.sub_cat_cod,
		S.sub_cat_detalle
	FROM CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_categoria SC
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Categoria C on C.categoria_cod = SC.cod_categoria
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria S on S.sub_cat_cod = SC.sub_cat_cod_categoria
END
GO

----------------------------------------CREAR PROCEDURES TABLAS----------------------------------------

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_TICKETS
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
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TIEMPO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_SUCURSAL;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_RANGO_ETARIO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_TURNO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_MEDIOS_PAGO;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_CATEGORIA_SUBCATEGORIA;

EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_TICKETS;
GO

----------------------------------------VIEWS SIMPLES----------------------------------------

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


----------------------------------------VIEWS TEST----------------------------------------
--SELECT * FROM dbo.V_TICKET_PROMEDIO_MENSUAL;
