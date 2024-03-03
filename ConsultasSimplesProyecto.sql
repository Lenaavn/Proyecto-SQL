USE nike;

-- Consultas Simples

-- Tabla: tienda
-- 1.Encontrar el nombre y la dirección de todas las tiendas.

SELECT Id_tienda, Nombre, Direccion FROM tienda;

-- 2.Mostrar las tiendas que abren después de las 10:00 am.

SELECT * FROM tienda WHERE Horario_Apertura > '10:00';

-- 3.Obtener el teléfono de la tienda con el ID 2.

SELECT Id_tienda, telefono FROM tienda WHERE Id_tienda = 2;


-- Tabla: producto
-- 1.Listar todos los productos de la categoría "Calzado".

SELECT * FROM producto WHERE Categoria = 'Calzado';

-- 2.Mostrar el precio y las existencias de todos los productos.

SELECT Id_producto, Precio, Existencias FROM producto;

-- 3.Encontrar los productos que tengan más o igual de 50 existencias y que la categoría sea ropa.

SELECT * FROM producto WHERE Existencias >= 50 AND Categoria = 'Ropa';


-- Tabla: proveedor
-- 1.Obtener el nombre y la dirección de todos los proveedores.

SELECT Id_proveedor, Nombre, Direccion FROM proveedor;

-- 2.Mostrar el precio de compra del proveedor con ID 3.

SELECT Id_proveedor, Precio_Compra FROM proveedor WHERE Id_proveedor = 3;

-- 3.Listar todos los proveedores cuyo nombre comience con L y termine en o.

SELECT * FROM proveedor WHERE Nombre LIKE 'L%o';


-- Tabla: suministración
-- 1.Mostrar las últimas entregas realizadas por cada proveedor.

SELECT id_proveedor, Fecha_ultimaEntrega FROM suministracion;

-- 2.Encontrar los productos suministrados en una fecha específica.

SELECT id_producto FROM suministracion WHERE Fecha_ultimaEntrega = '2024-02-29';

-- 3.Obtener la fecha de última entrega del producto con ID 2.

SELECT Fecha_ultimaEntrega FROM suministracion WHERE id_producto = 2;


-- Tabla: cliente
-- 1.Encontrar el nombre y el correo electrónico de todos los clientes.

SELECT id_Cliente, Nombre, Email FROM cliente;

-- 2.Mostrar la dirección de los clientes cuyo apellido sea "Martinez".

SELECT id_Cliente, Direccion FROM cliente WHERE Apellido = 'Martinez';

-- 3.Obtener el teléfono del cliente con ID 2.

SELECT Telefono FROM cliente WHERE id_Cliente = 2;


-- Tabla: pedido
-- 1.Listar todos los pedidos con estado "Enviado".

SELECT * FROM pedido WHERE Estado = 'Enviado';

-- 2.Mostrar la cantidad y el precio total de los pedidos realizados por el cliente con ID 3.

SELECT Cantidad, Precio_total FROM pedido WHERE id_pedido = 3;

-- 3.Obtener la fecha de pedido del pedido con ID 1.

SELECT Fecha_Pedido FROM pedido WHERE id_pedido = 1;


-- Tabla: sorteo
-- 1.Encontrar el nombre y los ganadores de todos los sorteos.

SELECT Nombre, Ganadores FROM sorteo;

-- 2.Mostrar los sorteos en los que ha participado el cliente con ID 2.

SELECT * FROM sorteo WHERE id_cliente = 2;

-- 3.Obtener el ID del cliente que ganó el sorteo con ID 1.

SELECT Id_cliente FROM sorteo WHERE Id_sorteo = 1;


-- Tabla: sorteando
-- 1.Listar todos los sorteos realizados en una fecha específica.

SELECT * FROM sorteando WHERE Fecha_Sorteo IN ('2024-03-29', '2024-03-15');

-- 2.Mostrar los productos involucrados en el sorteo con ID 3.

SELECT id_producto FROM sorteando WHERE id_sorteo = 3;

-- 3.Obtener los sorteos que se realizaron despuén del 15 de marzo de 2024.

SELECT * FROM sorteando WHERE Fecha_Sorteo > '2024-03-15';




