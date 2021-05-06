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

-- CREACIÓN TABLA MATRICULA.
create table Matricula(

	n_matricula int not null,
	fecha_matricula date,
	modalidad varchar(45),
	
	primary key(n_matricula)

);