-- Active: 1749209559741@@127.0.0.1@3307@Examen

--1.tabla de clientes --

CREATE table clientes(
    cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(11) NOT NULL,
    direccion VARCHAR (15) NULL
);
--2. tabla de productos --
CREATE TABLE productos (
producto_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
tipo ENUM('Pizza', 'Bebida', 'Combo') NOT NULL,
tamano ENUM('Pequeña', 'Mediana', 'Grande') DEFAULT NULL,
precio_base DECIMAL(10,2) NOT NULL
);

--3. tabla de ingredientes --

CREATE TABLE ingredientes (
ingrediente_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
costo_adicional DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

--4. tabla de producto a ingredientes --

CREATE TABLE producto_ingredientes (
producto_id INT NOT NULL,
ingrediente_id INT NOT NULL,
PRIMARY KEY (producto_id, ingrediente_id),
FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(ingrediente_id)
ON DELETE CASCADE ON UPDATE CASCADE
);

--5. tabla de combos --

CREATE TABLE combos (
combo_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
descripcion TEXT,
precio_total DECIMAL(10,2) NOT NULL
);

--6 tabla de combo a producto --

CREATE TABLE combo_productos (
combo_id INT NOT NULL,
producto_id INT NOT NULL,
PRIMARY KEY (combo_id, producto_id),
FOREIGN KEY (combo_id) REFERENCES combos(combo_id)
ON DELETE CASCADE,
FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
ON DELETE CASCADE
);
-- 7 tabla de pedidos --
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pedido DATE NOT NULL DEFAULT (CURRENT_DATE),
    hora_recogida TIME NOT NULL,
    estado ENUM('Pendiente','Procesando','Enviado','Entregado','Cancelado') NOT NULL DEFAULT 'Pendiente',
    pagado BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (cliente_id) REFERENCES usuarios(usuario_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_pedidos_fecha (fecha_pedido)
);

--8. tabla de  detalles del pedido --
CREATE TABLE detalles_pedidos (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_detalles_pedido (pedido_id),
    INDEX idx_detalles_producto (producto_id)
);

--9.tabla de ingredientes extra --
CREATE TABLE detalles_ingredientes_extra (
    detalle_id INT NOT NULL,
    ingrediente_id INT NOT NULL,
    costo_adicional DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (detalle_id, ingrediente_id),
    FOREIGN KEY (detalle_id) REFERENCES detalles_pedidos(detalle_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(ingrediente_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);