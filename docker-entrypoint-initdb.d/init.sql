-- Crear tabla alquiler en PostgreSQL
CREATE TABLE alquiler (
  id_alquiler SERIAL PRIMARY KEY,
  id_inmobiliaria INTEGER NOT NULL,
  id_propiedad INTEGER NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  precio INTEGER NOT NULL,
  id_cliente INTEGER NOT NULL,
  id_transaccion INTEGER NOT NULL
);

-- Insertar datos en la tabla alquiler en PostgreSQL
INSERT INTO alquiler (id_inmobiliaria, id_propiedad, fecha_inicio, fecha_fin, precio, id_cliente, id_transaccion)
VALUES
(1, 1, '2024-01-01', '2024-12-31', 1200, 1, 1),
(2, 2, '2024-02-01', '2024-11-30', 1500, 3, 3),
(3, 3, '2024-03-01', '2024-12-31', 1300, 4, 5),
(4, 4, '2024-04-01', '2025-03-31', 1800, 10, 10),
(5, 5, '2024-05-01', '2025-04-30', 1400, 9, 9),
(6, 6, '2024-06-01', '2025-05-31', 1600, 1, 2),
(7, 7, '2024-07-01', '2025-06-30', 1700, 7, 7),
(8, 8, '2024-08-01', '2025-07-31', 1100, 8, 8),
(9, 9, '2024-09-01', '2025-08-31', 1550, 3, 4),
(10, 10, '2024-10-01', '2025-09-30', 1250, 6, 6);

-- Crear tabla cliente en PostgreSQL
CREATE TABLE cliente (
  id_cliente SERIAL PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  garantia INTEGER,
  cuit BIGINT,
  id_tipo_cliente INTEGER
);


-- Insertar datos en la tabla cliente en PostgreSQL
INSERT INTO cliente (id_cliente, nombre, apellido, garantia, cuit, id_tipo_cliente) VALUES
(1, 'franco', 'perex', 1, 2358473, 2),
(2, 'Juan', 'Franco', 1, 2345664, 2),
(3, 'Ana', 'Perez', 1, 3456789, 2),
(4, 'Carlos', 'Gomez', 1, 4567890, 2),
(5, 'Laura', 'Martinez', 1, 5678901, 2),
(6, 'Pedro', 'Sanchez', 0, 6789012, 1),
(7, 'Sofia', 'Lopez', 1, 7890123, 2),
(8, 'Marta', 'Diaz', 0, 8901234, 1),
(9, 'Luis', 'Garcia', 1, 9012345, 2),
(10, 'Elena', 'Rodriguez', 1, 1234567, 2);

-- Crear tabla cp en PostgreSQL
CREATE TABLE cp (
  id_cp SERIAL PRIMARY KEY,
  id_provincia INTEGER NOT NULL,
  id_localidad INTEGER NOT NULL
);

-- Insertar datos en la tabla cp en PostgreSQL
INSERT INTO cp (id_provincia, id_localidad, id_cp) VALUES
(105, 1000, 200),
(108, 1006, 201),
(104, 1002, 202),
(104, 1003, 203),
(105, 1004, 204),
(105, 1005, 205),
(107, 1006, 206),
(107, 1007, 207),
(108, 1008, 208),
(109, 1009, 209);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

-- Crear tabla estados en PostgreSQL
CREATE TABLE estados (
  id_estado INTEGER NOT NULL,
  nombre_tipo VARCHAR(50) NOT NULL
);

-- Insertar datos en la tabla estados en PostgreSQL
INSERT INTO estados (id_estado, nombre_tipo) VALUES
(1, 'Alquilado'),
(2, 'Desocupado'),
(3, 'Suspendido');

-- Crear tabla gastos en PostgreSQL
CREATE TABLE gastos (
  impuesto DECIMAL(8,2) NOT NULL,
  nombre_gasto VARCHAR(100) NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  id_gasto INTEGER NOT NULL,
  id_reparacion INTEGER DEFAULT NULL,
  id_propiedad INTEGER NOT NULL,
  id_proveedor INTEGER NOT NULL
);



--
-- Volcado de datos para la tabla `gastos`
--

-- Insertar datos en la tabla gastos en PostgreSQL
INSERT INTO gastos (impuesto, nombre_gasto, precio, id_gasto, id_reparacion, id_propiedad, id_proveedor) VALUES
(21.00, 'Materiales de Construcción', 1500.00, 11, 1, 1, 1),
(18.00, 'Mano de Obra', 2500.50, 12, 2, 2, 2),
(21.00, 'Pintura', 3000.75, 13, 3, 1, 3),
(19.50, 'Herramientas', 1200.00, 14, 4, 2, 4),
(20.00, 'Electricidad', 4500.00, 15, 5, 1, 5),
(18.75, 'Plomería', 3200.25, 16, 6, 2, 6),
(21.00, 'Carpintería', 2200.00, 17, 7, 1, 7),
(20.50, 'Albañilería', 1700.50, 18, 8, 2, 8),
(19.00, 'Gas', 2900.75, 19, 9, 1, 9),
(21.00, 'Cerrajería', 3100.00, 20, 10, 2, 10);

-- Crear tabla inmobiliaria en PostgreSQL
CREATE TABLE inmobiliaria (
  id_inmobiliaria SERIAL PRIMARY KEY,
  razon_social VARCHAR(255) NOT NULL,
  ubicacion VARCHAR(255) NOT NULL,
  cuit INTEGER NOT NULL
);

-- Insertar datos en la tabla inmobiliaria en PostgreSQL
INSERT INTO inmobiliaria (id_inmobiliaria, razon_social, ubicacion, cuit) VALUES
(1, 'Tatooine Realty', 'Tatooine', 12345678),
(2, 'Alderaan Homes', 'Alderaan', 87654321),
(3, 'Naboo Estates', 'Naboo', 23456789),
(4, 'Coruscant Properties', 'Coruscant', 98765432),
(5, 'Hoth Housing', 'Hoth', 34567890),
(6, 'Dagobah Dwellings', 'Dagobah', 45678901),
(7, 'Endor Residences', 'Endor', 56789012),
(8, 'Kashyyyk Condos', 'Kashyyyk', 67890123),
(9, 'Mustafar Mansions', 'Mustafar', 78901234),
(10, 'Jakku Apartments', 'Jakku', 89012345);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE localidad (
  id_localidad SERIAL PRIMARY KEY,
  id_provincia INTEGER NOT NULL,
  id_cp INTEGER NOT NULL
);

INSERT INTO localidad (id_provincia, id_localidad, id_cp) VALUES
(100, 1000, 200),
(102, 1001, 201),
(103, 1002, 202),
(104, 1003, 203),
(107, 1004, 204),
(107, 1005, 205),
(100, 1006, 206),
(108, 1007, 207),
(108, 1008, 208),
(104, 1009, 209);

CREATE TABLE propiedad (
  id_propiedad int NOT NULL,
  id_estado int DEFAULT NULL,
  precio real NOT NULL,
  id_ubicacion int NOT NULL,
  PRIMARY KEY (id_propiedad)
);

INSERT INTO propiedad (id_propiedad, id_estado, precio, id_ubicacion) VALUES
(1, 1, 150000, 3),
(2, 2, 250000, 2),
(3, 1, 200000, 4),
(4, 3, 300000, 8),
(5, 1, 180000, 9),
(6, 2, 220000, 10),
(7, 3, 275000, 5),
(8, 1, 160000, 7),
(9, 2, 190000, 4),
(10, 3, 210000, 1);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE proveedores (
  cuit bigint NOT NULL,
  razon_social varchar(100) NOT NULL,
  id_proveedor int NOT NULL,
  PRIMARY KEY (id_proveedor)
);

INSERT INTO proveedores (cuit, razon_social, id_proveedor) VALUES
(12345678, 'Mantenimiento SIMA S.A', 1),
(12345678, 'ElectroSolutions SRL', 2),
(87654321, 'GasPlom S.A.', 3),
(87654321, 'GasPlom S.A.', 4),
(98765432, 'Pinturas Rápidas', 5),
(98765432, 'Pinturas Rápidas', 6),
(45678901, 'Mantenimiento Luz SRL', 7),
(45678901, 'Mantenimiento Luz SRL', 8),
(23456789, 'Fontaneros Express', 9),
(23456789, 'Fontaneros Express', 10);

CREATE TABLE provincia (
  id_provincia int NOT NULL,
  id_localidad int NOT NULL,
  id_cp int NOT NULL,
  PRIMARY KEY (id_provincia),
  FOREIGN KEY (id_localidad) REFERENCES localidad (id_localidad),
  FOREIGN KEY (id_cp) REFERENCES cp (id_cp)
);


INSERT INTO provincia (id_provincia, id_localidad, id_cp) VALUES
(100, 1001, 201),
(101, 1000, 202),
(102, 1009, 203),
(103, 1008, 204),
(104, 1002, 205),
(105, 1005, 206),
(106, 1006, 207),
(107, 1007, 208),
(108, 1007, 209),
(109, 1003, 200);



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE reparaciones (
  id_reparacion int NOT NULL,
  fecha_reparacion date DEFAULT NULL,
  PRIMARY KEY (id_reparacion)
);

INSERT INTO reparaciones (id_reparacion, fecha_reparacion) VALUES
(1, '2024-01-15'),
(2, '2024-01-16'),
(3, '2024-01-17'),
(4, '2024-01-18'),
(5, '2024-01-19'),
(6, '2024-01-20'),
(7, '2024-01-21'),
(8, '2024-01-22'),
(9, '2024-01-23'),
(10, '2024-01-24');

CREATE TABLE tipodepago (
  id_tipodepago int NOT NULL,
  nombre_tipo varchar(255) NOT NULL,
  PRIMARY KEY (id_tipodepago)
);

INSERT INTO tipodepago (id_tipodepago, nombre_tipo) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de crédito'),
(3, 'Transferencia bancaria'),
(4, 'Cheque'),
(5, 'Pago móvil'),
(6, 'Bitcoin'),
(7, 'PayPal'),
(8, 'Giro postal'),
(9, 'Criptomoneda'),
(10, 'Dinero electrónico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomoneda`
--

CREATE TABLE tipomoneda (
  id_tipodemoneda SERIAL PRIMARY KEY,
  nombre_tipo VARCHAR(255) NOT NULL
);

INSERT INTO tipomoneda (id_tipodemoneda, nombre_tipo) VALUES
(1, 'Dólar estadounidense'),
(2, 'Euro'),
(3, 'Libra esterlina'),
(4, 'Yen japonés'),
(5, 'Franco suizo'),
(6, 'Dólar australiano'),
(7, 'Dólar canadiense'),
(8, 'Dólar neozelandés'),
(9, 'Peso mexicano'),
(10, 'Peso argentino');

CREATE TABLE tipo_cliente (
  ID_tipo_cliente SERIAL PRIMARY KEY,
  nombre_tipo VARCHAR(255) NOT NULL,
  fecha_nacimiento DATE
);

INSERT INTO tipo_cliente (ID_tipo_cliente, nombre_tipo, fecha_nacimiento) VALUES
(1, 'Titular', NULL),
(2, 'CoTitular', NULL),
(3, 'Persona_Autorizada', NULL);

CREATE TABLE transacciones (
  id_transaccion SERIAL PRIMARY KEY,
  id_tipodepago INT NOT NULL,
  id_tipodemoneda INT NOT NULL,
  fecha DATE NOT NULL
);

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO transacciones (id_transaccion, id_tipodepago, id_tipodemoneda, fecha) VALUES
(1, 3, 5, '2024-06-06'),
(2, 5, 7, '2024-06-07'),
(3, 7, 9, '2024-06-08'),
(4, 9, 1, '2024-06-09'),
(5, 1, 3, '2024-06-10'),
(6, 2, 6, '2024-06-11'),
(7, 4, 8, '2024-06-12'),
(8, 6, 10, '2024-06-13'),
(9, 8, 2, '2024-06-14'),
(10, 10, 4, '2024-06-15');

CREATE TABLE ubicacion (
  id_provincia INT NOT NULL,
  id_localidad INT NOT NULL,
  id_cp INT NOT NULL,
  calle VARCHAR(255) NOT NULL,
  precio FLOAT NOT NULL,
  unidad_funcional INT NOT NULL,
  id_ubicacion SERIAL PRIMARY KEY
);

INSERT INTO ubicacion (id_provincia, id_localidad, id_cp, calle, precio, unidad_funcional, id_ubicacion) VALUES
(100, 1000, 200, 'lavalleja 135', 200020, 12345, 1),
(101, 1001, 201, 'acoyte 1350', 886900, 12346, 2),
(102, 1002, 202, 'frias 2020', 1701460, 12347, 3),
(103, 1003, 203, 'lavalle 2014', 1452370, 12348, 4),
(104, 1004, 204, 'florida 1214', 2569870, 12349, 5),
(105, 1005, 205, 'corrientes 2020', 356987, 12350, 6),
(106, 1006, 206, 'cordoba 1589', 245698, 12351, 7),
(107, 1007, 207, 'libertador 5454', 1452960, 12352, 8),
(108, 1008, 208, 'moron 475', 5008900, 12353, 9),
(109, 1009, 209, 'bogota 5656', 2006590, 12354, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE alquiler
  ADD CONSTRAINT fk_id_inmobiliaria FOREIGN KEY (id_inmobiliaria) REFERENCES inmobiliaria (id_inmobiliaria),
  ADD CONSTRAINT fk_id_propiedad FOREIGN KEY (id_propiedad) REFERENCES propiedad (id_propiedad),
  ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  ADD CONSTRAINT fk_id_transaccion FOREIGN KEY (id_transaccion) REFERENCES transacciones (id_transaccion);


CREATE INDEX idx_id_inmobiliaria ON alquiler (id_inmobiliaria);
CREATE INDEX idx_id_propiedad ON alquiler (id_propiedad);
CREATE INDEX idx_id_cliente ON alquiler (id_cliente);
CREATE INDEX idx_id_transaccion ON alquiler (id_transaccion);


CREATE INDEX idx_fk_tipo_cliente ON cliente (id_tipo_cliente);

ALTER TABLE cp
  ADD CONSTRAINT fk_cp_provincia FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia),
  ADD CONSTRAINT fk_cp_localidad FOREIGN KEY (id_localidad) REFERENCES localidad (id_localidad);

CREATE INDEX idx_fk_cp_provincia ON cp (id_provincia);
CREATE INDEX idx_fk_cp_localidad ON cp (id_localidad);

ALTER TABLE estados
  ADD PRIMARY KEY (id_estado);

CREATE INDEX idx_fk_id_reparacion ON gastos (id_reparacion);
CREATE INDEX idx_fk_id_proveedor ON gastos (id_proveedor);
CREATE INDEX idx_id_propiedad_gastos ON gastos (id_propiedad);

ALTER TABLE localidad
  ADD CONSTRAINT fk_localidad_provincia FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia),
  ADD CONSTRAINT fk_localidad_cp FOREIGN KEY (id_cp) REFERENCES cp (id_cp);

CREATE INDEX idx_fk_localidad_provincia ON localidad (id_provincia);
CREATE INDEX idx_fk_localidad_cp ON localidad (id_cp);

ALTER TABLE propiedad
  ADD CONSTRAINT fk_id_ubicacion FOREIGN KEY (id_ubicacion) REFERENCES ubicacion (id_ubicacion),
  ADD CONSTRAINT fk_id_estado FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

CREATE INDEX idx_id_ubicacion ON propiedad (id_ubicacion);
CREATE INDEX idx_id_estado ON propiedad (id_estado);

ALTER TABLE ubicacion
  ADD CONSTRAINT fk_ubicacion_provincia FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia),
  ADD CONSTRAINT fk_ubicacion_localidad FOREIGN KEY (id_localidad) REFERENCES localidad (id_localidad),
  ADD CONSTRAINT fk_ubicacion_cp FOREIGN KEY (id_cp) REFERENCES cp (id_cp);


--
ALTER TABLE alquiler
  ADD CONSTRAINT alquiler_fk_id_inmobiliaria FOREIGN KEY (id_inmobiliaria) REFERENCES inmobiliaria (id_inmobiliaria),
  ADD CONSTRAINT alquiler_fk_id_propiedad FOREIGN KEY (id_propiedad) REFERENCES propiedad (id_propiedad),
  ADD CONSTRAINT alquiler_fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  ADD CONSTRAINT alquiler_fk_id_transaccion FOREIGN KEY (id_transaccion) REFERENCES transacciones (id_transaccion);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE cliente
  ADD CONSTRAINT fk_tipo_cliente FOREIGN KEY (id_tipo_cliente) REFERENCES tipo_cliente (ID_tipo_cliente);

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE gastos
  ADD CONSTRAINT fk_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor),
  ADD CONSTRAINT fk_id_reparacion FOREIGN KEY (id_reparacion) REFERENCES reparaciones (id_reparacion),
  ADD CONSTRAINT gastos_ibfk_1 FOREIGN KEY (id_propiedad) REFERENCES propiedad (id_propiedad);

--
-- Filtros para la tabla `propiedad`
--
ALTER TABLE propiedad
  ADD CONSTRAINT propiedad_ibfk_1 FOREIGN KEY (id_ubicacion) REFERENCES ubicacion (id_ubicacion),
  ADD CONSTRAINT propiedad_ibfk_2 FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE transacciones
  ADD CONSTRAINT fk_tipodemoneda FOREIGN KEY (id_tipodemoneda) REFERENCES tipomoneda (id_tipodemoneda),
  ADD CONSTRAINT fk_tipodepago FOREIGN KEY (id_tipodepago) REFERENCES tipodepago (id_tipodepago);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE ubicacion
  ADD CONSTRAINT ubicacion_ibfk_1 FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia),
  ADD CONSTRAINT ubicacion_ibfk_2 FOREIGN KEY (id_cp) REFERENCES cp (id_cp),
  ADD CONSTRAINT ubicacion_ibfk_3 FOREIGN KEY (id_localidad) REFERENCES localidad (id_localidad);
