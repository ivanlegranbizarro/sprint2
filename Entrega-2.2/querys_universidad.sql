-- Active: 1666782552703@@127.0.0.1@3306@universidad
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.tipo = 'alumno' ORDER BY persona.apellido1, persona.apellido2, persona.nombre; 

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo = 'alumno' AND persona.telefono IS NULL; 

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo = 'alumno' AND persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'; 

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo = 'profesor' AND persona.telefono IS NULL AND persona.nif LIKE '%K'; 

SELECT asignatura.nombre FROM asignatura WHERE asignatura.curso = 3 AND asignatura.cuatrimestre = 1 AND id_grado = 7; 

SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona INNER JOIN profesor ON persona.id = profesor.id_departamento INNER JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1, persona.apellido2, persona.nombre; 

SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura INNER JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id WHERE persona.nif = '26902806M'; 

SELECT DISTINCT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_departamento = asignatura.id_profesor WHERE asignatura.nombre = 'Grau en Enginyeria Informàtica (Pla 2015)'; 

SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019; 

SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_departamento LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre; 

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_departamento LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' AND departamento.nombre IS NULL; 

SELECT departamento.nombre FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento RIGHT JOIN persona ON profesor.id_departamento = persona.id WHERE persona.tipo = 'profesor' AND persona.nombre IS NULL; 

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_departamento = asignatura.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.nombre IS NULL; 

SELECT asignatura.nombre FROM asignatura RIGHT JOIN profesor ON asignatura.id_profesor = profesor.id_departamento RIGHT JOIN persona ON profesor.id_departamento = persona.id WHERE persona.tipo = 'profesor' AND persona.nombre IS NULL; 

SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_departamento = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio IS NULL AND curso_escolar.anyo_fin IS NULL; 

SELECT COUNT(*) FROM persona WHERE tipo = 'alumno'; 

SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'; 

SELECT departamento.nombre, COUNT(profesor.id_departamento) FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_departamento) DESC; 

SELECT departamento.nombre, COUNT(profesor.id_departamento) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre; 

SELECT grado.nombre, COUNT(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY COUNT(asignatura.id_grado) DESC; 

SELECT grado.nombre, COUNT(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id_grado) > 40; 

SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado INNER JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo; 

SELECT curso_escolar.anyo_inicio, COUNT( alumno_se_matricula_asignatura.id_alumno ) FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio; 

SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor GROUP BY persona.id, persona.nombre, persona.apellido1, persona.apellido2 ORDER BY COUNT(asignatura.id_profesor) DESC; 

SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = ( SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 'alumno' ); 

SELECT * FROM profesor WHERE id_departamento IS NOT NULL AND id_profesor NOT IN ( SELECT id_profesor FROM asignatura );