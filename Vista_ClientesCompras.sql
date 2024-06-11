CREATE VIEW VISTA_ClientesCompras AS
SELECT c.id_clientes, c.nombre AS cliente, c.correo_electronico, cm.id_compra, cm.fecha_compra, cm.total
FROM Clientes c
LEFT JOIN Compras cm 
ON c.id_clientes = cm. id_cliente

Select * from VISTA_ClientesCompras

Select * from VISTA_ComicsInventario