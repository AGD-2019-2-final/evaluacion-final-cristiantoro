-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS data;

CREATE TABLE data (letra       STRING,
                   fecha       STRING,
                   numero      INT
                  )

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE
INTO TABLE data;

DROP TABLE IF EXISTS val_peque;

CREATE TABLE val_peque
AS
SELECT DISTINCT numero
FROM data
ORDER BY numero
LIMIT 5;
    
INSERT OVERWRITE LOCAL DIRECTORY 'output'
SELECT * FROM val_peque;