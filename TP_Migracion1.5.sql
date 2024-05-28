USE GD1C2024;
GO


-- Crear el esquema si no existe
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'CHRISTIAN_Y_LOS_MAKINSONS')
BEGIN 
    EXEC('CREATE SCHEMA CHRISTIAN_Y_LOS_MAKINSONS')
END
GO


-- Cada vez que iniciamos, borramos las tablas, así podemos testear tranquilos
-- Las tablas se borran en el orden correcto para evitar conflictos de claves foráneas

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Productos_del_ticket;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto_promo;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Producto', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Producto;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Categoria;
GO

IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria', 'U') IS NOT NULL 
    DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria;
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
    env_codigo DECIMAL(18,0) PRIMARY KEY,
    env_costo DECIMAL(18,2),
    env_fecha_programada DATETIME,
    env_hora_inicio DECIMAL(18,0),
    env_hora_fin DECIMAL(18,0),
    env_fecha_hora_entrega DATETIME,
    env_estado NVARCHAR(255),
    env_nro_ticket INT FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Ticket(ticket_id),
    envid_nro_cliente DECIMAL(18,0) FOREIGN KEY REFERENCES CHRISTIAN_Y_LOS_MAKINSONS.Cliente(clie_codigo)
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
-- en vez de numero de pago tiene el codigo del medio de pago y asi queda asociado
-- HAY QUE REFLEJAR ESTO CON EL DER
CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Medio_Pago (
    mp_cod DECIMAL(18,0) PRIMARY KEY,
    mp_detalle NVARCHAR(255)
);
GO

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.Descuentos_medio_pago (
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
		categoria_cod
	)
	SELECT DISTINCT 
	CAST(SUBSTRING(PRODUCTO_CATEGORIA, CHARINDEX('°', PRODUCTO_CATEGORIA) + 1, LEN(PRODUCTO_CATEGORIA)) AS INT)
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_CATEGORIA IS NOT NULL
END
GO

CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias
AS
BEGIN
	INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.Sub_categoria(
		sub_cat_cod
	)
	SELECT DISTINCT
	CAST(SUBSTRING(PRODUCTO_SUB_CATEGORIA, CHARINDEX('°', PRODUCTO_SUB_CATEGORIA) + 1, LEN(PRODUCTO_SUB_CATEGORIA)) AS INT)
	FROM gd_esquema.Maestra 
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

EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_supermercados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sucursales;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_empleados;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_categorias;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_sub_categorias_de_categoria;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_cajas_de_sucursal;
EXEC CHRISTIAN_Y_LOS_MAKINSONS.migrar_tickets;
-- EMPLEADOS/CATEGORIAS/SUBCATEGORIAS/CAJA (CHRIS) -- Hecho 
-- Tarjeta (CHRIS) -- OnGoing
-- ENVIOS/CLIENTES/ (MATI)

-- Sucursal y Supermercado (hecho)

-- EMPLEADOS Exito parcial. Tengo 63 empleados no null pero hay varias filas null

--detalleSubCategoria detallesCategoria

--Hay ahora una tabla intermedia dado que se descubrio que una categoria puede tener varias subcategorias pero que una subcategoria puede corresponder a varias categorias
--como un ejemlo puede pensarse productos lacteos y productos derivado animal y las subcategorias leches y quesos. Tanto la leche como el queso puede ser producto derivado animal o lacteos. 
--Mas aun la leche y el queso podrian corresponder a productos derivado no animal (existe la leche y el queso de vaca, de cabra, de coco y soja, etc.)

