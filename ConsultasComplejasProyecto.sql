USE nike;

-- Consultas Complejas

-- 1.Encontrar el cliente que realizó el pedido más reciente.

SELECT cli.id_cliente, pd.Fecha_Pedido FROM cliente cli JOIN pedido pd ON cli.id_cliente = pd.id_cliente WHERE pd.Fecha_Pedido = '2024-02-27';

-- 2.Mostrar el precio total de todos los pedidos realizados por cada cliente.

SELECT id_cliente, SUM(Precio_total) as TotalPedidos FROM Pedido GROUP BY id_cliente;

-- 3.Encontrar los productos que nunca han sido suministrados.

SELECT pd.id_producto, pd.Nombre FROM producto pd
LEFT JOIN suministracion ON pd.id_producto = suministracion.id_producto
WHERE suministracion.id_producto IS NULL;


-- 4.Obtener el proveedor que suministró más productos.

SELECT p.id_proveedor, COUNT(*) AS total_productos_suministrados FROM producto pd
JOIN proveedor p ON p.id_proveedor = p.id_proveedor
GROUP BY p.id_proveedor ORDER BY total_productos_suministrados DESC
LIMIT 1;

-- 5.Encontrar el cliente que ha participado en más sorteos.

SELECT cli.id_cliente, COUNT(*) AS total_sorteos_participados FROM cliente cli 
JOIN sorteo sor ON cli.id_cliente = sor.id_sorteo
GROUP BY cli.id_cliente ORDER BY total_sorteos_participados DESC
LIMIT 1;

-- 6.Mostrar los productos que no se han enviado.

SELECT pd.id_producto, pd.nombre, p.Estado FROM producto pd
LEFT JOIN pedido p ON pd.id_producto = p.id_producto
WHERE p.Estado IS NULL OR p.Estado = 'no enviado';

-- 7.Encontrar el día con más pedidos realizados.

SELECT Fecha_Pedido, COUNT(*) AS TotalPedidos FROM pedido
GROUP BY Fecha_Pedido ORDER BY TotalPedidos DESC
LIMIT 1;

-- 8.Obtener el proveedor con la última entrega.

SELECT id_proveedor, MAX(Fecha_ultimaEntrega) AS UltimaEntrega
FROM suministracion GROUP BY id_proveedor
ORDER BY UltimaEntrega DESC
LIMIT 1;

-- 9.Encontrar los clientes que le han enviado su pedido.

SELECT cli.id_cliente, p.Estado FROM cliente cli
LEFT JOIN pedido p ON cli.id_cliente = p.id_cliente
WHERE p.Estado IS NULL OR p.Estado = 'enviado';


-- 10.Mostrar el pedido que este enviado pero el id_producto sea 3.

SELECT pd.id_pedido, p.Nombre
FROM pedido pd JOIN producto p ON pd.id_producto = p.id_producto
WHERE pd.Estado = 'Enviado' AND pd.id_producto = 3;







