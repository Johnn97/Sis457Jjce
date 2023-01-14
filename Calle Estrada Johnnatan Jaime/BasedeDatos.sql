﻿CREATE DATABASE FinalSis457jjce
USE [master]
GO
CREATE LOGIN [usrfinal] WITH PASSWORD=N'12345678',
	DEFAULT_DATABASE=[FinalSis457jjce],
	CHECK_EXPIRATION=OFF,
	CHECK_POLICY=ON 
GO
USE [FinalSis457jjce]
GO 
CREATE USER [usrfinal] FOR LOGIN [usrfinal]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrfinal]
GO