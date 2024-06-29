USE GD1C2024;
GO

----------------------------------------BORRAR INDICES----------------------------------------
--...

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
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_MEDIOS_PAGO', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES', 'V') IS NOT NULL DROP VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
GO


----------------------------------------BORRAR TABLAS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTO_MEDIO_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTO_MEDIO_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_MEDIOS_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLAS_DE_PROMOCIONES
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA
GO

----------------------------------------BORRAR DIMENSIONES----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TIEMPO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUBCATEGORIAS
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
GO

----------------------------------------BORRAR PROCEDURES TABLAS----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_EMPLEADOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_EMPLEADOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_CAJAS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CAJAS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_TICKETS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_TICKETS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_CLIENTES' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CLIENTES;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_ENVIOS' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'MIGRAR_BI_PAGOS_TARJETA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PAGOS_TARJETA;
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
	id_supermercado DECIMAL(18,0),
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
	mp_cod DECIMAL(18,0) PRIMARY KEY,
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

----------------------------------------CREAR TABLAS----------------------------------------

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS (
	caja_id INT NOT NULL PRIMARY KEY,
    id_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_numero),
	caja_numero DECIMAL(18,0) NOT NULL,
	caja_tipo NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS (
    emp_legajo INT PRIMARY KEY,
	emp_fecha_nacimiento DATETIME NULL,
	emp_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL(suc_numero)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES (
    clie_codigo INT PRIMARY KEY,
    clie_fecha_nacimiento DATE,
	clie_ubicacion DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION(ubi_id)
);
GO

--SACAR COLUMNAS QUE NO SE USEN
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

--SACAR COLUMNAS QUE NO SE USEN
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS (
    env_codigo DECIMAL(18,0) PRIMARY KEY,
    env_costo DECIMAL(18,2),
    env_fecha_programada DATETIME,
    env_hora_inicio DECIMAL(18,0),
    env_hora_fin DECIMAL(18,0),
    env_fecha_hora_entrega DATETIME,
    env_estado NVARCHAR(255),
    env_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS(ticket_id),
    env_nro_cliente INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES(clie_codigo)
);
GO

--SACAR COLUMNAS QUE NO SE USEN
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS (
	desc_cod DECIMAL(18,0) PRIMARY KEY,
    desc_descripcion NVARCHAR(255),
    desc_fec_inicio DATE,
    desc_fec_fin DATE,
    desc_descuento DECIMAL(18,2),
	desc_tope DECIMAL(18,2)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTO_MEDIO_PAGO (
    mp_cod DECIMAL(18,0),
	desc_cod DECIMAL(18,0),
	PRIMARY KEY (mp_cod, desc_cod),
    FOREIGN KEY (mp_cod) REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(mp_cod),
    FOREIGN KEY (desc_cod) REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS(desc_cod)
);
GO

--SACAR COLUMNAS QUE NO SE USEN
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS (
	pago_id INT PRIMARY KEY,
    pago_tarjeta_nro NVARCHAR(255) NULL,
    pago_total DECIMAL(18,2),
    pago_cant_cuotas DECIMAL(18,0),
    pago_fecha_hora DATETIME,
    pago_medio DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(mp_cod),
    pago_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS(ticket_id),
    pago_descuento DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS(desc_cod)
);
GO
select * from CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS
--DANI
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA (
	pago_tarj_fecha SMALLDATETIME,
	pago_tarj_sucursal INT,
    pago_tarj_nro_pago INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Pago(pago_id),
    pago_tarj_nro_tarjeta INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta(tarj_id),
	pago_tarj_medio_pago DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_MEDIOS_PAGO(mp_cod),
	pago_tarj_cuotas DECIMAL(18,0) NULL,
	pago_tarj_monto_total DECIMAL(18,2) NULL
);
GO
--PENDIENTE
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PROMOCIONES (
    promo_cod DECIMAL(18,0) PRIMARY KEY,
    promo_detalle NVARCHAR(255),
    promo_fecha_desde DATE,
    promo_fecha_hasta DATE,
);
GO

--PENDIENTE
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

--PENDIENTE
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_REGLA_PROMOCION (
    promo_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Promocion(promo_cod),
    regla_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo(regla_cod)
);
GO

--PENDIENTE
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTOS (
    prod_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	prod_detalle NVARCHAR(255),
    prod_nombre NVARCHAR(255),
    prod_marca NVARCHAR(255),
    prod_precio DECIMAL(18,2),
    prod_sub_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(sub_cat_cod)
);
GO

--PENDIENTE
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_PRODUCTO_TICKET (
    productos_ticket_id INT PRIMARY KEY IDENTITY(1,1),
	producto_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Producto(prod_codigo),
    ticket_numero INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    cantidad DECIMAL(18,0),
);
GO

--DANI

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA (
    desc_cate_anio INT NOT NULL,
    desc_cate_mes INT NOT NULL,
    cat_id INT NOT NULL,
    monto_descuento DECIMAL(18, 2) NOT NULL,
    CONSTRAINT FK_BI_DESCUENTOS_Categoria FOREIGN KEY (cat_id) 
    REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIAS(cat_id)
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

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DIM_UBICACION AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION (
		ubi_localidad,
		ubi_provincia
	)
	SELECT
		S.suc_localidad,
		S.suc_provincia
	FROM
		CHRISTIAN_Y_LOS_MAKINSONS.Sucursal S
	UNION
	SELECT
		C.clie_localidad,
		C.clie_provincia
	FROM
		CHRISTIAN_Y_LOS_MAKINSONS.Cliente C;
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

----------------------------------------CREAR PROCEDURES TABLAS----------------------------------------

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CAJAS
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS (
        caja_id,
		id_sucursal,
		caja_numero,
		caja_tipo
    )
    SELECT DISTINCT
		C.id_caja,
        C.id_sucursal,
		C.caja_numero,
		CT.caja_nombre_tipo
    FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja C ON C.id_sucursal = S.suc_numero
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja_Tipo CT ON CT.id_caja_tipo = C.id_tipo_caja 
END;
GO

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

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_EMPLEADOS
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS (
		emp_legajo,
		emp_fecha_nacimiento,
		emp_sucursal
    )
    SELECT DISTINCT
        E.emp_legajo,
		E.emp_fecha_nacimiento,
		S.suc_numero
    FROM CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Empleado E ON E.emp_sucursal = S.suc_numero
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CLIENTES
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES (
		clie_codigo,
		clie_fecha_nacimiento,
		clie_ubicacion
    )
    SELECT DISTINCT
        C.clie_codigo,
		C.clie_fecha_nacimiento,
		U.ubi_id
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Cliente C
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_localidad = C.clie_localidad
		AND U.ubi_provincia = C.clie_provincia
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS(
		env_codigo,
		env_costo,
		env_fecha_programada,
		env_hora_inicio,
		env_hora_fin,
		env_fecha_hora_entrega,
		env_estado,
		env_nro_ticket,
		env_nro_cliente
    )
    SELECT DISTINCT
        E.env_codigo,
		E.env_costo,
		E.env_fecha_programada,
		E.env_hora_inicio,
		E.env_hora_fin,
		E.env_fecha_hora_entrega,
		E.env_estado,
		E.env_nro_ticket,
		C.clie_codigo
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Envio E
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES C
		ON E.env_nro_cliente = C.clie_codigo
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA
AS
BEGIN
    INSERT INTO  BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA (
        desc_cate_anio, 
        desc_cate_mes, 
        cat_id, 
        monto_descuento
    )
    SELECT
        YEAR(T.ticket_fecha_hora_venta) AS desc_cate_anio,
        MONTH(T.ticket_fecha_hora_venta) AS desc_cate_mes,
        BICATSUBCAT.cat_id,
        SUM(I.precio_producto_desc) AS monto_descuento
    FROM
        CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket I
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Ticket T ON I.ticket_numero = T.ticket_id
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Producto P ON I.producto_codigo = P.prod_codigo
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto SCP ON P.prod_sub_categoria = SCP.prod_sub_categoria
    JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_CATEGORIA_SUBCATEGORIA BICATSUBCAT ON SCP.prod_sub_categoria = BICATSUBCAT.subcat_id
    GROUP BY
        YEAR(T.ticket_fecha_hora_venta),
        MONTH(T.ticket_fecha_hora_venta),
        BICATSUBCAT.cat_id;
END;
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PAGOS_TARJETA
AS
BEGIN
	INSERT INTO BI_PAGOS_TARJETA(pago_tarj_fecha, pago_tarj_sucursal, pago_tarj_nro_tarjeta, pago_tarj_medio_pago, pago_tarj_nro_pago, pago_tarj_cuotas, pago_tarj_monto_total)
	SELECT
		TICK.ticket_fecha_hora_venta, C.id_sucursal, T.tarj_id, P.pago_medio ,P.pago_nro_ticket, P.pago_cant_cuotas, P.pago_total
	FROM
		CHRISTIAN_Y_LOS_MAKINSONS.Pago p 
	JOIN 
		CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago mp
	ON 
		p.pago_medio = mp.mp_cod
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta T
	ON
		T.tarj_nro = P.pago_tarjeta_nro
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.Items_Ticket IT
	ON
		P.pago_nro_ticket = IT.ticket_numero
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.Ticket TICK
	 ON
		IT.ticket_numero= TICK.ticket_id
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS C
	ON
		TICK.ticket_caja_id = C.caja_id
END
GO
----------------------------------------EXEC PROCEDURES----------------------------------------
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
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_TICKETS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_EMPLEADOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_CLIENTES;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_ENVIOS;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_DESCUENTOS_POR_CATEGORIA_SEGUN_FECHA
EXEC CHRISTIAN_Y_LOS_MAKINSONS.MIGRAR_BI_PAGOS_TARJETA
GO



----------------------------------------VIEWS SIMPLES----------------------------------------

--VISTA 1: Ticket Promedio mensual
--Valor promedio de las ventas (en $) según la localidad, año y mes.
--Se calcula en función de la sumatoria del importe de las ventas sobre el total de las mismas.
CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_TICKET_PROMEDIO_MENSUAL AS
SELECT
	U.ubi_localidad AS Localidad, --sacarlo de la dimension
	YEAR(T.ticket_fecha_hora_venta) AS Año, --sacarlo de la dimension
	MONTH(T.ticket_fecha_hora_venta) AS Mes, --sacarlo de la dimension
	ROUND(AVG(T.ticket_total_ticket), 2) AS Promedio_Venta
FROM 
	CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS T
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS C
		ON C.caja_id = T.ticket_caja_id
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_SUCURSAL S
		ON C.id_sucursal = S.suc_numero
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_UBICACION U
		ON U.ubi_id = S.suc_ubicacion
GROUP BY 
	U.ubi_localidad, 
	YEAR(T.ticket_fecha_hora_venta), 
	MONTH(T.ticket_fecha_hora_venta)
GO

--SELECT * FROM V_TICKET_PROMEDIO_MENSUAL;

----------------------------------------

--VISTA 2: Cantidad Unidades Promedio
--Cantidad promedio de artículos que se venden en función de los tickets según el turno
--para cada cuatrimestre de cada año. Se obtiene sumando la cantidad de artículos de
--todos los tickets correspondientes sobre la cantidad de tickets. Si un producto tiene
--más de una unidad en un ticket, para el indicador se consideran todas las unidades.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_CANTIDAD_UNIDADES_PROMEDIO AS
    WITH VentasConRangosHorarios AS (
        SELECT
            ticket_id,
            pt.cantidad,
            dim_turno.turno
        FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket t
            JOIN CHRISTIAN_Y_LOS_MAKINSONs.Items_Ticket pt
                ON t.ticket_id = pt.productos_ticket_id
            JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_TURNO dim_turno ON dim_turno.turno =
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
        turno,
        SUM(cantidad) AS total_products,
        COUNT(DISTINCT ticket_id) AS total_tickets
    FROM
        VentasConRangosHorarios
    GROUP BY
        turno
)
SELECT turno, CAST(total_products AS FLOAT) / total_tickets AS promedio_productos_vendidos
FROM VentasAgregadas;
GO

--SELECT * FROM V_CANTIDAD_UNIDADES_PROMEDIO;

----------------------------------------

--VISTA 3: Porcentaje anual de ventas
--Porcentaje anual de ventas registradas por rango etario del empleado según el tipo de caja para cada cuatrimestre.
--Se calcula tomando la cantidad de ventas correspondientes sobre el total de ventas anual.
CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_ANUAL_VENTAS AS
	WITH ventas_cuatrimestre AS (
		SELECT
			YEAR(ticket_fecha_hora_venta) AS Año,
			DATEPART(QUARTER, ticket_fecha_hora_venta) AS Cuatrimestre,
			CASE
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) < 25 THEN '<25'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 25 AND 35 THEN '25-35'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 35 AND 55 THEN '35-55'
				ELSE '>55'
			END AS [Rango Etario],
			c.caja_tipo AS [Tipo de Caja],
			COUNT(*) AS [Total Ventas Cuatrimestre]
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS t
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS e ON t.ticket_emp_legajo = e.emp_legajo
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS c ON t.ticket_caja_id = c.caja_id
		GROUP BY
			YEAR(ticket_fecha_hora_venta),
			DATEPART(QUARTER, ticket_fecha_hora_venta),
			CASE
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) < 25 THEN '<25'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 25 AND 35 THEN '25-35'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 35 AND 55 THEN '35-55'
				ELSE '>55'
			END,
			c.caja_tipo
	),
	ventas_anuales AS (
		SELECT
			YEAR(ticket_fecha_hora_venta) AS anio,
			CASE
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) < 25 THEN '<25'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 25 AND 35 THEN '25-35'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 35 AND 55 THEN '35-55'
				ELSE '>55'
			END AS [Rango Etario],
			c.caja_tipo,
			COUNT(*) AS [Total Ventas Anuales]
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.BI_TICKETS t
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_EMPLEADOS e ON t.ticket_emp_legajo = e.emp_legajo
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_CAJAS c ON t.ticket_caja_id = c.caja_id
		GROUP BY
			YEAR(ticket_fecha_hora_venta),
			CASE
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) < 25 THEN '<25'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 25 AND 35 THEN '25-35'
				WHEN DATEDIFF(YEAR, e.emp_fecha_nacimiento, GETDATE()) BETWEEN 35 AND 55 THEN '35-55'
				ELSE '>55'
			END,
			c.caja_tipo
	)
	SELECT
		vc.Año,
		vc.Cuatrimestre,
		vc.[Rango Etario],
		vc.[Tipo de Caja],
		SUM(vc.[Total Ventas Cuatrimestre]) AS [Total Ventas Cuatrimestre],
		SUM(va.[Total Ventas Anuales]) AS [Total Ventas Anuales],
		SUM(vc.[Total Ventas Cuatrimestre]) * 100.0 / SUM(va.[Total Ventas Anuales]) AS [Porcentaje Ventas Cuatrimestre]
	FROM
		ventas_cuatrimestre vc
		JOIN ventas_anuales va ON vc.Año = va.anio AND vc.[Rango Etario] = va.[Rango Etario] AND vc.[Tipo de Caja] = va.caja_tipo
	GROUP BY
		vc.Año,
		vc.Cuatrimestre,
		vc.[Rango Etario],
		vc.[Tipo de Caja];
GO


--SELECT * FROM V_PORCENTAJE_ANUAL_VENTAS;
--GO

----------------------------------------

--VENTAS_POR_TURNO
--Cantidad de ventas registradas por turno para cada localidad según el mes de cada año.

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_VENTAS_POR_TURNO AS
SELECT
    U.ubi_localidad AS Localidad,
    DATEPART(YEAR, T.ticket_fecha_hora_venta) AS Año,
    DATEPART(MONTH, T.ticket_fecha_hora_venta) AS Mes,
    D.turno AS Turno,
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
        END) = D.turno
GROUP BY
    U.ubi_localidad,
    DATEPART(YEAR, T.ticket_fecha_hora_venta),
    DATEPART(MONTH, T.ticket_fecha_hora_venta),
    D.turno;
GO


----------------------------------------

--VISTA 5: Porcentaje de descuento aplicados
--Porcentaje de descuento aplicados en función del total de los tickets según el mes de cada año.

--CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_DESCUENTO_APLICADO AS
--b c 
--GO

--SELECT * FROM V_PORCENTAJE_DESCUENTO_APLICADO;
--GO

----------------------------------------

--CATEGORIAS_MAYOR_DESCUENTO_PROMOCIONES
--Las tres categorías de productos con mayor descuento aplicado a partir de
--promociones para cada cuatrimestre de cada año.

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


--VISTA 7: Porcentaje de cumplimiento de envíos
--Porcentaje de cumplimiento de envíos en los tiempos programados por sucursal por año/mes (desvío)

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_PORCENTAJE_CUMPLIMIENTO_ENVIOS AS
	SELECT
		YEAR(env.env_fecha_programada) AS Año,
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
--Cantidad de envíos por rango etario de clientes para cada cuatrimestre de cada año.

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
    CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES C ON E.env_nro_cliente = C.clie_codigo
JOIN
    CHRISTIAN_Y_LOS_MAKINSONS.BI_DIM_RANGO_ETARIO R ON (CASE
            WHEN DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) < 25 THEN '<25'
            WHEN DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) BETWEEN 25 AND 35 THEN '25-35'
            WHEN DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) BETWEEN 35 AND 55 THEN '35-55'
            WHEN DATEDIFF(YEAR, C.clie_fecha_nacimiento, GETDATE()) > 55 THEN '>55'
        END) = R.rango_etario
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

--VISTA 9: Localidades con mayor costo de envío
--Las 5 localidades (tomando la localidad del cliente) con mayor costo de envío.

-- SELECT * FROM V_LOCALIDADES_MAYOR_COSTO_ENVIO;
-- GO

CREATE VIEW CHRISTIAN_Y_LOS_MAKINSONS.V_LOCALIDADES_MAYOR_COSTO_ENVIO AS
	WITH CostosPorLocalidad AS (
		SELECT
			U.ubi_localidad AS Localidad,
			SUM(env.env_costo) AS Costo_Total_Envio
		FROM
			CHRISTIAN_Y_LOS_MAKINSONS.BI_ENVIOS env
			JOIN CHRISTIAN_Y_LOS_MAKINSONS.BI_CLIENTES C ON env.env_nro_cliente = C.clie_codigo
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
--Las 3 sucursales con el mayor importe de pagos en cuotas, según el medio de pago,
--mes y año. Se calcula sumando los importes totales de todas las ventas en cuotas.

CREATE VIEW SUCURSALES_MAYOR_PAGOS_CUOTAS AS
WITH SucursalesOrdenadas AS (
    SELECT 
        YEAR(T.pago_tarj_fecha) AS AÑO,
        MONTH(T.pago_tarj_fecha) AS MES,
        T.pago_tarj_sucursal,
        T.pago_tarj_medio_pago,
        SUM(T.pago_tarj_monto_total) AS MontoTotal,
        ROW_NUMBER() OVER (PARTITION BY YEAR(T.pago_tarj_fecha), MONTH(T.pago_tarj_fecha), T.pago_tarj_medio_pago ORDER BY SUM(T.pago_tarj_monto_total) DESC) AS RN
    FROM 
        CHRISTIAN_Y_LOS_MAKINSONS.BI_PAGOS_TARJETA T
    GROUP BY
        YEAR(T.pago_tarj_fecha),
        MONTH(T.pago_tarj_fecha),
        T.pago_tarj_sucursal,
        T.pago_tarj_medio_pago
)
SELECT 
    AÑO,
    MES,
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
