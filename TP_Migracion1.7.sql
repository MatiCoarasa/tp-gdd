USE GD1C2024;
GO

----------------------------------------CREAR ESQUEMA----------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'CHRISTIAN_Y_LOS_MAKINSONS')
BEGIN 
    EXEC('CREATE SCHEMA CHRISTIAN_Y_LOS_MAKINSONS')
END
GO

----------------------------------------BORRAR TABLAS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Categoria', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Categoria;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Promocion', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Promocion;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Envio', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Envio;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Pago', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Descuento', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuento;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Ticket', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Ticket;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Cliente', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Cliente;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Empleado', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Empleado;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Caja', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Caja;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sucursal', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sucursal;
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Supermercado', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Supermercado;
GO

----------------------------------------BORRAR PROCEDURES----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_supermercados' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sucursales' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_empleados' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_empleados;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tickets' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_tickets;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_categorias' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_categorias;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sub_categorias' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sub_categorias_de_categoria' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_categoria;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cajas' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cajas_de_sucursal' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas_de_sucursal;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_productos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sub_categorias_de_producto' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_producto;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_productos_por_ticket' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos_por_ticket;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_medios_pagos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_medios_pagos;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_descuentos_medios_pagos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos_medios_pagos;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_descuentos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_clientes' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tarjetas' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_tarjetas;
GO

----------------------------------------CREAR TABLAS----------------------------------------
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Supermercado (
    super_id DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
    super_nombre NVARCHAR(255) NULL,
    super_razon_social NVARCHAR(255) NULL,
    super_cuit NVARCHAR(255) NULL,
    super_iibb NVARCHAR(255) NULL,
    super_domicilio NVARCHAR(255) NULL,
    super_condicion_fiscal NVARCHAR(255) NULL,
    super_fecha_ini_actividad NVARCHAR(255) NULL,
    super_localidad NVARCHAR(255) NULL,
    super_provincia NVARCHAR(255) NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sucursal (
    suc_numero INT PRIMARY KEY ,
    suc_nombre NVARCHAR(255),
    suc_direccion NVARCHAR(255),
    suc_localidad NVARCHAR(255),
    suc_provincia NVARCHAR(255),
    id_supermercado DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Supermercado(super_id)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Caja (
	caja_id DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
    caja_numero DECIMAL(18,0),
	caja_tipo NVARCHAR(255),
	id_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero),
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Empleado (
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

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Cliente (
    clie_codigo INT PRIMARY KEY IDENTITY(1,1),
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

--REVISAR ticket_caja_id
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Ticket (
	ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    ticket_numero DECIMAL(18,0),
    ticket_fecha_hora_venta DATETIME,
    ticket_caja_id DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Caja(caja_id),
    legajo_empleado INT null,
	ticket_tipo_comprobante NVARCHAR(255),
    ticket_subtotal_productos DECIMAL(18,2),
    ticket_total_descuento_aplicado DECIMAL(18,2),
    ticket_total_descuento_aplicado_mp DECIMAL(18,2),
    ticket_total_envio DECIMAL(18,2),
    ticket_total_ticket DECIMAL(18,2),
	ticket_suc_numero INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero),
	ticket_id_cliente INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Envio (
    env_codigo DECIMAL(18,0) PRIMARY KEY,
    env_costo DECIMAL(18,2),
    env_fecha_programada DATETIME,
    env_hora_inicio DECIMAL(18,0),
    env_hora_fin DECIMAL(18,0),
    env_fecha_hora_entrega DATETIME,
    env_estado NVARCHAR(255),
    env_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    envid_nro_cliente INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta (
    tarj_nro NCHAR(9) PRIMARY KEY,
    tarj_id_cliente INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo),
    tarj_fec_venc DATETIME NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo (
    regla_cod DECIMAL(18,0) PRIMARY KEY,
    regla_descripcion NVARCHAR(255),
    regla_tipo NVARCHAR(255),
    regla_valor_min DECIMAL(18,2),
    regla_dias_aplica NVARCHAR(255),
    regla_monto_dto DECIMAL(18,2),
    regla_fecha_desde DATETIME,
    regla_fecha_hasta DATETIME
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuento (
    desc_cod DECIMAL(18,0) PRIMARY KEY,
    desc_descripcion NVARCHAR(255),
    desc_fec_inicio DATE,
    desc_fec_fin DATE,
    desc_descuento DECIMAL(18,2),
	desc_tope DECIMAL(18,2)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Promocion (
    promo_cod DECIMAL(18,0) PRIMARY KEY,
    promo_detalle NVARCHAR(255),
    promo_fecha_desde DATE,
    promo_fecha_hasta DATE,
    promo_estado NVARCHAR(255),
    promo_cod_regla DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo(regla_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago (
    mp_cod DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
    mp_detalle NVARCHAR(255),
	mp_tipo NVARCHAR(255),
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago (
    descuento__medio_desc_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Descuento(desc_cod),
    descuento__medio_mp_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(mp_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago (
    pago_nro DECIMAL(18,0) PRIMARY KEY,
    pago_total DECIMAL(18,2),
    pago_cant_cuotas DECIMAL(18,0),
    pago_fecha_hora DATETIME,
    pago_medio DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(mp_cod),
    pago_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    pago_descuento DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Descuento(desc_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Categoria (
    categoria_cod DECIMAL(18,0) PRIMARY KEY,
    categoria_detalle NVARCHAR(255) NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria (
    sub_cat_cod DECIMAL(18,0) PRIMARY KEY,
    sub_cat_detalle NVARCHAR(255) NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_categoria (
    sub_cat_cod_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(sub_cat_cod),
	cod_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Categoria(categoria_cod),
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto (
    prod_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	prod_detalle NVARCHAR(255),
    prod_nombre NVARCHAR(255),
    prod_marca NVARCHAR(255),
    prod_precio DECIMAL(18,2),
    prod_sub_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(sub_cat_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto (
	prod_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Producto(prod_codigo),
    prod_sub_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(sub_cat_cod),
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket (
    producto_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Producto(prod_codigo),
    ticket_numero INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    cantidad DECIMAL(18,0),
    PRIMARY KEY (producto_codigo, ticket_numero)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo (
    producto_promo_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Producto(prod_codigo),
    producto_promo_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Promocion(promo_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta (
    pago_tarj_nro_pago DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Pago(pago_nro),
    pago_tarj_nro_tarjeta NCHAR(9) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta(tarj_nro),
	pago_tarj_cuotas DECIMAL(18,0) NULL
);
GO

----------------------------------------CREATE PROCEDURES----------------------------------------
CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Supermercado (
        super_nombre,
        super_razon_social,
        super_cuit,
        super_iibb,
        super_domicilio,
        super_condicion_fiscal,
        super_fecha_ini_actividad,
        super_localidad,
        super_provincia
    )
    SELECT DISTINCT
        M.SUPER_NOMBRE,
        M.SUPER_RAZON_SOC,
        M.SUPER_CUIT,
        M.SUPER_IIBB,
        M.SUPER_DOMICILIO,
        M.SUPER_CONDICION_FISCAL,
        M.SUPER_FECHA_INI_ACTIVIDAD,
        M.SUPER_LOCALIDAD,
        M.SUPER_PROVINCIA
    FROM gd_esquema.Maestra M
    WHERE NOT EXISTS (
        SELECT 1
        FROM CHRISTIAN_Y_LOS_MAKINSONS.Supermercado S
        WHERE S.super_nombre = M.SUPER_NOMBRE
        AND S.super_razon_social = M.SUPER_RAZON_SOC
        AND S.super_cuit = M.SUPER_CUIT
        AND S.super_iibb = M.SUPER_IIBB
        AND S.super_domicilio = M.SUPER_DOMICILIO
        AND S.super_condicion_fiscal = M.SUPER_CONDICION_FISCAL
        AND S.super_fecha_ini_actividad = M.SUPER_FECHA_INI_ACTIVIDAD
        AND S.super_localidad = M.SUPER_LOCALIDAD
        AND S.super_provincia = M.SUPER_PROVINCIA
    );
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Sucursal (
		suc_numero,
		suc_nombre,
		suc_direccion,
		suc_localidad,
		suc_provincia,
		id_supermercado
	)
	SELECT DISTINCT
		CAST(SUBSTRING(S.SUCURSAL_NOMBRE, CHARINDEX(':', S.SUCURSAL_NOMBRE) + 1, LEN(S.SUCURSAL_NOMBRE)) AS INT),
		S.SUCURSAL_NOMBRE,
		S.SUCURSAL_DIRECCION,
		S.SUCURSAL_LOCALIDAD,
		S.SUCURSAL_PROVINCIA,
		(SELECT s.super_id FROM CHRISTIAN_Y_LOS_MAKINSONS.Supermercado S)
	FROM gd_esquema.Maestra S
	WHERE NOT EXISTS (
		SELECT 1
		FROM CHRISTIAN_Y_LOS_MAKINSONS.Sucursal CS
		WHERE CS.suc_nombre = S.SUCURSAL_NOMBRE
		AND CS.suc_localidad = S.SUCURSAL_LOCALIDAD
		AND CS.suc_provincia = S.SUCURSAL_PROVINCIA
	);

END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_empleados
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Empleado (
		emp_dni,
		emp_apellido,
		emp_fecha_nacimiento,
		emp_fecha_registro,
		emp_email,
		emp_nombre,
		emp_telefono,
		emp_sucursal
	)
	SELECT DISTINCT 
	EMPLEADO_DNI, 
	EMPLEADO_APELLIDO, 
	EMPLEADO_FECHA_NACIMIENTO, 
	EMPLEADO_FECHA_REGISTRO, 
	EMPLEADO_MAIL, 
	EMPLEADO_NOMBRE, 
	EMPLEADO_TELEFONO, 
	CAST(SUBSTRING(SUCURSAL_NOMBRE, CHARINDEX(':', SUCURSAL_NOMBRE) + 1, LEN(SUCURSAL_NOMBRE)) AS INT)
	FROM gd_esquema.Maestra 
	WHERE TICKET_NUMERO IN 
		(SELECT DISTINCT TICKET_NUMERO FROM gd_esquema.Maestra) AND EMPLEADO_DNI IS NOT NULL

END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_categorias
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Categoria(
		categoria_cod,
		categoria_detalle
	)
	SELECT DISTINCT 
		CAST(SUBSTRING(M.PRODUCTO_CATEGORIA, CHARINDEX('°', M.PRODUCTO_CATEGORIA) + 1, LEN(M.PRODUCTO_CATEGORIA)) AS INT),
		M.PRODUCTO_CATEGORIA
	FROM gd_esquema.Maestra M
	WHERE PRODUCTO_CATEGORIA IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(
		sub_cat_cod,
		sub_cat_detalle
	)
	SELECT DISTINCT
		CAST(SUBSTRING(M.PRODUCTO_SUB_CATEGORIA, CHARINDEX('°', M.PRODUCTO_SUB_CATEGORIA) + 1, LEN(M.PRODUCTO_SUB_CATEGORIA)) AS INT),
		M.PRODUCTO_SUB_CATEGORIA
	FROM gd_esquema.Maestra M
	WHERE PRODUCTO_SUB_CATEGORIA IS NOT NULL 

END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_categoria
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria(
		cod_categoria,
		sub_cat_cod_categoria
	)
	SELECT DISTINCT 
	CAST(SUBSTRING(PRODUCTO_CATEGORIA, CHARINDEX('°', PRODUCTO_CATEGORIA) + 1, LEN(PRODUCTO_CATEGORIA)) AS INT),
	CAST(SUBSTRING(PRODUCTO_SUB_CATEGORIA, CHARINDEX('°', PRODUCTO_SUB_CATEGORIA) + 1, LEN(PRODUCTO_SUB_CATEGORIA)) AS INT) 
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_SUB_CATEGORIA IS NOT NULL 
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Caja(
		caja_numero,
		caja_tipo,
		id_sucursal
	)
	SELECT DISTINCT 
	CAJA_NUMERO, 
	CAJA_TIPO,
	CAST(SUBSTRING(SUCURSAL_NOMBRE, CHARINDEX(':', SUCURSAL_NOMBRE) + 1, LEN(SUCURSAL_NOMBRE)) AS INT)
	FROM gd_esquema.Maestra WHERE
	CAJA_NUMERO IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_tickets
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Ticket(
		ticket_numero,
		ticket_fecha_hora_venta,
		ticket_caja_id,
		ticket_tipo_comprobante,
		ticket_subtotal_productos,
		ticket_total_descuento_aplicado,
		ticket_total_descuento_aplicado_mp,
		ticket_total_envio,
		ticket_total_ticket,
		ticket_suc_numero,
		ticket_id_cliente
	)
	SELECT DISTINCT 
	S.TICKET_NUMERO, 
	S.TICKET_FECHA_HORA, 
	C.CAJA_ID,
	S.TICKET_TIPO_COMPROBANTE, 
	S.TICKET_SUBTOTAL_PRODUCTOS, 
	S.TICKET_TOTAL_DESCUENTO_APLICADO, 
	S.TICKET_TOTAL_DESCUENTO_APLICADO_MP, 
	S.TICKET_TOTAL_ENVIO,
	S.TICKET_TOTAL_TICKET,
	CAST(SUBSTRING(S.SUCURSAL_NOMBRE, CHARINDEX(':', S.SUCURSAL_NOMBRE) + 1, LEN(S.SUCURSAL_NOMBRE)) AS INT),
	CL.clie_codigo
	FROM
		gd_esquema.Maestra AS S
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Caja AS C ON C.caja_numero = S.CAJA_NUMERO AND C.caja_tipo = S.CAJA_TIPO 
	JOIN CHRISTIAN_Y_LOS_MAKINSONS.Cliente AS CL on CL.clie_dni = S.CLIENTE_DNI
	WHERE
		S.CAJA_NUMERO IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Producto(
		prod_detalle,
		prod_nombre,
		prod_marca,
		prod_precio,
		prod_sub_categoria 
	)
	SELECT DISTINCT
		M.PRODUCTO_DESCRIPCION,
		M.PRODUCTO_NOMBRE,
		M.PRODUCTO_MARCA,
		M.PRODUCTO_PRECIO,
		CAST(SUBSTRING(M.PRODUCTO_SUB_CATEGORIA, CHARINDEX('°', M.PRODUCTO_SUB_CATEGORIA) + 1, LEN(M.PRODUCTO_SUB_CATEGORIA)) AS INT)
	FROM gd_esquema.Maestra M
	WHERE CAST(SUBSTRING(M.PRODUCTO_NOMBRE, CHARINDEX(':', M.PRODUCTO_NOMBRE) + 1, LEN(M.PRODUCTO_NOMBRE)) AS BIGINT) IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_producto
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto(
		prod_codigo,
		prod_sub_categoria
	)
	SELECT DISTINCT
		P.prod_codigo,
		P.prod_sub_categoria
	FROM producto P
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_medios_pagos
AS
BEGIN

    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(
        mp_detalle,
		mp_tipo
    )
    SELECT DISTINCT
        M.PAGO_MEDIO_PAGO,
        M.PAGO_TIPO_MEDIO_PAGO
    FROM gd_esquema.Maestra M
    WHERE NOT EXISTS (
        SELECT 1
        FROM CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago MP
        WHERE MP.mp_detalle = M.PAGO_MEDIO_PAGO
        AND MP.mp_tipo = M.PAGO_TIPO_MEDIO_PAGO
    );
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Descuento(
		desc_cod,
		desc_descripcion,
		desc_fec_inicio,
		desc_fec_fin,
		desc_descuento,
		desc_tope
    )
    SELECT DISTINCT
       M.DESCUENTO_CODIGO,
       M.DESCUENTO_DESCRIPCION,
	   M.DESCUENTO_FECHA_INICIO,
	   M.DESCUENTO_FECHA_FIN,
	   M.DESCUENTO_PORCENTAJE_DESC,
	   M.DESCUENTO_TOPE
    FROM gd_esquema.Maestra M
    WHERE 
		M.DESCUENTO_CODIGO IS NOT NULL  -- Agregamos esta condición para evitar valores nulos de M.DESCUENTO_CODIGO
	AND NOT EXISTS (
        SELECT 1
        FROM CHRISTIAN_Y_LOS_MAKINSONS.Descuento D
        WHERE D.desc_cod = M.DESCUENTO_CODIGO
		AND D.desc_cod = M.DESCUENTO_CODIGO
		AND D.desc_fec_inicio = M.DESCUENTO_FECHA_INICIO
		AND D.desc_fec_fin = M.DESCUENTO_FECHA_FIN
		AND D.desc_descuento = M.DESCUENTO_PORCENTAJE_DESC
		AND D.desc_tope = M.DESCUENTO_TOPE
    );
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos_medios_pagos
AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago (descuento__medio_desc_cod, descuento__medio_mp_cod)
	SELECT
		D.desc_cod,
		MP.mp_cod
	FROM
		gd_esquema.Maestra M
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.Descuento D ON M.DESCUENTO_CODIGO = D.desc_cod
	JOIN
		CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago MP ON M.PAGO_MEDIO_PAGO = MP.mp_detalle AND M.PAGO_TIPO_MEDIO_PAGO = MP.mp_tipo;
      
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Cliente (
	    clie_nombre,
	    clie_apellido,
	    clie_dni,
	    clie_fecha_registro,
	    clie_telefono,
	    clie_mail,
	    clie_fecha_nacimiento,
	    clie_domicilio,
	    clie_localidad,
	    clie_provincia
    )
    SELECT DISTINCT
        m.CLIENTE_NOMBRE,
        m.CLIENTE_APELLIDO,
        m.CLIENTE_DNI,
        m.CLIENTE_FECHA_REGISTRO,
        m.CLIENTE_TELEFONO,
        m.CLIENTE_MAIL,
        m.CLIENTE_FECHA_NACIMIENTO,
        m.CLIENTE_DOMICILIO,
        m.CLIENTE_LOCALIDAD,
        m.CLIENTE_PROVINCIA
    FROM gd_esquema.Maestra m
	WHERE CLIENTE_DNI IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_tarjetas
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta (
	    tarj_nro,
	    tarj_id_cliente,
	    tarj_fec_venc
    )
    SELECT DISTINCT
        M.PAGO_TARJETA_NRO,
		C.clie_codigo,
		M.PAGO_TARJETA_FECHA_VENC	
    FROM
		gd_esquema.Maestra AS M JOIN CHRISTIAN_Y_LOS_MAKINSONS.Cliente AS C ON M.CLIENTE_DNI = C.clie_dni
	WHERE
		PAGO_TARJETA_NRO IS NOT NULL
		AND NOT EXISTS (
		SELECT 1
		FROM CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta AS T
		WHERE M.PAGO_TARJETA_NRO= t.tarj_nro)
END
GO

----------------------------------------EXEC PROCEDURES----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_empleados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_tickets;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_envios; --MATI
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_tarjetas;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_reglas_promo; --MATI
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_promociones; --MATI
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_medios_pagos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos_medios_pagos;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_pagos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_categorias;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_categoria;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_producto;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos_por_ticket;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos_promo;
--EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_pagos_tarjeta;

----------------------------------------SELECTS PARA TESTEAR----------------------------------------
select * from gd_esquema.Maestra
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Supermercado
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Sucursal
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Caja
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Empleado order by emp_sucursal
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Cliente
select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Ticket
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Envio
select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Descuento
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Promocion
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Pago
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Categoria
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_categoria
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta

----------------------------------------TABLAS----------------------------------------
--Supermercado
--Sucursal
--Caja
--Empleado
--Cliente
--Ticket
--Envio
--Tarjeta
--Reglas_promo
--Descuento
--Promocion
--Medio_Pago
--Descuentos_medio_pago
--Pago
--Categoria
--Sub_categoria
--Subcategorias_de_categoria
--Producto
--Sub_categorias_de_producto
--Productos_del_ticket
--Producto_promo
--Pago_tarjeta
