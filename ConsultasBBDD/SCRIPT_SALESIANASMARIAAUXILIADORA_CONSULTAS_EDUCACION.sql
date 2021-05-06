
	-- Consultas sencillas
	
	-- Count
	-- Cuenta los alumnos que tengan mas de 20 años
	SELECT COUNT(a.nombre) FROM alumno a WHERE a.edad > 20;
	
	-- Count
	-- Cuenta cantidad de Centros cuya localidad es SEVILLA  
	SELECT count(nombre) FROM centro WHERE localidad = "Sevilla"
	
	-- Like
	-- Haya aquellos nombre que empiezan por la letra A
	SELECT nombre FROM alumno WHERE nombre LIKE "A%";
	
	-- Between
	-- Haya el nombre de los profesores, de los cuales su salario se comprenda entre 1000€ y 1500€
	SELECT nombre FROM profesor WHERE salario BETWEEN 1000 AND 1500;
	
	-- AVG
	-- Haya la media de las notas
	SELECT avg(nota) FROM notas;
	
	-- IN 
	-- Haya el nombre del alumno y el id del centro que la localidad sea Sevilla o Cádiz
	SELECT alumno.nombre,alumno.id_centro FROM alumno JOIN centro ON alumno.id_centro = centro.id_centro WHERE localidad IN ("Sevilla", "Cadiz");
	
	-- NOT IN 
	-- Haya el nombre del alumno y la id del centro, cuya localidad no sea ni Sevilla ni Cádiz
	SELECT alumno.nombre,alumno.id_centro FROM alumno JOIN centro ON alumno.id_centro = centro.id_centro WHERE localidad NOT IN ("Sevilla", "Cadiz");
	
	
	-- Consultas medias [GROUP BY, HAVING]
	
	
	-- Haya el nombre del alumno que tenga la nota más alta, y el que tenga la nota más baja
	SELECT alumno.nombre,notas.nota FROM notas JOIN alumno ON notas.id_alumno = alumno.nif WHERE id_asig = 11 and (notas.nota = (SELECT min(nota) FROM notas) or notas.nota = (SELECT max(nota) FROM notas)) GROUP BY notas.nota;
	
	-- Haya el nombre del alumno que tenga como modalidad Desarrollo Web y ese resultado agruparlo por la edad del alumno
	SELECT a.nombre FROM alumno a, centro c WHERE a.id_centro = c.id_centro AND c.localidad =(SELECT localidad FROM centro WHERE nombre = "IES Alixar") GROUP BY a.edad;
	
	-- Haya el nombre del alumno y la nota, donde la ID de asignatura sea 11 y agrupalos por aquellos que están aprobados
	SELECT alumno.nombre,notas.nota FROM notas JOIN alumno ON notas.id_alumno = alumno.nif WHERE id_asig = 11 GROUP BY notas.nota HAVING notas.nota>5;
	
	-- Muestra una lista de alumnos mayores de edad, agrupados por centro y ordenados de menor a mayor por su edad
	SELECT nombre,id_centro,nif,edad FROM alumno WHERE edad > 17 GROUP BY id_centro ORDER BY edad;

	-- Muestra los centro que contengan más de 10 alumnos
	SELECT * FROM centro INNER JOIN alumno ON centro.id_centro=alumno.id_centro GROUP BY alumno.id_centro HAVING COUNT(alumno.id_centro)>10;

	-- Muestra el nombre de la asignatura, los participantes y la media de sus notas si la asignatura tiene más de 40 aprobados.
	SELECT asignatura.nombre, COUNT(alumno.nif), avg(notas.nota) FROM alumno JOIN notas ON alumno.nif=notas.id_alumno JOIN asignatura ON notas.id_asig=asignatura.id_asig GROUP BY asignatura.nombre HAVING (SELECT COUNT(asignatura.id_asig) FROM asignatura JOIN notas ON asignatura.id_asig=notas.id_asig WHERE notas.nota=4)> 40;

	-- Muestra los profesores que cobran más de 1100 euros
	SELECT nombre FROM profesor GROUP BY salario HAVING salario >1100

	-- Muestra el total de alumnos que están matriculados en la modalidad "Desarrollo web"
	SELECT matricula.modalidad,count(alumno.nombre) FROM alumno JOIN matricula ON alumno.n_matricula = matricula.n_matricula GROUP BY matricula.modalidad HAVING matricula.modalidad='Desarrollo web'

	-- Muestra las asignaturas cuya media de notas supera el 5.5
	SELECT asignatura.nombre, avg(notas.nota) FROM notas JOIN asignatura ON notas.id_asig=asignatura.id_asig  GROUP BY asignatura.nombre HAVING AVG(notas.nota) >5.5;
	
	
	-- Consultas complejas
	
	
	-- JOIN / INNER JOIN
	-- Selecciona a aquellos alumnos que sean mayores de edad y que cursen en el colegio Salesianas María Auxiliadora:
	SELECT a.nombre FROM alumno a JOIN centro c ON a.id_centro = c.id_centro WHERE a.edad >= 18 AND c.nombre = "Salesianas María Auxiliadora";
	
	-- ¿ Cómo se haría con el where ?
	SELECT a.nombre FROM alumno a, centro c WHERE a.id_centro = c.id_centro AND a.edad >= 18 AND c.nombre = "Salesianas María Auxiliadora";
	
	-- Left Join
	-- Muestra los alumnos que tengan + de un 5 en la asignatura con id 14
	SELECT alumno.nombre FROM alumno LEFT JOIN notas ON alumno.nif = notas.id_alumno WHERE id_asig = 14 GROUP BY notas.nota HAVING notas.nota>5;

	-- Left Join
	-- Muestra los alumnos matriculados, cuyo nombre sea David o Manuel
	SELECT alumno.nombre FROM alumno LEFT JOIN matricula ON alumno.n_matricula = matricula.n_matricula WHERE alumno.nombre LIKE "David%" or alumno.nombre LIKE "Manuel%";
	
	-- Right Join
	-- Muestra los alumnos junto con el numero de notas aprobadas en todas las asignaturas, ordendados por mayor numero de notas aprobadas.
	SELECT a.nombre ,COUNT(n.nota) FROM notas n RIGHT JOIN alumno a ON a.nif= n.id_alumno WHERE n.nota >= 5 GROUP BY a.nombre ORDER BY n.nota DESC;


