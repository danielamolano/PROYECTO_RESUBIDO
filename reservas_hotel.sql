CREATE DATABASE proyecto_reservas_hotel;
CREATE TABLE IF NOT EXISTS habitación (
        idHabitacion INT PRIMARY KEY ,
        tipoHabitacion VARCHAR(50) NOT NULL,
        disponibilidad BOOLEAN NOT NULL,
        precioNoche INT UNSIGNED,
        numero INT (11) UNSIGNED
    ) ENGINE = InnoDB;
    CREATE TABLE  IF NOT EXISTS recepcionista (
        idRecepcionista INT PRIMARY KEY ,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) NOT NULL
    ) ENGINE = InnoDB;
    CREATE TABLE IF NOT EXISTS huesped (
        idHuesped INT PRIMARY KEY ,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) NOT NULL
    ) ENGINE = InnoDB;
    CREATE TABLE IF NOT EXISTS servicio (
        idServicio INT PRIMARY KEY,
        nombre VARCHAR(50),
        descripcion VARCHAR(100),
        precio INT
    ) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS metodopago (
        id_MetodoPago INT PRIMARY KEY ,
        nombre VARCHAR(50)
    ) ENGINE = InnoDB;
CREATE TABLE reserva_servicio (
  idReserva INT,
  idServicio INT,
  cantidad INT,
  precio_total INT,
  PRIMARY KEY (idReserva, idServicio),
  FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva),
  FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
);
CREATE TABLE IF NOT EXISTS hospeda (
        idHospeda INT PRIMARY KEY,
        idReserva INT,
        idHuesped INT,
        idHabitacion INT,
        fechaLlegada DATE,
        fechaSalida DATE,
        FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva),
        FOREIGN KEY (idHuesped) REFERENCES Huesped(idHuesped),
        FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),
    ) ENGINE = InnoDB;
    CREATE TABLE IF NOT EXISTS transaccion (
        idTransaccion INT PRIMARY KEY,
        fechaTransac DATE,
        total INT UNSIGNED,
        idMetodoPago INT,
        idReserva INT,
        FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago(idMetodoPago),
        FOREIGN KEY (idReserva) REFERENCES Reserva (idReserva)
    ) ENGINE = InnoDB;
CREATE TABLE  IF NOT EXISTS reserva (
        idReserva INT PRIMARY KEY AUTO_INCREMENT,
        fechaReserva DATE NOT NULL,
        fechaLlegada DATE,
        fechaSalida DATE,
        idHabitacion INT,
        idHuesped INT,
        idRecepcionista INT,
        FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),
        FOREIGN KEY (idHuesped) REFERENCES Huesped(idHuesped),
        FOREIGN KEY (idRecepcionista) REFERENCES Recepcionista(idRecepcionista)
    ) ENGINE = InnoDB;

-- registros 

INSERT INTO Reserva  (idReserva PK, fechaReserva, fechaLlegada, fechaSalida, idHabitación FK, idHuesped FK, idRecepcionista FK)VALUES 

('1','2023-05-01','2023_05_10','2023-05-15','1','1','1'),
('2' '2023-05-03', '2023-05-08 ', '2023-05-12', '2', '2', '2'),
('3', '2023-05-04', '2023-05-10', '2023-05-14', '3','3', '3'),
('4', '2023-05-05', '2023-05-11', '2023-05-13', '4', '4', '4'),
('5', '2023-05-07', '2023-05-12', '2023-05-16', '5', '5', '5'),
('6', '2023-05-09', '2023-05-13', '2023-05-15', '6',  '6',  '6'),
('7', '2023-05-11', '2023-05-17', '2023-05-20',  '7', '7', '7'),
('8', '2023-05-12', '2023-05-19', '2023-05-23', '8', '8', '8'),
('9', '2023-05-13', '2023-05-20', '2023-05-24', '9', '9', '9'),
('10', '2023-05-15', '2023-05-22', '2023-05-25','10', '10', '10'),
('11', '2023-05-18', '2023-05-23', '2023-05-27', '11',  '11', '11'),
('12', '2023-05-20', '2023-05-26', '2023-05-29',  '12',  '12', '12'),
('13', '2023-05-22', '2023-05-27', '2023-05-30',  '13', '13', '13'),
('14', '2023-05-24', '2023-05-28', '2023-05-31', '14', '14', '14'),
('15', '2023-05-25', '2023-05-30', '2023-06-03',  '15',  '15',  '15');
-- Tabla Transaccion


INSERT INTO `transaccion`(`idTransaccion`, `fechaTransac`, `total`, `idMetodoPago`, `idReserva`) VALUES 
       ( 1, '2023-05-15', 500000, 1,1),
       (2, '2023-05-12', 750000, 2,2),
       (3, '2023-05-14', 825000, 1,3),
       (4, '2023-05-13', 550000, 1,4),
       (5, '2023-05-16', 625000, 1,5),
       (6, '2023-05-19', 900000, 1,6),
       (7, '2023-05-20', 675000, 2,7),
      (8, '2023-05-23', 800000, 1,8),
       (9, '2023-05-24', 600000, 1,9),
       (10, '2023-05-25', 175000, 1,10),
       (11, '2022-05-27', 120000, 1,11),
       (12, '2022-05-29', 100000, 2,12),
       (13, '2022-05-30', 95000, 1,13),
       (14, '2022-05-31', 130000, 1,14),
       (15, '2022-06-03', 180000, 1,15 );

-- Insertar registros en la tabla de Método de Pago
INSERT INTO MetodoPago (idMetodoPago, nombre)VALUES

 ('1', 'Transferencia bancaria'),
('2', 'Efectivo');

      
INSERT INTO `servicio`(`idServicio`, `nombre`, `descripcion`, `precio`) VALUES
  ( '1', 'Desayuno', 'Desayuno continental con café, zumo y croissants', 10),
  ('2', 'Wi-Fi', 'Conexión a Internet de alta velocidad', 50),
  ('3', 'Lavandería', 'Servicio de lavandería y planchado', 15),
  ('4', 'Servicio de habitaciones', 'Servicio de habitaciones las 24 horas', 20),
  ('5', 'Spa', 'Acceso al spa con sauna, baño turco y jacuzzi', 30),
  ('6', 'Gimnasio', 'Acceso al gimnasio con equipos de última generación', 25),
  ('7', 'Piscina', 'Acceso a la piscina climatizada y zona de tumbonas', 15),
  ('8', 'Almuerzo', 'Menú del día con plato principal, postre y bebida', 12),
  ('9', 'Cena', 'Menú a la carta con platos internacionales y locales', 25),
  ('10', 'Transporte', 'Servicio de transporte en vehículo privado', 50),
  ('11',  'incluido todas las comidas (cena ,almuerzo, desayuno)', 'Servicio incluir todas las comida por día', 100),
  ('12', 'Tour guiado', 'Tour guiado por los principales lugares de interés de la ciudad', 35),
  ('13', 'Guardería', 'Servicio de guardería para niños de 3 a 12 años', 20),
  ('14', 'Mascotas', 'Permitimos mascotas en la habitación con un cargo adicional', 15),
  ('15', 'Estacionamiento', 'Estacionamiento privado para huéspedes con descuento', 10);
INSERT INTO Reserva_Servicio (idServicio, idReserva, cantidad, precio_total)VALUES 

INSERT INTO `reserva_servicio`(`idReservaServicio `,  `idReserva`, `idServicio`, `cantidad`, `precio_total`) VALUES
(1,1, 1, 1, 23000),
(2,2, 1, 1, 30000),
(3,3, 1, 3, 90000),
(4,1, 2, 2, 50000),
(5,2, 2, 1, 30000),
(6,4, 2, 1, 20000),
(7,5, 2, 2, 80000),
(8,1, 3, 3, 75000),
(9,2, 3, 2, 60000),
(10,4, 3, 2, 40000),
(11,5, 3, 1, 40000),
(12,1, 4, 2, 50000),
(13,2, 4, 2, 60000),
(14,3, 4, 1, 30000),
(15,5, 4, 3, 120000);


INSERT INTO Huesped (idHuesped, nombre, apellido, correo)
VALUES 
  (1, 'Juan', 'Pérez', 'juanperez@gmail.com'),
  (2, 'María', 'González', 'mariagonzalez@hotmail.com'),
  (3, 'Pedro', 'Martínez', 'pedromartinez@yahoo.com'),
  (4, 'Laura', 'Sánchez', 'laurasanchez@gmail.com'),
  (5, 'Carlos', 'Rodríguez', 'carlosrodriguez@hotmail.com'),
  (6, 'Ana', 'Fernández', 'anafernandez@yahoo.com'),
  (7, 'José', 'García', 'josegarcia@gmail.com'),
  (8, 'Carmen', 'López', 'carmenlopez@hotmail.com'),
  (9, 'Javier', 'Ruiz', 'javierruiz@yahoo.com'),
  (10, 'Elena', 'Pérez', 'elenaperez@gmail.com'),
  (11, 'Miguel', 'González', 'miguelgonzalez@hotmail.com'),
  (12, 'Lucía', 'Martínez', 'luciamartinez@yahoo.com'),
  (13, 'Antonio', 'Sánchez', 'antoniosanchez@gmail.com'),
  (14, 'Sofía', 'Rodríguez', 'sofiarodriguez@hotmail.com'),
  (15, 'Pablo', 'Fernández', 'pablofernandez@yahoo.com');
  INSERT INTO Recepcionista (idRecepcionista, nombre, apellido, correo) VALUES 
  (1, 'Laura', 'Martínez', 'lauramartinez@gmail.com'),
  (2, 'Carlos', 'García', 'carlosgarcia@hotmail.com'),
  (3, 'Ana', 'Fernández', 'anafernandez@yahoo.com'),
  (4, 'José', 'López', 'joselopez@gmail.com'),
  (5, 'Carmen', 'Ruiz', 'carmenruiz@hotmail.com'),
  (6, 'Javier', 'Pérez', 'javierperez@yahoo.com'),
  (7, 'Elena', 'González', 'elenagonzalez@gmail.com'),
  (8, 'Miguel', 'Martínez', 'miguelmartinez@hotmail.com'),
  (9, 'Lucía', 'Sánchez', 'luciasanchez@yahoo.com'),
  (10, 'Antonio', 'Rodríguez', 'antoniorodriguez@gmail.com'),
  (11, 'Sofía', 'Fernández', 'sofiafernandez@hotmail.com'),
  (12, 'Pablo', 'García', 'pablogarcia@yahoo.com'),
  (13, 'María', 'Martínez', 'mariamartinez@gmail.com'),
  (14, 'Pedro', 'López', 'pedrolopez@hotmail.com'),
  (15, 'Laura', 'Ruiz', 'lauraruiz@yahoo.com');
 
    INSERT INTO Hospeda (idHospeda, idReserva, idHuesped,idHabitacion, fechaLlegada, fechaSalida)VALUES
    
     ('1', '2','3', '1','2023-05-01', '2023-05-03'),
    ('2', '4','5', '2','2023-05-02', '2023-05-04'),
    ('3', '6', '7','3','2023-05-03', '2023-05-05'),
    ('4', '8', '9', '4','2023-05-04', '2023-05-06'),
    ('5', '10', '11','5', '2023-05-05', '2023-05-07'),
    ('6', '12', '13', '6','2023-05-06', '2023-05-08'),
    ('7', '14', '15','7','2023-05-07', '2023-05-09'),
    ('8', '15', '12', '8','2023-05-08', '2023-05-10'),
    ('9', '1', '10', '8','2023-05-09', '2023-05-11'),
    ('10', '3', '1', '12','2023-05-10', '2023-05-12'),
    ('11', '5', '2', '3','2023-05-11', '2023-05-13'),
    ('12', '6', '4', '3','2023-05-12', '2023-05-14'),
    ('13', '7', '6', '9','2023-05-13', '2023-05-15'),
    ('14', '9', '8', '10','2023-05-14', '2023-05-16'),
    ('15', '11', '14', '11','2023-05-15', '2023-05-17');
INSERT INTO Habitación (idHabitación, tipoHabitación, disponibilidad, precioNoche, numero)VALUES
    (1, 'Individual', 1, 50, 101),
    (2, 'Individual', 1, 50, 102),
    (3, 'Individual', 1, 50, 103),
    (4, 'Individual', 1, 50, 104),
    (5, 'Doble', 1, 75, 201),
    (6, 'Doble', 1, 75, 202),
    (7, 'Doble', 1, 75, 203),
    (8, 'Doble', 1, 75, 204),
    (9, 'Suite', 1, 100, 301),
    (10, 'Suite', 1, 100, 302),
    (11, 'Suite', 1, 100, 303),
    (12, 'Suite', 1, 100, 304),
    (13, 'Presidencial', 1, 200, 401),
    (14, 'Presidencial', 0, 200, 402),
    (15, 'Presidencial', 0, 200, 403);




---10 consultas de la base de datos



--Consultar todas las reservas realizadas por un huésped en particular:
--Esta consulta devuelve todas las reservas realizadas por el 2 huésped específico, identificado por su ID.
SELECT * FROM Reserva WHERE idHuesped = 2;

--muestra todos los registros que tiena la tabla habitacion con todas las columnas  
SELECT * FROM  habitación ;

 -- Esta consulta selecciona el nombre de los métodos de pago disponibles en la base de datos.
SELECT metodopago.nombre FROM metodopago;

--Consultar el promedio de días de estadía de los huéspedes en el alojamiento
--Esta consulta devuelve el promedio de días de estadía de los huéspedes en el alojamiento, considerando la fecha de inicio y fin de cada reserva.
-- AVG = para sacar el promedio 
--DATEDIFF = Muestra el número de días entre dos fechas. 
SELECT AVG(DATEDIFF(fechaSalida, fechaLlegada) + 1)FROM reserva; 

 
-- obtiene la columna de  tipo de habitacion  de la tabla habitacion donde sea  Doble
 SELECT tipoHabitacion FROM  habitación WHERE tipoHabitacion = 'Doble';

-- Obtener todos los servicios ofrecidos por el hotel:

SELECT * FROM Servicio;

--Obtener todas las transacciones realizadas con un método de pago específico:

SELECT * FROM transaccion WHERE idMetodoPago= 1;

--Obtener todas las reservas que han sido realizadas por un recepcionista específico:

SELECT * FROM Reserva WHERE idRecepcionista = 3;

-- Obtener todas las transacciones realizadas en una reserva  4 en específico:

SELECT * FROM transaccion WHERE idReserva = 4
 
--solo se obtienen los datos que estan en las 2 columnas de la tabla servicios
SELECT idServicio, nombre FROM Servicio;

-- obtiene todas las columnas de la tabla habitacion donde el tipo de habitacion es individual
SELECT * FROM habitación WHERE tipoHabitacion = 'individual';








---10 consultas con empleando el uso de JOINS a la base de datos  -------------------------------------------------

-- se combina las tablas  habitacion y reserva  se basa en la columna idHabitacion

SELECT habitación.*,reserva.* FROM habitación INNER JOIN reserva on habitación.idHabitación= reserva.idHabitacion;


--Mostrar todos los servicios de hotel que se han reservado y su información de reserva correspondiente:
SELECT s.*, rs.cantidad, rs.precio_total, r.fechaLlegada, r.fechaSalida 
FROM Servicio s 
JOIN reserva_servicio rs 
ON s.idServicio = rs.idServicio 
JOIN Reserva r 
ON rs.idReserva = r.idReserva;
--Obtener el nombre del método de pago y el total pagado en una transacción específica:
SELECT mp.nombre, t.total
FROM transaccion t
JOIN metodopago mp ON t.idMetodoPago = mp.idMetodoPago
WHERE t.idTransaccion = 2;

--Obtener todas las reservas y sus transacciones (si existen):del lado izquierdo

SELECT * FROM reserva
LEFT JOIN transaccion ON reserva.idReserva = Transaccion.idReserva;


--se Obtiene todas las reservas con sus huéspedes y recepcionistas (si existen):
SELECT *
FROM reserva
LEFT JOIN hospeda ON reserva.idReserva = hospeda.idReserva
LEFT JOIN huesped ON hospeda.idHuesped = huesped.idHuesped
LEFT JOIN recepcionista ON reserva.idRecepcionista = recepcionista.idRecepcionista;

--se Obteiene  el nombre completo de los huéspedes que tienen reservas y la fecha de llegada:
SELECT H.nombre, H.apellido, R.fechaLlegada
FROM huesped h
INNER JOIN Hospeda HS ON H.idHuesped = HS.idHuesped
INNER JOIN Reserva R ON HS.idReserva = R.idReserva;

--se combinan las filas de ambas tablas de reserva y habitacion 

SELECT * FROM reserva JOIN habitación
on reserva.idHabitacion = habitación.idHabitación;

---se combinan todas las  filas de ambas tablas del metodo de pago y la transaccion
 SELECT * FROM  metodopago JOIN  transaccion 
 ON  metodopago.idMetodoPago = transaccion.idMetodoPago;



--Esta consulta devuelve la cantidad de reservas realizadas por cada huésped, mostrando su información.
--  COUNT= devuelve el número de elementos encontrados en el conjunto. 
SELECT huesped.*, COUNT(reserva.idReserva) AS cantidadReservas
FROM huesped
LEFT JOIN reserva ON huesped.idHuesped = reserva.idHuesped
GROUP BY huesped.idHuesped;

--esta consulta permite unir las dos tablas servicio y reserva servicio 
SELECT * FROM servicio
JOIN reserva_servicio ON servicio.idServicio =  reserva_servicio.idServicio
 