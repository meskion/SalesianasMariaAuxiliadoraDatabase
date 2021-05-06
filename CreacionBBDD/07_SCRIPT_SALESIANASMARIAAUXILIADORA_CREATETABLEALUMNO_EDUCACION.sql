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

-- CREACIÓN TABLA ALUMNO.
create table Alumno (

	nif varchar(9) NOT NULL,
	nombre varchar(45),
	id_centro int not null,
	n_matricula int not null,
	edad int,
	
	primary key(nif),
	FOREIGN KEY(id_centro) REFERENCES Centro(id_centro),
	FOREIGN KEY(n_matricula) REFERENCES Matricula(n_matricula)
);