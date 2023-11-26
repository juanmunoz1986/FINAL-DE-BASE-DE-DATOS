-- database: /path/to/database.db




CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    FechaNacimiento DATE,
    ApellidoPaterno VARCHAR(255),
    ApellidoMaterno VARCHAR(255),
    Nombre VARCHAR(255),
    Email VARCHAR(255),
    Genero CHAR(1),
    Folio VARCHAR(255),
    ReferenciaBancaria VARCHAR(255),
    NombreUsuario VARCHAR(255),
    Contrasena VARCHAR(255)
);


CREATE TABLE Profesor (
    ProfesorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    ApellidoPaterno VARCHAR(255),
    ApellidoMaterno VARCHAR(255),
    NumeroPersonal VARCHAR(255),
    CedulaProfesional VARCHAR(255),
    NumeroTelefonico VARCHAR(255),
    CorreoElectronico VARCHAR(255),
    NombreUsuario VARCHAR(255),
    Contrasena VARCHAR(255)
);

CREATE TABLE Administrador (
    AdministradorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    ApellidoPaterno VARCHAR(255),
    ApellidoMaterno VARCHAR(255),
    CorreoElectronico VARCHAR(255),
    NombreUsuario VARCHAR(255),
    Contrasena VARCHAR(255)
);

CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Categoria VARCHAR(255),
    RutaContenido VARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
    Costo DECIMAL(10,2),
    ProfesorID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesor(ProfesorID)
);

CREATE TABLE Tarea (
    TareaID INT PRIMARY KEY,
    CursoID INT,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    FechaCreacion DATE,
    FechaEntrega DATE,
    Puntaje INT,
    ArchivoEstudiante VARCHAR(255),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);


CREATE TABLE ActividadNoEvaluable (
    ActividadID INT PRIMARY KEY,
    CursoID INT,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    FechaCreacion DATE,
    FechaTerminacion DATE,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);


CREATE TABLE Examen (
    ExamenID INT PRIMARY KEY,
    CursoID INT,
    Nombre VARCHAR(255),
    Calificacion DECIMAL(5,2),
    Puntaje INT,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);


CREATE TABLE CriterioEvaluacion (
    CriterioID INT PRIMARY KEY,
    CursoID INT,
    NombreCriterio VARCHAR(255),
    Porcentaje DECIMAL(5,2),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);


CREATE TABLE Pago (
    PagoID INT PRIMARY KEY,
    ClienteID INT,
    ReferenciaBancaria VARCHAR(255),
    Monto DECIMAL(10,2),
    Fecha DATE,
    Estado VARCHAR(255),
    CursoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);






CREATE TABLE Inscripcion (
    ClienteID INT,
    CursoID INT,
    PRIMARY KEY (ClienteID, CursoID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

CREATE TABLE ResultadoExamen (
    ResultadoExamenID INT PRIMARY KEY,
    ExamenID INT,
    ClienteID INT,
    CriterioID INT,
    Calificacion DECIMAL(5,2),
    FOREIGN KEY (ExamenID) REFERENCES Examen(ExamenID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (CriterioID) REFERENCES CriterioEvaluacion(CriterioID)
);



INSERT INTO Cliente (ClienteID, FechaNacimiento, ApellidoPaterno, ApellidoMaterno, Nombre, Email, Genero, Folio, ReferenciaBancaria, NombreUsuario, Contrasena) 
VALUES 
(1, '1990-01-01', 'Pérez', 'García', 'Juan', 'juan.perez@email.com', 'M', 'Folio1', 'RefBanc1', 'juanperez', 'password1'),
(2, '1992-02-02', 'López', 'Martínez', 'Laura', 'laura.lopez@email.com', 'F', 'Folio2', 'RefBanc2', 'lauralopez', 'password2'),
(3, '1988-03-03', 'Hernández', 'Jiménez', 'Carlos', 'carlos.hernandez@email.com', 'M', 'Folio3', 'RefBanc3', 'carloshernandez', 'password3'),
(4, '1995-04-04', 'Sánchez', 'Ruiz', 'Ana', 'ana.sanchez@email.com', 'F', 'Folio4', 'RefBanc4', 'anasanchez', 'password4'),
(5, '1991-05-05', 'Ramírez', 'Fernández', 'David', 'david.ramirez@email.com', 'M', 'Folio5', 'RefBanc5', 'davidramirez', 'password5'),
(6, '1989-06-06', 'Morales', 'Vázquez', 'Sofía', 'sofia.morales@email.com', 'F', 'Folio6', 'RefBanc6', 'sofiamorales', 'password6'),
(7, '1993-07-07', 'Torres', 'Castillo', 'Luis', 'luis.torres@email.com', 'M', 'Folio7', 'RefBanc7', 'luistorres', 'password7'),
(8, '1987-08-08', 'Gómez', 'López', 'Elena', 'elena.gomez@email.com', 'F', 'Folio8', 'RefBanc8', 'elenagomez', 'password8'),
(9, '1996-09-09', 'Ortiz', 'Méndez', 'Jorge', 'jorge.ortiz@email.com', 'M', 'Folio9', 'RefBanc9', 'jorgeortiz', 'password9'),
(10, '1994-10-10', 'Ruiz', 'González', 'Patricia', 'patricia.ruiz@email.com', 'F', 'Folio10', 'RefBanc10', 'patriciaruiz', 'password10');

INSERT INTO Profesor (ProfesorID, Nombre, ApellidoPaterno, ApellidoMaterno, NumeroPersonal, CedulaProfesional, NumeroTelefonico, CorreoElectronico, NombreUsuario, Contrasena) 
VALUES 
(1, 'María', 'González', 'Luna', '1001', 'CedProf1001', '5551001001', 'maria.gonzalez@email.com', 'mgonzalez', 'profpass1'),
(2, 'José', 'Martínez', 'Rojas', '1002', 'CedProf1002', '5551001002', 'jose.martinez@email.com', 'jmartinez', 'profpass2'),
(3, 'Ana', 'Pérez', 'Vega', '1003', 'CedProf1003', '5551001003', 'ana.perez@email.com', 'aperez', 'profpass3'),
(4, 'Carlos', 'Jiménez', 'Moreno', '1004', 'CedProf1004', '5551001004', 'carlos.jimenez@email.com', 'cjimenez', 'profpass4'),
(5, 'Luisa', 'Hernández', 'Cano', '1005', 'CedProf1005', '5551001005', 'luisa.hernandez@email.com', 'lhernandez', 'profpass5'),
(6, 'Fernando', 'García', 'Torres', '1006', 'CedProf1006', '5551001006', 'fernando.garcia@email.com', 'fgarcia', 'profpass6'),
(7, 'Elena', 'López', 'Santos', '1007', 'CedProf1007', '5551001007', 'elena.lopez@email.com', 'elopez', 'profpass7'),
(8, 'Ricardo', 'Gómez', 'Gil', '1008', 'CedProf1008', '5551001008', 'ricardo.gomez@email.com', 'rgomez', 'profpass8'),
(9, 'Laura', 'Díaz', 'Ortega', '1009', 'CedProf1009', '5551001009', 'laura.diaz@email.com', 'ldiaz', 'profpass9'),
(10, 'Sergio', 'Ruiz', 'Pérez', '1010', 'CedProf1010', '5551001010', 'sergio.ruiz@email.com', 'sruiz', 'profpass10');


INSERT INTO Curso (CursoID, Nombre, Categoria, RutaContenido, FechaInicio, FechaFin, Costo, ProfesorID) 
VALUES 
(1, 'Introducción a la Programación', 'Informática', '/ruta/programacion', '2023-01-15', '2023-06-15', 2500.00, 1),
(2, 'Historia del Arte', 'Arte', '/ruta/arte', '2023-02-01', '2023-07-01', 3500.00, 2),
(3, 'Matemáticas Básicas', 'Matemáticas', '/ruta/matematicas', '2023-03-10', '2023-08-10', 2200.00, 3),
(4, 'Física General', 'Ciencias', '/ruta/fisica', '2023-04-05', '2023-09-05', 4000.00, 4),
(5, 'Literatura Contemporánea', 'Literatura', '/ruta/literatura', '2023-05-20', '2023-10-20', 3000.00, 5),
(6, 'Fundamentos de Química', 'Química', '/ruta/quimica', '2023-06-15', '2023-11-15', 2000.00, 6),
(7, 'Biología Avanzada', 'Biología', '/ruta/biologia', '2023-07-01', '2023-12-01', 4500.00, 7),
(8, 'Economía para Principiantes', 'Economía', '/ruta/economia', '2023-08-10', '2024-01-10', 3800.00, 8),
(9, 'Bases de la Filosofía', 'Filosofía', '/ruta/filosofia', '2023-09-05', '2024-02-05', 1000.00, 9),
(10, 'Psicología Social', 'Psicología', '/ruta/psicologia', '2023-10-20', '2024-03-20', 5500.00, 10);


INSERT INTO Tarea (TareaID, CursoID, Nombre, Descripcion, FechaCreacion, FechaEntrega, Puntaje, ArchivoEstudiante) 
VALUES 
(1, 1, 'Tarea 1 de Programación', 'Resolver problemas básicos de programación', '2023-01-20', '2023-02-20', 100, '/archivos/tarea1.pdf'),
(2, 2, 'Ensayo de Historia del Arte', 'Escribir un ensayo sobre arte moderno', '2023-02-05', '2023-03-05', 100, '/archivos/tarea2.pdf'),
(3, 3, 'Ejercicios de Matemáticas', 'Resolver serie de ejercicios matemáticos', '2023-03-15', '2023-04-15', 100, '/archivos/tarea3.pdf'),
(4, 4, 'Informe de Física', 'Realizar un informe sobre física cuántica', '2023-04-10', '2023-05-10', 100, '/archivos/tarea4.pdf'),
(5, 5, 'Análisis Literario', 'Análisis de una obra literaria contemporánea', '2023-05-25', '2023-06-25', 100, '/archivos/tarea5.pdf'),
(6, 6, 'Experimento de Química', 'Describir procedimiento y resultados de un experimento', '2023-06-20', '2023-07-20', 100, '/archivos/tarea6.pdf'),
(7, 7, 'Investigación de Biología', 'Presentar una investigación sobre un tema biológico', '2023-07-05', '2023-08-05', 100, '/archivos/tarea7.pdf'),
(8, 8, 'Proyecto de Economía', 'Desarrollar un pequeño proyecto de economía', '2023-08-15', '2023-09-15', 100, '/archivos/tarea8.pdf'),
(9, 9, 'Reflexión Filosófica', 'Escribir una reflexión sobre un tema filosófico', '2023-09-10', '2023-10-10', 100, '/archivos/tarea9.pdf'),
(10, 10, 'Estudio de Caso en Psicología', 'Analizar un estudio de caso en psicología social', '2023-10-25', '2023-11-25', 100, '/archivos/tarea10.pdf');

INSERT INTO ActividadNoEvaluable (ActividadID, CursoID, Nombre, Descripcion, FechaCreacion, FechaTerminacion) 
VALUES 
(1, 1, 'Foro de Introducción', 'Foro de presentación y discusión de expectativas', '2023-01-20', '2023-01-27'),
(2, 2, 'Foro de Arte Moderno', 'Debate sobre el arte moderno y sus influencias', '2023-02-05', '2023-02-12'),
(3, 3, 'Matemáticas en la Vida Diaria', 'Discusión sobre aplicaciones prácticas de las matemáticas', '2023-03-15', '2023-03-22'),
(4, 4, 'Debate de Física Cuántica', 'Espacio para discutir conceptos de física cuántica', '2023-04-10', '2023-04-17'),
(5, 5, 'Chat de Literatura', 'Sala de chat para discutir sobre autores contemporáneos', '2023-05-25', '2023-06-01'),
(6, 6, 'Foro de Química', 'Foro para compartir experimentos y resultados', '2023-06-20', '2023-06-27'),
(7, 7, 'Biología y Tecnología', 'Discusión sobre el avance tecnológico en la biología', '2023-07-05', '2023-07-12'),
(8, 8, 'Economía en tu día a día', 'Foro para discutir cómo la economía afecta la vida cotidiana', '2023-08-15', '2023-08-22'),
(9, 9, 'Filosofía en el Mundo Actual', 'Debate sobre la relevancia de la filosofía hoy', '2023-09-10', '2023-09-17'),
(10, 10, 'Psicología Social en Práctica', 'Foro para discutir casos prácticos de psicología social', '2023-10-25', '2023-11-01');

INSERT INTO Examen (ExamenID, CursoID, Nombre, Calificacion, Puntaje) 
VALUES 
(1, 1, 'Examen Final de Programación', 0.0, 100),
(2, 2, 'Examen de Historia del Arte', 0.0, 100),
(3, 3, 'Examen de Matemáticas', 0.0, 100),
(4, 4, 'Examen de Física', 0.0, 100),
(5, 5, 'Examen de Literatura', 0.0, 100),
(6, 6, 'Examen de Química', 0.0, 100),
(7, 7, 'Examen de Biología', 0.0, 100),
(8, 8, 'Examen de Economía', 0.0, 100),
(9, 9, 'Examen de Filosofía', 0.0, 100),
(10, 10, 'Examen de Psicología', 0.0, 100);


INSERT INTO CriterioEvaluacion (CriterioID, CursoID, NombreCriterio, Porcentaje) 
VALUES 
(1, 1, 'Exámenes', 40.0),
(2, 1, 'Tareas', 30.0),
(3, 1, 'Proyecto final', 30.0),

(4, 2, 'Exámenes', 35.0),
(5, 2, 'Tareas', 35.0),
(6, 2, 'Proyecto final', 30.0),

(7, 3, 'Exámenes', 50.0),
(8, 3, 'Tareas', 25.0),
(9, 3, 'Proyecto final', 25.0),

(10, 4, 'Exámenes', 30.0),
(11, 4, 'Tareas', 40.0),
(12, 4, 'Proyecto final', 30.0),

(13, 5, 'Exámenes', 50.0),
(14, 5, 'Tareas', 20.0),
(15, 5, 'Proyecto final', 30.0),

(16, 6, 'Exámenes', 30.0),
(17, 6, 'Tareas', 40.0),
(18, 6, 'Proyecto final', 30.0),

(19, 7, 'Exámenes', 40.0),
(20, 7, 'Tareas', 30.0),
(21, 7, 'Proyecto final', 30.0),

(22, 8, 'Exámenes', 35.0),
(23, 8, 'Tareas', 35.0),
(24, 8, 'Proyecto final', 30.0),

(25, 9, 'Exámenes', 50.0),
(26, 9, 'Tareas', 25.0),
(27, 9, 'Proyecto final', 25.0),

(28, 10, 'Exámenes', 30.0),
(29, 10, 'Tareas', 40.0),
(30, 10, 'Proyecto final', 30.0);

INSERT INTO Pago (PagoID, ClienteID, ReferenciaBancaria, Monto, Fecha, Estado, CursoID) 
VALUES 
(1, 1, 'Ref1001', 300.00, '2023-01-10', 'Pagado', 1),
(2, 2, 'Ref1002', 350.00, '2023-01-12', 'Pagado', 2),
(3, 3, 'Ref1003', 400.00, '2023-01-15', 'Pagado', 3),
(4, 4, 'Ref1004', 450.00, '2023-01-18', 'Pagado', 4),
(5, 5, 'Ref1005', 300.00, '2023-01-20', 'Pagado', 5),
(6, 6, 'Ref1006', 350.00, '2023-01-22', 'Pagado', 5),
(7, 7, 'Ref1007', 400.00, '2023-01-25', 'Pagado', 4),
(8, 8, 'Ref1008', 450.00, '2023-01-28', 'Pagado', 4);


INSERT INTO Pago (PagoID, ClienteID, ReferenciaBancaria, Monto, Fecha, Estado, CursoID)
VALUES
(9, 9, 'Ref1009', 1000.00 ,null, 'Pendiente', 3),
(10, 10, 'Ref1010', 5500.00, null, 'Pendiente', 2);



INSERT INTO Inscripcion (ClienteID, CursoID) 
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),

(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),

(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),

(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),

(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),

(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),

(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),

(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),

(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),

(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10);



INSERT INTO Administrador (AdministradorID, Nombre, ApellidoPaterno, ApellidoMaterno, CorreoElectronico, NombreUsuario, Contrasena) 
VALUES 
(1, 'Roberto', 'González', 'Mendez', 'roberto.gonzalez@email.com', 'rgonzalez', 'adminpass1'),
(2, 'Luisa', 'Fernández', 'Pérez', 'luisa.fernandez@email.com', 'lfernandez', 'adminpass2'),
(3, 'Carlos', 'Martínez', 'Ruiz', 'carlos.martinez@email.com', 'cmartinez', 'adminpass3'),
(4, 'Ana', 'Jiménez', 'López', 'ana.jimenez@email.com', 'ajimenez', 'adminpass4'),
(5, 'Sofía', 'García', 'Morales', 'sofia.garcia@email.com', 'sgarcia', 'adminpass5');


INSERT INTO ResultadoExamen (ResultadoExamenID, ExamenID, ClienteID, CriterioID, Calificacion)
VALUES
(1, 10, 7, 1, 5.14),
(2, 4, 7, 3, 2.64),
(3, 1, 10, 3, 8.69),
(4, 3, 3, 4, 4.75),
(5, 9, 1, 3, 0.51),
(6, 5, 6, 5, 9.96),
(7, 8, 2, 2, 7.7),
(8, 3, 2, 5, 9.74),
(9, 1, 7, 2, 4.58),
(10, 1, 9, 3, 2.31),
(11, 7, 8, 3, 4.14),
(12, 6, 7, 5, 4.96),
(13, 5, 4, 1, 5.5),
(14, 1, 3, 4, 1.8),
(15, 1, 1, 5, 3.41),
(16, 1, 9, 1, 7.98),
(17, 2, 2, 2, 7.54),
(18, 10, 4, 3, 6.09),
(19, 7, 9, 4, 0.9),
(20, 9, 8, 2, 8.19);



SELECT *
FROM Cliente
ORDER BY ApellidoPaterno;


SELECT 
    Cliente.Nombre, 
    Cliente.ApellidoPaterno, 
    Cliente.ApellidoMaterno, 
    Cliente.ClienteID AS Matricula, 
    Curso.Nombre AS NombreCurso
FROM 
    Cliente
JOIN 
    Inscripcion ON Cliente.ClienteID = Inscripcion.ClienteID
JOIN 
    Curso ON Inscripcion.CursoID = Curso.CursoID;



SELECT 
    Cliente.Nombre, 
    Cliente.ApellidoPaterno, 
    Cliente.ApellidoMaterno, 
    Cliente.ClienteID AS Matricula, 
    Curso.Nombre AS NombreCurso
FROM 
    Cliente, Curso
WHERE 
    EXISTS (
        SELECT 1 
        FROM Inscripcion 
        WHERE Cliente.ClienteID = Inscripcion.ClienteID AND Curso.CursoID = Inscripcion.CursoID
    );


SELECT 
    Profesor.NumeroPersonal, 
    Profesor.Nombre, 
    Profesor.ApellidoPaterno, 
    Profesor.ApellidoMaterno, 
    Curso.Nombre AS NombreCurso
FROM 
    Profesor
JOIN 
    Curso ON Profesor.ProfesorID = Curso.ProfesorID;


SELECT 
    Profesor.NumeroPersonal, 
    Profesor.Nombre, 
    Profesor.ApellidoPaterno, 
    Profesor.ApellidoMaterno, 
    Curso.Nombre AS NombreCurso
FROM 
    Profesor, Curso
WHERE 
    Profesor.ProfesorID = Curso.ProfesorID;



SELECT 
    c.Nombre, 
    c.ApellidoPaterno, 
    c.ApellidoMaterno, 
    c.ClienteID AS Matricula, 
    cu.Nombre AS NombreCurso, 
    re.Calificacion
FROM 
    Cliente c, 
    Curso cu, 
    Inscripcion i, 
    Examen e, 
    ResultadoExamen re
WHERE 
    c.ClienteID = i.ClienteID AND 
    i.CursoID = cu.CursoID AND 
    e.CursoID = cu.CursoID AND 
    re.ExamenID = e.ExamenID AND 
    re.ClienteID = c.ClienteID;


SELECT 
    c.Nombre, 
    c.ApellidoPaterno, 
    c.ApellidoMaterno, 
    c.ClienteID AS Matricula, 
    cu.Nombre AS NombreCurso, 
    re.Calificacion
FROM 
    Cliente c
JOIN 
    Inscripcion i ON c.ClienteID = i.ClienteID
JOIN 
    Curso cu ON i.CursoID = cu.CursoID
JOIN 
    Examen e ON cu.CursoID = e.CursoID
JOIN 
    ResultadoExamen re ON c.ClienteID = re.ClienteID AND e.ExamenID = re.ExamenID;


SELECT 
    Nombre AS NombreCurso, 
    Categoria
FROM 
    Curso
ORDER BY 
    Categoria;


SELECT 
    Curso.Nombre AS NombreCurso,
    Curso.Costo
FROM
  Curso
WHERE
    Curso.Costo > 2000 AND Curso.Costo < 4000 
ORDER BY
    Curso.Costo DESC;  


SELECT 
    Cliente.Nombre, 
    Cliente.ApellidoPaterno, 
    Cliente.ApellidoMaterno, 
    Cliente.Email, 
    Curso.Nombre AS NombreCurso,
    Cliente.ClienteID AS ID
FROM
    Cliente 
JOIN
    Inscripcion ON Cliente.ClienteID = Inscripcion.ClienteID
JOIN
    Curso ON Inscripcion.CursoID = Curso.CursoID
LEFT JOIN 
    Pago ON Cliente.ClienteID = Pago.ClienteID AND Inscripcion.CursoID = Pago.CursoID
WHERE
    Pago.Estado = 'Pendiente';


SELECT 
    Cliente.Nombre, 
    Cliente.ApellidoPaterno, 
    Cliente.ApellidoMaterno, 
    Cliente.Email, 
    Curso.Nombre AS NombreCurso
FROM
    Cliente, Inscripcion, Curso, Pago
WHERE
    Cliente.ClienteID = Inscripcion.ClienteID AND
    Inscripcion.CursoID = Curso.CursoID AND
    Cliente.ClienteID = Pago.ClienteID AND
    Inscripcion.CursoID = Pago.CursoID AND
    Pago.Estado = 'Pendiente';


SELECT
    Curso.Nombre AS NombreCurso,
    Curso.Categoria
FROM
    Curso
WHERE
    Curso.Categoria = 'Administracion' ;    


SELECT
    Tarea.Nombre,
    Curso.Nombre AS NombreCurso
FROM
    Tarea
JOIN
    Curso ON Tarea.CursoID = Curso.CursoID
WHERE
    Curso.CursoID = 3 OR Curso.CursoID = 4 ;   



SELECT
    Tarea.Nombre,
    Curso.Nombre AS NombreCurso
FROM
    Tarea, Curso

WHERE
    Tarea.CursoID = Curso.CursoID AND
    (Curso.CursoID = 3 OR Curso.CursoID = 4) ;        



SELECT
    Curso.Nombre AS NombreCurso,
    Examen.Nombre AS NombreExamen
FROM
    Curso
JOIN
    Examen ON Curso.CursoID = Examen.CursoID
WHERE
    Curso.CursoID = 7
    OR Curso.CursoID = 8
    OR Curso.CursoID = 6 
    OR Curso.CursoID = 5 ;        
    

SELECT
    Curso.Nombre AS NombreCurso,
    Examen.Nombre AS NombreExamen
FROM
    Curso, Examen
WHERE
    Curso.CursoID = Examen.CursoID AND
    (Curso.CursoID = 7 OR 
    Curso.CursoID = 8 OR 
    Curso.CursoID = 6 OR 
    Curso.CursoID = 5) ;
