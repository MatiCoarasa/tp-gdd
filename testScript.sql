USE GD1C2024;
GO

SELECT DISTINCT TICKET_NUMERO FROM gd_esquema.Maestra 

SELECT DISTINCT EMPLEADO_DNI FROM gd_esquema.Maestra ORDER BY EMPLEADO_DNI

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Empleado

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Sucursal

SELECT EMPLEADO_DNI, TICKET_NUMERO, CAJA_NUMERO FROM gd_esquema.Maestra 
	WHERE TICKET_NUMERO IN 
		(SELECT DISTINCT TICKET_NUMERO FROM gd_esquema.Maestra) AND
			EMPLEADO_DNI IS NOT NULL
				GROUP BY TICKET_NUMERO, EMPLEADO_DNI, CAJA_NUMERO

SELECT DISTINCT 
	EMPLEADO_DNI, 
	EMPLEADO_APELLIDO, 
	EMPLEADO_FECHA_NACIMIENTO, 
	EMPLEADO_FECHA_REGISTRO, 
	EMPLEADO_MAIL, 
	EMPLEADO_NOMBRE, 
	EMPLEADO_TELEFONO, 
	SUCURSAL_NOMBRE
	FROM gd_esquema.Maestra 
	WHERE TICKET_NUMERO IN 
		(SELECT DISTINCT TICKET_NUMERO FROM gd_esquema.Maestra) AND
			EMPLEADO_DNI IS NOT NULL

SELECT DISTINCT 
	PRODUCTO_CATEGORIA 
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_CATEGORIA IS NOT NULL

SELECT DISTINCT 
	PRODUCTO_SUB_CATEGORIA 
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_SUB_CATEGORIA IS NOT NULL 

SELECT DISTINCT PRODUCTO_CATEGORIA, PRODUCTO_SUB_CATEGORIA FROM gd_esquema.Maestra

SELECT DISTINCT PRODUCTO_SUB_CATEGORIA FROM gd_esquema.Maestra WHERE PRODUCTO_CATEGORIA = 'Categoria N�1241414'

SELECT 
	PAGO_TARJETA_NRO,
	PAGO_TARJETA_FECHA_VENC
	FROM gd_esquema.Maestra WHERE PAGO_TARJETA_NRO IN 
		(SELECT DISTINCT PAGO_TARJETA_NRO FROM gd_esquema.Maestra) ORDER BY PAGO_TARJETA_NRO


SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Caja

SELECT DISTINCT 
	CAJA_NUMERO, 
	CAJA_TIPO, 
	SUCURSAL_NOMBRE 
	FROM gd_esquema.Maestra
	WHERE SUCURSAL_NOMBRE IN (SELECT DISTINCT SUCURSAL_NOMBRE FROM gd_esquema.Maestra) AND 
	CAJA_NUMERO IS NOT NULL

SELECT DISTINCT SUCURSAL_NOMBRE, CAJA_TIPO FROM gd_esquema.Maestra WHERE CAJA_NUMERO = 11

SELECT DISTINCT
	CAJA_NUMERO,
	CAJA_TIPO,
	SUCURSAL_NOMBRE --CAST(SUBSTRING(SUCURSAL_NOMBRE, CHARINDEX(':', SUCURSAL_NOMBRE) + 1, LEN(SUCURSAL_NOMBRE)) AS INT),
	FROM gd_esquema.Maestra 
	WHERE CAJA_NUMERO=10 AND SUCURSAL_NOMBRE = 'Sucursal N�:20000'



SELECT * FROM gd_esquema.Maestra

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Empleado

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.sub_categoria

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.sub_categorias_de_categoria

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
	S.SUCURSAL_NOMBRE
	FROM gd_esquema.Maestra AS S JOIN 
	CHRISTIAN_Y_LOS_MAKINSONS.Caja AS C ON 
	C.caja_numero = S.CAJA_NUMERO AND C.caja_tipo = S.CAJA_TIPO 
	WHERE S.TICKET_NUMERO = 1351388438
	
SELECT DISTINCT 
	C.caja_id, 
	CAST(SUBSTRING(S.SUCURSAL_NOMBRE, CHARINDEX(':', S.SUCURSAL_NOMBRE) + 1, LEN(S.SUCURSAL_NOMBRE)) AS INT)
	FROM 
	gd_esquema.Maestra AS S JOIN 
	CHRISTIAN_Y_LOS_MAKINSONS.Caja AS C ON 
	C.caja_numero = S.CAJA_NUMERO AND C.caja_tipo = S.CAJA_TIPO ORDER BY 
	C.caja_id;

SELECT * FROM gd_esquema.Maestra

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Ticket

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.CajaS_DE_SUCURSAL WHERE CAJAS_DE_SUCURSAL_SUC_NUM = 70000

SELECT DISTINCT 
CAJA_NUMERO, 
CAJA_TIPO,
SUCURSAL_NOMBRE
FROM gd_esquema.Maestra WHERE
CAJA_NUMERO IS NOT NULL

SELECT DISTINCT 
	C.caja_id, 
	CAST(SUBSTRING(S.SUCURSAL_NOMBRE, CHARINDEX(':', S.SUCURSAL_NOMBRE) + 1, LEN(S.SUCURSAL_NOMBRE)) AS INT)
	FROM 
	gd_esquema.Maestra AS S JOIN 
	CHRISTIAN_Y_LOS_MAKINSONS.Caja AS C ON 
	C.caja_numero = S.CAJA_NUMERO AND C.caja_tipo = S.CAJA_TIPO ORDER BY 
	C.caja_id;

SELECT DISTINCT PAGO_TARJETA_NRO, CLIENTE_DNI, med FROM gd_esquema.Maestra where PAGO_TARJETA_NRO is not null

SELECT * FROM CHRISTIAN_Y_LOS_MAKINSONS.Tarjeta