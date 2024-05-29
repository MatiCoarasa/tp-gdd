USE GD1C2024;
GO

-- Crear el esquema si no existe
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'CHRISTIAN_Y_LOS_MAKINSONS')
BEGIN 
    EXEC('CREATE SCHEMA CHRISTIAN_Y_LOS_MAKINSONS')
END
GO

-- Cada vez que iniciamos, borramos las tablas, as� podemos testear tranquilos
-- Las tablas se borran en el orden correcto para evitar conflictos de claves for�neas

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_producto;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Promocion', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Promocion;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Envio', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Envio;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago_tarjeta;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Pago', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Descuento', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuento;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Ticket', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Ticket;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Cliente', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Cliente;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Empleado', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Empleado;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.cajas_de_sucursal', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.cajas_de_sucursal;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Caja', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Caja;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sucursal', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sucursal;
GO


IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Supermercado', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Supermercado;
GO



-- Borrar los procedures
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_supermercados' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sucursales' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_empleados' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_empleados;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tickets' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_tickets;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_categorias' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_categorias;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sub_categorias' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sub_categorias_de_categoria' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_categoria;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cajas' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cajas_de_sucursal' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas_de_sucursal;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_clientes' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_envios' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_envios;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_reglas_promo' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_reglas_promo;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_promos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_promos;
END


IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_productos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_sub_categorias_de_producto' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_producto;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_productos_por_ticket' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos_por_ticket;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_medios_pagos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_medios_pagos;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_descuentos_medios_pagos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos_medios_pagos;
END


IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_descuentos' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos;
END




-- Crear las tablas
-- hay un cambio con lo de los medios de pagos
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
	caja_tipo NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.cajas_de_sucursal (
   cajas_de_sucursal_suc_num INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero),
   cajas_de_sucursal_caja_id DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Caja(caja_id)
   --cajas_de_sucursal_suc_num INT,
   --cajas_de_sucursal_caja_id DECIMAL(18,0)
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
    clie_codigo DECIMAL(18,0) IDENTITY(1, 1) PRIMARY KEY,
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

-- caso de error con el ticket numero 1351388438 que es igual -> no es la PK -> PK es un identity
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Ticket (
	ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    ticket_numero DECIMAL(18,0),
    ticket_fecha_hora_venta DATETIME,
	--ojo aca 
    ticket_caja_id DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Caja(caja_id),
    --legajo_empleado INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Empleado(emp_legajo),
    legajo_empleado INT null,
	ticket_tipo_comprobante NVARCHAR(255),
    ticket_subtotal_productos DECIMAL(18,2),
    ticket_total_descuento_aplicado DECIMAL(18,2),
    ticket_total_descuento_aplicado_mp DECIMAL(18,2),
    ticket_total_envio DECIMAL(18,2),
    ticket_total_ticket DECIMAL(18,2),
	ticket_suc_numero INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Envio (
    env_codigo DECIMAL(18,0) IDENTITY (1,1) PRIMARY KEY,
    env_costo DECIMAL(18,2),
    env_fecha_programada DATETIME,
    env_hora_inicio DECIMAL(18,0),
    env_hora_fin DECIMAL(18,0),
    env_fecha_hora_entrega DATETIME,
    env_estado NVARCHAR(255),
    env_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    env_nro_cliente DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta (
    tarj_nro DECIMAL(18,0) PRIMARY KEY,
    tarj_nro_cliente DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo),
    --tarj_fecha_emision DATETIME NOT NULL,
    tarj_nombre NVARCHAR(255) NULL,
    tarj_fec_venc DATETIME NULL,
    tarj_nro_seguridad DECIMAL(18,0) NULL
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo (
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
    promo_cod_regla DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo(regla_cod)
);
GO

-- en vez de numero de pago tiene el codigo del medio de pago y asi queda asociado
-- HAY QUE REFLEJAR ESTO CON EL DER
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
    categoria_detalle NVARCHAR(255) null
    --categoria_estado NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria (
    sub_cat_cod DECIMAL(18,0) PRIMARY KEY,
    sub_cat_detalle NVARCHAR(255) null
    --sub_cat_estado NVARCHAR(255),
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
    pago_tarj_nro_tarjeta DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta(tarj_nro),
	pago_tarj_cuotas DECIMAL(18,0) NULL
);
GO

-- Filtrar datos de supermercado para migrar informacion

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados
AS
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
		caja_tipo
	)
	SELECT DISTINCT 
	CAJA_NUMERO, 
	CAJA_TIPO
	FROM gd_esquema.Maestra WHERE
	CAJA_NUMERO IS NOT NULL
END
GO

--quizas cajas_sucursal? plural?

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas_de_sucursal
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.cajas_de_sucursal(
		cajas_de_sucursal_suc_num,
		cajas_de_sucursal_caja_id
	)
	SELECT DISTINCT 
	CAST(SUBSTRING(S.SUCURSAL_NOMBRE, CHARINDEX(':', S.SUCURSAL_NOMBRE) + 1, LEN(S.SUCURSAL_NOMBRE)) AS INT),
	C.CAJA_ID
	FROM gd_esquema.Maestra AS S JOIN 
	CHRISTIAN_Y_LOS_MAKINSONS.Caja AS C ON
	C.caja_numero = S.CAJA_NUMERO AND
	C.caja_tipo = S.CAJA_TIPO
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
		ticket_suc_numero
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
	CAST(SUBSTRING(S.SUCURSAL_NOMBRE, CHARINDEX(':', S.SUCURSAL_NOMBRE) + 1, LEN(S.SUCURSAL_NOMBRE)) AS INT)
	FROM gd_esquema.Maestra AS S JOIN 
	CHRISTIAN_Y_LOS_MAKINSONS.Caja AS C ON 
	C.caja_numero = S.CAJA_NUMERO AND C.caja_tipo = S.CAJA_TIPO 
	WHERE S.CAJA_NUMERO IS NOT NULL 
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
END
GO

-- todo: dependencia de TICKET y CLIENTE
-- CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_envios
-- AS
-- BEGIN
-- 	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Envio (
--         env_costo,
-- 	    env_fecha_programada,
-- 	    env_hora_inicio,
-- 	    env_hora_fin,
-- 	    env_fecha_hora_entrega,
-- 	    env_estado,
-- 	    env_nro_ticket,
-- 	    env_nro_cliente
--     )
--     SELECT DISTINCT
--         m.ENVIO_COSTO,
--         m.ENVIO_FECHA_PROGRAMADA,
--         m.ENVIO_HORA_INICIO,
--         m.ENVIO_HORA_FIN,
--         m.ENVIO_FECHA_ENTREGA,
--         m.ENVIO_ESTADO,
--         m.TICKET_NUMERO,
--         m.CLIENTE_DNI
--     FROM gd_esquema.Maestra m
--     WHERE
--         m.ENVIO_COSTO IS NOT NULL AND
--         m.ENVIO_FECHA_PROGRAMADA IS NOT NULL AND
--         m.ENVIO_HORA_INICIO IS NOT NULL AND
--         m.ENVIO_HORA_FIN IS NOT NULL AND
--         m.ENVIO_FECHA_ENTREGA IS NOT NULL AND
--         m.ENVIO_ESTADO IS NOT NULL;
-- END
-- GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_reglas_promo
AS
BEGIN
INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo (
    regla_descripcion,
    regla_descuento_aplica_prod,
    regla_cant_aplica_regla,
    regla_cant_aplica_desc,
    regla_cant_max,
    regla_aplica_misma_marca,
    regla_aplica_mismo_prod
 )
 SELECT DISTINCT
     m.REGLA_DESCRIPCION,
     m.REGLA_DESCUENTO_APLICABLE_PROD,
     m.REGLA_CANT_APLICABLE_REGLA,
     m.REGLA_CANT_APLICA_DESCUENTO,
     m.REGLA_CANT_MAX_PROD,
     m.REGLA_APLICA_MISMA_MARCA,
     m.REGLA_APLICA_MISMO_PROD
 FROM gd_esquema.Maestra m
 WHERE
     m.REGLA_DESCRIPCION IS NOT NULL AND
     m.REGLA_DESCUENTO_APLICABLE_PROD IS NOT NULL AND
     m.REGLA_CANT_APLICABLE_REGLA IS NOT NULL AND
     m.REGLA_CANT_APLICA_DESCUENTO IS NOT NULL AND
     m.REGLA_CANT_MAX_PROD IS NOT NULL AND
     m.REGLA_APLICA_MISMA_MARCA IS NOT NULL AND
     m.REGLA_APLICA_MISMO_PROD IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_promos
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Promocion (
	    promo_cod,
	    promo_detalle,
	    promo_fecha_desde,
	    promo_fecha_hasta,
	    promo_cod_regla
    )
    SELECT DISTINCT
        m.PROMO_CODIGO,
        m.PROMOCION_DESCRIPCION,
        m.PROMOCION_FECHA_INICIO,
        m.PROMOCION_FECHA_FIN,
        Rp.regla_cod
    FROM gd_esquema.Maestra m JOIN
        CHRISTIAN_Y_LOS_MAKINSONS.Reglas_promo Rp on
            m.REGLA_DESCRIPCION = Rp.regla_descripcion AND
            m.REGLA_DESCUENTO_APLICABLE_PROD = Rp.regla_descuento_aplica_prod AND
            m.REGLA_CANT_APLICABLE_REGLA = Rp.regla_cant_aplica_regla AND
            m.REGLA_CANT_APLICA_DESCUENTO = Rp.regla_cant_aplica_desc AND
            m.REGLA_CANT_MAX_PROD = Rp.regla_cant_max AND
            m.REGLA_APLICA_MISMA_MARCA = Rp.regla_aplica_misma_marca AND
            m.REGLA_APLICA_MISMO_PROD = Rp.regla_aplica_mismo_prod
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



--ejecutamos procedures
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_empleados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_categorias;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_categoria;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas_de_sucursal;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_tickets;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_producto;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_medios_pagos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_descuentos_medios_pagos;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_reglas_promo;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_promos;
-- EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_envios;
-- EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_productos_por_ticket;



--SELECT DISTINCT
--        D.desc_cod,
--        MP.mp_cod
--    FROM CHRISTIAN_Y_LOS_MAKINSONS.Descuento D
--    CROSS JOIN CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago MP

-- EMPLEADOS/CATEGORIAS/SUBCATEGORIAS/CAJA (CHRIS) -- Hecho 
-- Tarjeta (CHRIS) -- OnGoing
-- ENVIOS/CLIENTES/ (MATI)

-- Sucursal y Supermercado (hecho)

-- EMPLEADOS Exito parcial. Tengo 63 empleados no null pero hay varias filas null

--detalleSubCategoria detallesCategoria

--Hay ahora una tabla intermedia dado que se descubrio que una categoria puede tener varias subcategorias pero que una subcategoria puede corresponder a varias categorias
--como un ejemlo puede pensarse productos lacteos y productos derivado animal y las subcategorias leches y quesos. Tanto la leche como el queso puede ser producto derivado animal o lacteos. 
--Mas aun la leche y el queso podrian corresponder a productos derivado no animal (existe la leche y el queso de vaca, de cabra, de coco y soja, etc.)


--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Caja
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.cajas_de_sucursal
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Categoria
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria
--select top 100 * from GD1C2024.CHRISTIAN_Y_LOS_MAKINSONS.Sub_categorias_de_categoria