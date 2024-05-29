# tp-gdd

# Comandos de CMD para migrar todo desde CERO (previo: Crear DATABASE "GD1C2024")

```
sqlcmd -S localhost\SQLEXPRESS -i gd_esquema.Schema.sql -a 32767
sqlcmd -S localhost\SQLEXPRESS -i gd_esquema.Maestra.sql -a 32767
sqlcmd -S localhost\SQLEXPRESS -i gd_esquema.Maestra.Table.sql -a 32767
```
