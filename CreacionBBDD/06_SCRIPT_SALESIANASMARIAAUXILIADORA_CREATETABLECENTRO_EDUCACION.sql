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

-- CREACIÓN TABLA CENTRO.
create table Centro(

	id_centro int not null,
	localidad varchar(45),
	nombre varchar(45),
	
	primary key(id_centro)

);