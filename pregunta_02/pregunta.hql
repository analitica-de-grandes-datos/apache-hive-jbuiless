/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS result2;
CREATE TABLE data (line STRING);
CREATE TABLE result2(letter STRING, fecha date, value int);
LOAD DATA LOCAL INPATH "pregunta_02/SOURCE/" OVERWRITE INTO TABLE data;
 
INSERT INTO result2
SELECT split(line, '\\s')[0] AS letter, split(line, '\\s')[1] AS fecha, split(line, '\\s')[2] AS value FROM data;

SELECT * FROM result2 ORDER BY letter, value;

