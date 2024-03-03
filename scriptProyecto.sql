-- CABECERA DEL SCRIPT
DROP DATABASE IF EXISTS nike;
CREATE DATABASE nike;
USE nike;

-- SCRIPT
CREATE TABLE tienda (
	id_tienda INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Direccion VARCHAR(100),
	Horario_Apertura TIME,
	Horario_Cierre TIME,
	Telefono CHAR(9)
);

DESCRIBE tienda;

CREATE TABLE producto (
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Precio DECIMAL(6,2),
	Existencias INT,
	Categoria VARCHAR(50),
	Tallas VARCHAR(100), 
	id_tienda INT,
	CONSTRAINT fk_producto FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

DESCRIBE producto;

CREATE TABLE proveedor (
	id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Direccion VARCHAR(100),
	Contacto VARCHAR(50),
	Precio_Compra DECIMAL(6,2)
);

DESCRIBE proveedor;

CREATE TABLE suministracion (
	id_proveedor INT,
	id_producto INT,
	Fecha_ultimaEntrega DATE,
	CONSTRAINT pk_suministracion PRIMARY KEY (id_proveedor, id_producto, Fecha_ultimaEntrega),
	CONSTRAINT fk_suministracion1 FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
	CONSTRAINT fk_suministracion2 FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

DESCRIBE suministracion;

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Direccion VARCHAR(100),
	Email VARCHAR(50),
	Telefono CHAR(9)
);

DESCRIBE cliente;

CREATE TABLE pedido (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	Precio_total DECIMAL(6,2),
	Estado VARCHAR(10), 
	Cantidad INT,
	Fecha_Pedido DATE,
	id_cliente INT,
	id_producto INT,
	CONSTRAINT chk_pedido CHECK (Estado = 'Enviado' OR Estado = 'No Enviado'), 
	CONSTRAINT fk_pedido1 FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_pedido2 FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Estado Enviado y Estado No Enviado es si el producto se ha enviado o no desde el almacén

DESCRIBE pedido;

CREATE TABLE sorteo (
	id_sorteo INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Ganadores VARCHAR(255), 
	id_cliente INT,
	CONSTRAINT fk_sorteo FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

DESCRIBE sorteo;

CREATE TABLE sorteando (
	id_sorteo INT,
	id_producto INT,
	Fecha_Sorteo DATE,
	CONSTRAINT pk_sorteando PRIMARY KEY (id_sorteo, id_producto, Fecha_Sorteo),
	CONSTRAINT fk_sorteando1 FOREIGN KEY (id_sorteo) REFERENCES sorteo(id_sorteo),
	CONSTRAINT fk_sorteando2 FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

DESCRIBE sorteando;

-- INSERCIÓN DE DATOS

-- Tabla Tienda
INSERT INTO tienda (Nombre, Direccion, Horario_Apertura, Horario_Cierre, Telefono) 
	VALUES ('Nike Espana', '123 Calle Principal', '09:00:00', '21:00:00', '123456789'),
	       ('Nike Espana', '567 Calle Principal', '12:00:00', '21:00:00', '987654321'),
	       ('Nike Espana', '941 Calle Principal', '13:00:00', '21:00:00', '132465798');

SELECT * FROM tienda;

-- Tabla Producto
INSERT INTO producto (Nombre, Precio, Existencias, Categoria, Tallas, id_tienda) 
	VALUES ('Zapatillas Nike Air', 100, 50, 'Calzado', 'Rojo, Azul, Negro', 1),
       	   ('Camiseta Nike Pro', 30, 100, 'Ropa', 'Blanco, Negro', 3),
           ('Pantalones Nike Flex', 60, 30, 'Ropa', 'Gris, Negro', 2);

-- Talla Camiseta 38 = M || Talla Pantalones 35 = L

SELECT * FROM producto;

-- Tabla Cliente
INSERT INTO cliente (Nombre, Apellido, Email, Direccion, Telefono) 
	VALUES ('Juan', 'Perez', 'juan.perez@gmail.com', 'Calle Falsa 123', '987654321'),
       	   ('Ana', 'Gomez', 'ana.gomez@hotmail.com', 'Avenida Siempre Viva 456', '987654322'),
       	   ('Pedro', 'Martinez', 'pedro.martinez@outlook.es', 'Plaza Mayor 789', '987654323');

SELECT * FROM cliente ;

-- Tabla Pedido
INSERT INTO pedido (Fecha_Pedido, Cantidad, Precio_total, Estado, id_cliente, id_producto) 
	VALUES ('2024-02-29', 2, 200, 'Enviado', 2, 3),
       	   ('2024-02-28', 1, 100, 'No Enviado', 1, 2),
           ('2024-02-27', 3, 300, 'Enviado', 3, 1);

SELECT * FROM pedido;       

-- Tabla Proveedor
INSERT INTO proveedor (Nombre, Contacto, Direccion, Precio_Compra) 
	VALUES ('Leonardo', 'Contacto 1', 'Direccion 1', 50),
       	   ('Love', 'Contacto 2', 'Direccion 2', 60),
       	   ('Proveedor', 'Contacto 3', 'Direccion 3', 70);

SELECT * FROM proveedor;       

-- Tabla Sorteo
INSERT INTO sorteo (Nombre, Ganadores, id_cliente) 
	VALUES ('Sorteo 1', 'Pedro Martinez', 3),
       	   ('Sorteo 2', 'Juan Perez', 1),
       	   ('Sorteo 3', 'Ana Gomez', 2);

SELECT * FROM sorteo;

-- Tabla  Suministracion
INSERT INTO suministracion (id_proveedor, id_producto, Fecha_ultimaEntrega) 
	VALUES (2, 3, '2024-02-29'),
       	   (3, 2, '2024-02-26'),
       	   (1, 1, '2024-02-12');

SELECT * FROM suministracion;

-- Tabla Sorteando
INSERT INTO sorteando (id_sorteo, id_producto, Fecha_Sorteo) 
	VALUES (1, 1, '2024-03-29'),
       	   (3, 2, '2024-03-15'),
       	   (2, 3, '2024-03-18');

SELECT * FROM sorteando;

