INSERT INTO usuarios (nombre, telefono, direccion) VALUES
('Esther Blanco', '318567551585', 'zona franca 58'),
('Miguel Torres', '32225885564', 'calle # 12'),
('Juan Quiroga', '3158469725', 'Cra 10 #45');


INSERT INTO productos (nombre, tipo, tamano, precio_base) VALUES
('Pizza Margarita', 'Pizza', 'Mediana', 8.50),
('Coca-Cola', 'Bebida', NULL, 2.00),
('Combo Familiar', 'Combo', NULL, 18.00);
INSERT INTO ingredientes (nombre, costo_adicional) VALUES
('Queso Extra', 1.00),
('Pepperoni', 1.50),
('Champiñones', 1.20);
INSERT INTO producto_ingredientes (producto_id, ingrediente_id) VALUES
(1, 1),  -- Pizza Margarita + Queso Extra
(1, 2),  -- Pizza Margarita + Pepperoni
(1, 3);  -- Pizza Margarita + Champiñones
INSERT INTO combos (nombre, descripcion, precio_total) VALUES
('Combo Familiar', '1 Pizza grande + 2 bebidas', 18.00),
('Combo Pareja', '1 Pizza mediana + 1 bebida', 12.00),
('Combo Infantil', '1 Pizza pequeña + jugo', 9.00);
INSERT INTO combo_productos (combo_id, producto_id) VALUES
(1, 1),  -- Combo Familiar incluye Pizza Margarita
(1, 2),  -- Combo Familiar incluye Coca-Cola
(2, 1);  -- Combo Pareja incluye Pizza Margarita
INSERT INTO pedidos (cliente_id, fecha_pedido, hora_recogida, estado, pagado) VALUES
(1, '2025-06-06', '13:30:00', 'Pendiente', FALSE),
(2, '2025-06-06', '14:00:00', 'Procesando', TRUE),
(3, '2025-06-05', '19:00:00', 'Entregado', TRUE);
INSERT INTO detalles_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 8.50),  -- Pizza Margarita
(1, 2, 2, 2.00),  -- 2x Coca-Cola
(2, 3, 1, 18.00); -- Combo Familiar