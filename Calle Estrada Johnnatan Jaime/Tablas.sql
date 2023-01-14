CREATE TABLE Serie (
	id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	titulo VARCHAR (250) NOT NULL,
	sinopsis VARCHAR (5000) NOT NULL, 
	director VARCHAR (100) NOT NULL,
	duracion INT NOT NULL,
	fechaEstreno DATE NOT NULL,
	registroActivo BIT NULL DEFAULT 1
)
ALTER TABLE Serie ADD usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_NAME();

CREATE PROC paSerieListar @parametro VARCHAR(50)
AS
	SELECT id, titulo, sinopsis, director, duracion, fechaEstreno, usuarioRegistro
	FROM Serie
	WHERE registroActivo=1 AND titulo+sinopsis LIKE '%'+@parametro+'%'
EXECUTE paSerieListar ''



INSERT INTO Serie(titulo, sinopsis, director, duracion, fechaEstreno)
VALUES ('Dhamer', 'La miniserie relata la vida del asesino Jeffrey Dahmer, y explora los diferentes motivos que
probablemente lo llevaron a convertirse en uno de los asesinos en serie más famosos de los Estados Unidos. A lo largo 
de la serie se exploran vivencias de su infancia y adolescencia, influenciadas por un padre ausente y una madre 
drogadicta.', 'David Jacobson', '102', '2022-09-21');

INSERT INTO Serie(titulo, sinopsis, director, duracion, fechaEstreno)
VALUES ('Merlina', 'Merlina Addams es la siniestra hija mayor de la familia Addams. Al comenzar su adolescencia, es 
ingresada a la peculiar Academia Nevermore donde buscará sobresalir como estudiante.
Sin embargo, deberá enfrentarse a su recién descubierta habilidad psíquica para "impedir una serie de asesinatos que 
tiene en jaque a la comunidad local e intenta descubrir qué pasó con sus padres 25 años atrás".', 
'Tim Burton', '59', '2022-11-23');



CREATE TABLE Usuario (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	usuario VARCHAR(12) NOT NULL,
	clave VARCHAR(250) NOT NULL,
	rol VARCHAR(20) NOT NULL,
	registroActivo BIT NULL DEFAULT 1
)
ALTER TABLE Usuario ADD usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_NAME();

INSERT INTO Usuario (usuario, clave, rol)
VALUES ('Johnnatan', 'johnn123', 'informatico');

INSERT INTO Usuario (usuario, clave, rol)
VALUES ('Jaime', 'jai456', 'ingeniero mecanico');

INSERT INTO Usuario (usuario, clave, rol)
VALUES ('Mizael', 'miz789', 'Médico General');

INSERT INTO Usuario (usuario, clave, rol)
VALUES ('Raquel', 'ra123', 'Contadora');

INSERT INTO Usuario (usuario, clave, rol)
VALUES ('Claudia', 'clau456', 'Secretaria');