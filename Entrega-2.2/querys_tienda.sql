

SELECT nombre FROM producto;


SELECT nombre, precio FROM producto;


SELECT * FROM producto;


SELECT nombre, precio, precio * 1.12 FROM producto;


SELECT
    nombre AS 'nom de producto',
    precio AS euros,
    precio * 1.12 AS dòlars
FROM producto;


SELECT UPPER(nombre), precio FROM producto;


SELECT LOWER(nombre), precio FROM producto;


SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;


SELECT nombre, ROUND(precio) FROM producto;


SELECT nombre, TRUNCATE(precio, 0) FROM producto;


SELECT codigo_fabricante FROM producto;


SELECT DISTINCT codigo_fabricante FROM producto;


SELECT nombre FROM fabricante ORDER BY nombre ASC;


SELECT nombre FROM fabricante ORDER BY nombre DESC;


SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;


SELECT * FROM fabricante LIMIT 5;


SELECT * FROM fabricante LIMIT 3, 2;


SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;


SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;


SELECT nombre FROM producto WHERE codigo_fabricante = 2;


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;


SELECT
    p.codigo,
    p.nombre,
    f.codigo,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio
LIMIT 1;


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre = 'Crucial'
    AND p.precio > 200;


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre = 'Asus'
    OR f.nombre = 'Hewlett-Packard'
    OR f.nombre = 'Seagate';


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre IN (
        'Asus',
        'Hewlett-Packard',
        'Seagate'
    );


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY
    p.precio DESC,
    p.nombre;


SELECT f.codigo, f.nombre
FROM fabricante f
    INNER JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;


SELECT
    f.codigo,
    f.nombre,
    p.codigo,
    p.nombre
FROM fabricante f
    LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
ORDER BY f.codigo;


SELECT
    f.codigo,
    f.nombre,
    p.codigo,
    p.nombre
FROM fabricante f
    LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL
ORDER BY f.codigo;


SELECT
    p.codigo,
    p.nombre,
    p.precio,
    f.codigo,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';


SELECT
    p.codigo,
    p.nombre,
    p.precio,
    f.codigo,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre = 'Lenovo'
    AND p.precio = (
        SELECT MAX(precio)
        FROM producto
        WHERE
            codigo_fabricante = (
                SELECT codigo
                FROM
                    fabricante
                WHERE
                    nombre = 'Lenovo'
            )
    );


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre = 'Lenovo'
    AND p.precio = (
        SELECT MAX(precio)
        FROM producto
        WHERE
            codigo_fabricante = (
                SELECT codigo
                FROM
                    fabricante
                WHERE
                    nombre = 'Lenovo'
            )
    );


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre = 'Hewlett-Packard'
    AND p.precio = (
        SELECT MIN(precio)
        FROM producto
        WHERE
            codigo_fabricante = (
                SELECT codigo
                FROM
                    fabricante
                WHERE
                    nombre = 'Hewlett-Packard'
            )
    );


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= (
        SELECT MAX(precio)
        FROM producto
        WHERE
            codigo_fabricante = (
                SELECT codigo
                FROM
                    fabricante
                WHERE
                    nombre = 'Lenovo'
            )
    );


SELECT
    p.nombre,
    p.precio,
    f.nombre
FROM producto p
    INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.nombre = 'Asus'
    AND p.precio > (
        SELECT AVG(precio)
        FROM producto
        WHERE
            codigo_fabricante = (
                SELECT codigo
                FROM
                    fabricante
                WHERE
                    nombre = 'Asus'
            )
    );