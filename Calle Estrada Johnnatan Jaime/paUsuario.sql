CREATE PROC paUsuarioListar @parametro VARCHAR(50)
AS
	SELECT usuario, clave, rol, usuarioRegistro
	FROM Usuario
	WHERE registroActivo=1 AND usuario+clave LIKE '%'+@parametro+'%'