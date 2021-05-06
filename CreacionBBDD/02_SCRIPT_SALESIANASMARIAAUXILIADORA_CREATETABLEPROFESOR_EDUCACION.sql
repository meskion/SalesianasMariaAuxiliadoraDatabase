------------------------------------------------------
-- Autor: TeamSalesianas
-- Participantes: 
-- Javier Campos, 
-- Manuel Fernandez de Heredia,
-- Raquel Díaz,
-- Andrés Ruiz,
-- Javier Ramos,
-- Javier Esmerado
--
-- Descripción : Script para la creación de la base de datos.
------------------------------------------------------

-- CREACIÓN TABLA PROFESOR.
CREATE TABLE Profesor (
	
	nif varchar(9) NOT NULL,
	nombre VARCHAR(35),
	salario double,
	
	PRIMARY KEY(nif)
);