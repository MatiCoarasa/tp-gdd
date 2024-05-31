USE GD1C2024;
GO

--Hay que separar el modelo BI por:
--VENTAS
--PAGOS
--PROMOCIONES
--ENVIOS

----------------------------------------BORRAR TABLAS----------------------------------------
IF OBJECT_ID('CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA', 'U') IS NOT NULL DROP TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA;
GO

----------------------------------------BORRAR PROCEDURES----------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'BI_MIGRAR_TABLA' AND schema_id = SCHEMA_ID('CHRISTIAN_Y_LOS_MAKINSONS')) DROP PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.BI_MIGRAR_TABLA;
GO

----------------------------------------CREAR TABLAS----------------------------------------

CREATE TABLE CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA (
    super_id DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1)
);
GO

----------------------------------------CREATE PROCEDURES----------------------------------------
CREATE PROCEDURE CHRISTIAN_Y_LOS_MAKINSONS.BI_MIGRAR_TABLA AS
BEGIN
    INSERT INTO CHRISTIAN_Y_LOS_MAKINSONS.BI_TABLA (
		super_id
    )
    SELECT DISTINCT
		S.super_id
    FROM CHRISTIAN_Y_LOS_MAKINSONS.Supermercado AS S
END
GO

----------------------------------------EXEC PROCEDURES----------------------------------------
EXEC CHRISTIAN_Y_LOS_MAKINSONS.BI_MIGRAR_TABLA;

----------------------------------------VIEWS SIMPLES----------------------------------------
--CREATE VIEW AS
--SELECT * from BI_TABLA;