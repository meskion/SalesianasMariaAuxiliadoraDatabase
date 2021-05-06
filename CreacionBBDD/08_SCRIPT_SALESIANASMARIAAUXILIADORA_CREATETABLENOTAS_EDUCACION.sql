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

-- CREACIÓN TABLA NOTAS.
-- Relación creada por la necesidad de relaciones N-M.
create table Notas (

	id_alumno varchar(9) not null,
	id_asig int not null,
	nota int,
	
	FOREIGN KEY(id_asig) REFERENCES Asignatura(id_asig),
	FOREIGN KEY(id_alumno) REFERENCES Alumno(nif)

);