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

-- CREACIÓN TABLA ASIG-PROF.
-- Tabla creado por la necesidad de una relación N-M.
CREATE TABLE RelacionAsigProf (
	
	id_prof varchar(9) NOT NULL,
	id_asig int not null,
	
	FOREIGN KEY(id_prof) REFERENCES Profesor(nif),
	FOREIGN KEY(id_asig) REFERENCES Asignatura(id_asig)
);