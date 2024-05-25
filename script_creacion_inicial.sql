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

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Categoria;
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

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Descuetos_medio_pago', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuetos_medio_pago;
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

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_envios' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
END

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_clientes' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS'))
BEGIN
    DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
END



-- Crear las tablas
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
    caja_numero DECIMAL(18,0) PRIMARY KEY,
    caja_tipo DECIMAL(18,0) NULL,
    caja_sucursal INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sucursal(suc_numero)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Empleado (
    emp_legajo DECIMAL(18,0) PRIMARY KEY,
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
    clie_codigo DECIMAL(18,0) PRIMARY KEY,
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

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Ticket (
    ticket_numero DECIMAL(18,0) PRIMARY KEY,
    ticket_fecha_hora_venta DATETIME,
    nro_caja DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Caja(caja_numero),
    legajo_empleado DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Empleado(emp_legajo),
    ticket_tipo_comprobante NVARCHAR(255),
    ticket_subtotal DECIMAL(18,2),
    ticket_total_descuento_aplicado DECIMAL(18,2),
    ticket_total_descuento_aplicado_mp DECIMAL(18,2),
    ticket_total_envio DECIMAL(18,2),
    ticket_total_ticket DECIMAL(18,2)
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
    env_nro_ticket DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_numero),
    envid_nro_cliente DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta (
    tarj_nro DECIMAL(18,0) PRIMARY KEY,
    tarj_nro_cliente DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo),
    tarj_fecha_emision DATETIME NOT NULL,
    tarj_nombre NVARCHAR(255) NULL,
    tarj_fec_venc DATETIME NULL,
    tarj_nro_seguridad DECIMAL(18,0) NULL
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
    desc_detalle NVARCHAR(255),
    desc_tipo NVARCHAR(255),
    desc_valor DECIMAL(18,2),
    desc_fec_desde DATE,
    desc_fec_hasta DATE,
    desc_estado NVARCHAR(255)
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
    mp_cod DECIMAL(18,0) PRIMARY KEY,
    mp_detalle NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuetos_medio_pago (
    descuento__medio_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Descuento(desc_cod),
    descuento__medio_pago_cod DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(mp_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Pago (
    pago_nro DECIMAL(18,0) PRIMARY KEY,
    pago_total DECIMAL(18,2),
    pago_cant_cuotas DECIMAL(18,0),
    pago_fecha_hora DATETIME,
    pago_medio DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago(mp_cod),
    pago_nro_ticket DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_numero),
    pago_descuento DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Descuento(desc_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Categoria (
    categoria_cod DECIMAL(18,0) PRIMARY KEY,
    categoria_detalle NVARCHAR(255),
    categoria_estado NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria (
    sub_cat_cod DECIMAL(18,0) PRIMARY KEY,
    sub_cat_detalle NVARCHAR(255),
    sub_cat_estado NVARCHAR(255),
    sub_cat_cod_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Categoria(categoria_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto (
    prod_codigo DECIMAL(18,0) PRIMARY KEY,
    prod_descripcion NVARCHAR(255),
    prod_precio DECIMAL(18,2),
    prod_fecha_alta DATE,
    prod_fecha_baja DATE,
    prod_stock DECIMAL(18,0),
    prod_stock_min DECIMAL(18,0),
    prod_unidad_medida NVARCHAR(255),
    prod_marca NVARCHAR(255),
    prod_estado NVARCHAR(255),
    prod_sub_categoria DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(sub_cat_cod)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket (
    producto_codigo DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Producto(prod_codigo),
    ticket_numero DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_numero),
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
        -- podemos modificar asi la data? no podemos migrarlo directamente?
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

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_envios
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Envio (
        env_codigo, env_costo, env_fecha_programada, env_hora_inicio, env_hora_fin, env_fecha_hora_entrega, env_estado, env_nro_ticket, envid_nro_cliente
    )
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Cliente ()
END
GO


EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_envios;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_clientes;


-- Chris
-- EMPLEADOS
-- CATEGORIAS
-- --SUBCATEGORIAS
--
-- MATI
-- --ENVIOS
-- --CLIENTES
--
-- DANI/MARU
-- --Corrección DER

